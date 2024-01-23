import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';
import 'package:http/http.dart' as http;


class userHandler{

  static bool NameExists = false;
  static bool EmailExists = false;
  static bool PhoneExists = false;

  static Future<bool> postUser(UserObject.User user, context) async {
    try{
      final NameResponse = await supabase.from('infoUsuarios').select('Nombre').eq('Nombre', user.name);
      final EmailResponse = await supabase.from('infoUsuarios').select('Email').eq('Email', user.email);
      final PhoneResponse = await supabase.from('infoUsuarios').select('Telefono').eq('Telefono', user.phone);
      NameExists = NameResponse.isNotEmpty ?? false;
      EmailExists = EmailResponse.isNotEmpty ?? false;
      PhoneExists = PhoneResponse.isNotEmpty ?? false;
      print(NameResponse + PhoneResponse + EmailResponse);
    }on Exception catch (e){
      GenericPopUp(context, 'Error', 'It seems there was an error');
      return false;
    }
    if(!NameExists && !EmailExists && !PhoneExists){
      try{
         await signUp(user.email, user.password);
        await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Email': user.email, 'Telefono': user.phone, 'Fecha_nacimiento': user.birthDate});
        return true;
      }on Exception catch (e){
        print(e);
        GenericPopUp(context, 'Error', 'It seems there was an error');
        return false;
      }
    }
    return false;
  }

  static Future<void> signUp(String email, String password) async{
    AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'io.supabase.harmonica://signup-callback',
    );
    print(res);
  }

  static Future<void> signIn(String email, String password) async{
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    print(res);
  }
  
  static Future<bool> getUser(String name, String password, context) async {
    String email  = '';
    var EmailResponse = [];
    try {
      EmailResponse = await supabase.from('infoUsuarios').select('Email').eq('Nombre', name);
      print(EmailResponse);
    }on Exception catch (e){
      GenericPopUp(context, 'Error', 'It seems there was an error');
      return false;
    }

    if(EmailResponse.isEmpty){
      GenericPopUpWithIcon(context, () { }, Icon(Icons.error, color: Colors.red,), 'Invalid credentials');
    }
  
    if(EmailResponse.isNotEmpty){
      email =  EmailResponse[0]['Email'];
      print(email);
      try {
        await signIn(email, password);
        return true;
      }on Exception catch (e){
        GenericPopUpWithIcon(context, () { }, Icon(Icons.error, color:Colors.red), 'Invalid Credentials');
        print(e);
      }
    }
    return false;
  }

}
