
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';

class userHandler{

 static Future<bool> postUser(UserObject.User user) async {
    try{
      await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Email': user.email,'Telefono': user.phone, 'Fecha_nacimiento':user.birthDate,});
      await supabase.from('Usuarios').insert({'Contrasena':user.password, 'NombreUsu': user.name});
      return true;
    }on Exception catch (e){
      print(e);
      return false;
    }
  }

  static getUser() async {


  }


}
