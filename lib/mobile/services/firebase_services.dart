import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/user_details/model/user_model.dart';
import '../views/welcome_bonus/welcome_bonus_screen.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // For fetching user information
  Future<User?> fetchUserData(String email) async {
    try {
      final doc = await _firestore.collection('user_details').doc(email).get();
      if (doc.exists) {
        return User.fromMap(doc.data()!, email);
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
    return null;
  }

  // For uploading user image to Firebase Storage
  Future<String?> uploadImage(File imageFile, String email) async {
    try {
      final storageRef = _storage.ref().child('user_images/$email');
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Failed to upload image: $e');
      return null;
    }
  }

  // For saving user data
  Future<void> saveUserData(
      User user, File imageFile, BuildContext context) async {
    try {
      final imageUrl = await uploadImage(imageFile, user.email);
      if (imageUrl != null) {
        user = User(
          name: user.name,
          username: user.username,
          email: user.email,
          imageUrl: imageUrl,
          level: user.level,
          coin: user.coin,
        );
        await _firestore
            .collection('user_details')
            .doc(user.email)
            .set(user.toMap());

        // Save email in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', user.email);

        Navigator.pushNamed(context, WelcomeBonusScreen.routeName);
      }
    } catch (e) {
      print('Failed to save user data: $e');
    }
  }

  // For retrieving user email from shared preferences
  Future<String?> getUserEmailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }
}
