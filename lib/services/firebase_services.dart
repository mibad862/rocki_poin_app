import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class FirebaseServices {
  Future<String?> uploadImage(File imageFile, String email) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('user_images/$email');
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Failed to upload image: $e');
      return null;
    }
  }

  Future<void> saveUserData({
    required String name,
    required String username,
    required String email,
    required String imageUrl,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_details')
          .doc(email)
          .set({
        'name': name,
        'username': username,
        'email': email,
        'image_url': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved successfully!')),
      );
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save user data: $e')),
      );
    }
  }
}
