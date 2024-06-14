import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}

// Usage
// void saveUserSession() async {
//   await UserSession.saveUserId(userId);
// }

// void loadUserSession() async {
//   userId = await UserSession.getUserId() ?? '';
// }
