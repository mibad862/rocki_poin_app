import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rocki_poin_app/views/user_details/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? user;
  int? balance;
  int? level;

  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

  void setRocksData(int balance, int level) {
    this.balance = balance;
    this.level = level;
    _saveBalanceToPrefs(balance);
    _saveLevelToPrefs(level);
    notifyListeners();
  }

  Future<void> fetchRocksData(String userId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('rocks').doc(userId).get();
    if (doc.exists) {
      balance = doc['balance'];
      level = doc['level'];
      notifyListeners();
      // Save fetched balance and level to SharedPreferences
      _saveBalanceToPrefs(balance!);
      _saveLevelToPrefs(level!);
    } else {
      // Load balance and level from SharedPreferences if the doc doesn't exist
      balance = await _loadBalanceFromPrefs();
      level = await _loadLevelFromPrefs();
      notifyListeners();
    }
  }

  Future<void> _saveBalanceToPrefs(int balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('balance', balance);
  }

  Future<void> _saveLevelToPrefs(int level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level', level);
  }

  Future<int?> _loadBalanceFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('balance');
  }

  Future<int?> _loadLevelFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('level');
  }
}
