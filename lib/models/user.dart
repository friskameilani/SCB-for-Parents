class User {
  final String nis;
  final String role;
  final String email;

  User({this.nis, this.role, this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nis: json['nis'],
      email: json['email'],
      role: json['role'],
    );
  }
}
