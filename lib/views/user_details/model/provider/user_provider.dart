import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rocki_poin_app/views/user_details/model/user_model.dart';
import '../../../../services/firebase_services.dart';


class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  User? _user;

  User? get user => _user;

  Future<void> fetchUserData(String email) async {
    _user = await _userService.fetchUserData();
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
      coin: 12000,
    );
    await _userService.saveUserData(user, imageFile,context);
    _user = user;
    notifyListeners();
  }
}
