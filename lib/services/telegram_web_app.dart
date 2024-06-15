

class TelegramWebApp {
  static final TelegramWebApp _instance = TelegramWebApp._internal();
  factory TelegramWebApp() {
    return _instance;
  }
  TelegramWebApp._internal();

  static TelegramWebApp get instance => _instance;

  Future<bool> isVersionAtLeast(String version) async {
    // Simulate API version check
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<void> ready() async {
    // Simulate Telegram Web App ready method
    await Future.delayed(const Duration(seconds: 1));
  }

  TelegramInitData get initData => TelegramInitData(user: User(username: 'testuser'));
}

class TelegramInitData {
  final User? user;

  TelegramInitData({this.user});
}

class User {
  final String username;

  User({required this.username});
}
