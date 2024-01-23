import 'dart:convert';

class User {
  String name;
  String email;
  String phone;
  String birthDate;
  String password;

  User(this.name, this.email, this.phone, this.birthDate, this.password);

    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['phone'],
      json['birthDate'],
      json['password'],
    );
  }

}