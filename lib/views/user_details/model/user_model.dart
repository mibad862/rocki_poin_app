class User {
  final String name;
  final String username;
  final String email;
  final String imageUrl;
  final int level;
  final int coin;

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.level,
    required this.coin,
  });

  factory User.fromMap(Map<String, dynamic> data, String email) {
    return User(
      name: data['name'],
      username: data['username'],
      email: email,
      imageUrl: data['image_url'],
      level: data['level'],
      coin: data['coin'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'image_url': imageUrl,
      'level': level,
      'coin': coin,
    };
  }
}
