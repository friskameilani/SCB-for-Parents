class User {
  final String name;
  final String role;
  final String email;

  User({this.name, this.role, this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
