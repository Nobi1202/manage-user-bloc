class User {
  final String userName;
  final String email;
  final String urlAvatar;

  User({
    required this.email,
    required this.urlAvatar,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      urlAvatar: json['urlAvatar'],
      userName: json['username'],
    );
  }
}
