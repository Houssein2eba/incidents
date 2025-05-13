

class User {
  final String name;
  final String phone;


  User({
    required this.name,
    required this.phone,

  });
Map<String, dynamic> toJson() => {'name': name, 'phone': phone,};

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      
    );
  }
}