import 'dart:convert';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';

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

  static Future follow(String user) async {
    final Response = await supabase.from('infoUsuarios').select('Seguidores').ilike('Nombre', '$user%');
    final Response2 = await supabase.from('infoUsuarios').select('Seguidos').ilike('Nombre', userHandler.user.name);
    List followers = Response[0]['Seguidores'];
    List followsofCurrentUser = Response2[0]['Seguidos'];
    followers.add(userHandler.user.name);
    followsofCurrentUser.add(user);
    print(followers);
    await supabase.from('infoUsuarios').update({ 'Seguidores': followers }).match({ 'Nombre': user });
    await supabase.from('infoUsuarios').update({'Seguidos': followsofCurrentUser}).match({'Nombre': userHandler.user.name});
  }

  static Future unfollow(String user) async {
    final Response = await supabase.from('infoUsuarios').select('Seguidores').ilike('Nombre', '$user%');
    final Response2 = await supabase.from('infoUsuarios').select('Seguidos').ilike('Nombre', userHandler.user.name);
    List followers = Response[0]['Seguidores'];
    List followsofCurrentUser = Response2[0]['Seguidos'];
    followers.removeWhere((element) => element==userHandler.user.name);
    followsofCurrentUser.removeWhere((element)=> element == user);
    await supabase.from('infoUsuarios').update({ 'Seguidores': followers }).match({ 'Nombre': user });
    await supabase.from('infoUsuarios').update({'Seguidos': followsofCurrentUser}).match({'Nombre': userHandler.user.name});
  }

  static Future editData(String data) async {



  }

}