import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rocki_poin_app/services/user_session.dart';
import 'package:rocki_poin_app/views/welcome_bonus/welcome_bonus_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/user_details/model/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // For fetching user information
  Future<User?> fetchUserData() async {
    try {
      String? userId = await UserSession.getUserId();
      if (userId == null) return null;

      final doc = await _firestore.collection('user_details').doc(userId).get();
      if (doc.exists) {
        return User.fromMap(doc.data()!, userId);
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
    return null;
  }

  // For uploading user image to Firebase Storage
  Future<String?> uploadImage(File imageFile) async {
    try {
      String? userId = await UserSession.getUserId();
      if (userId == null) return null;

      final storageRef = _storage.ref().child('user_images/$userId');
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
      final imageUrl = await uploadImage(imageFile);
      if (imageUrl != null) {
        String? userId = await UserSession.getUserId();
        if (userId == null) return;

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
            .doc(userId)
            .set(user.toMap());

        // Save userId in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', userId);

        Navigator.pushNamed(context, WelcomeBonusScreen.routeName);
      }
    } catch (e) {
      print('Failed to save user data: $e');
    }
  }

  // For retrieving user email from shared preferences
  Future<String?> getUserIdFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }
}
