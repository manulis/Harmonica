import 'dart:convert';

class User {
  String name;
  String email;
  String? image;
  String phone;
  String birthDate;
  String password;

  User(this.name, this.image ,this.email, this.phone, this.birthDate, this.password);

   Map<String, dynamic> toJson() {
      return {
        'name': name,
        'image': image,
        'email': email,
        'phone': phone,
        'birthDate': birthDate,
        'password': password,
      };
    }

   factory User.fromJson(Map<String, dynamic> json) {
      return User(
        json['name'],
        json['image'],
        json['email'],
        json['phone'],
        json['birthDate'],
        json['password'],
      );
    }

}