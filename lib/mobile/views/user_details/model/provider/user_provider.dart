import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../services/firebase_services.dart';
import '../user_model.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  User? _user;

  User? get user => _user;

  Future<void> fetchUserData(String email) async {
    _user = await _userService.fetchUserData(email);
    notifyListeners();
  }

  Future<void> saveUserData({
    required String name,
    required String username,
    required String email,
    required File imageFile,
    required BuildContext context,
  }) async {
    User user = User(
      name: name,
      username: username,
      email: email,
      imageUrl: '',
      level: 1,
      coin: 8000,
    );
    await _userService.saveUserData(user, imageFile, context);
    _user = user;
    notifyListeners();
  }
}
