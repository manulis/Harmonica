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
    final NameResponse = await supabase.from('infoUsuarios').select('*').eq('Nombre', user.name);
    final EmailResponse = await supabase.from('infoUsuarios').select('*').eq('Email', user.email);
    final PhoneResponse = await supabase.from('infoUsuarios').select('*').eq('Telefono', user.phone);
    print(NameResponse);

    NameExists = NameResponse.isNotEmpty ?? false;
    EmailExists = EmailResponse.isNotEmpty ?? false;
    PhoneExists = PhoneResponse.isNotEmpty ?? false;
    
    if(!NameExists && !EmailExists && !PhoneExists){
       await supabase.auth.signUp(
          email: user.email,
          password: user.password,
        );
      try{
        await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Email': user.email, 'Telefono': user.phone, 'Fecha_nacimiento': user.birthDate});
        await supabase.from('Usuarios').insert({'Contrasena':user.password, 'NombreUsu': user.name});
        return true;
      }on Exception catch (e){
        print(e);
        PopUp(context, 'Error', 'Parece que hubo un error');
        return false;
      }
    
    }
    return false;
  }

  

  static getUser() async {


  }

}
