class User {
  final String? username;
  final String? email;
  final String? telephone;

  User({required this.username, required this.email, required this.telephone});
  Map<String, dynamic> toJson() => {'username': username, 'email': email, 'telephone': telephone};

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'] ?? '', email: json['email'] ?? '', telephone: json['telephone'] ?? '');
  }
}
