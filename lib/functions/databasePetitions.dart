import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';
import 'package:flutter/material.dart';


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
    }on Exception{
      return false;
    }

    if(!NameExists && !EmailExists && !PhoneExists){
      await signUp(user.email, user.password); 
      try{
        await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Email': user.email, 'Telefono': user.phone, 'Fecha_nacimiento': user.birthDate});
        return true;
      }on Exception catch (e){
        print(e);
        GenericPopUp(context, 'Error', 'Parece que hubo un error');
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
  

  static getUser() async {


  }

}
