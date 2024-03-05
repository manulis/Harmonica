import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';
import 'package:harmonica/functions/sharedPreferencesOperations.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class userHandler{

  static bool NameExists = false;
  static bool EmailExists = false;
  static bool PhoneExists = false;
  static var UserProfileView = '';
  static UserObject.User user = UserObject.User('', '', '', '', '','');

  //Registrar Usuario
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
      print(e);
      return false;
    }
    if(!NameExists && !EmailExists && !PhoneExists){
      try{
        await signUp(user.email, user.password);
        await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Imagen': user.image ,'Email': user.email, 'Telefono': user.phone, 'Fecha_nacimiento': user.birthDate, 'Seguidos': [], 'Seguidores':[]});
        await saveData(user, 'UserPrefs');
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

  //Logar Usuario

  static Future<void> signIn(String email, String password) async{
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    print(res);
  }
  
  static Future<bool> LoginUser(String name, String password, context) async {
    var Response = [];
    try {
      print('Entra');
      Response = await supabase.from('infoUsuarios').select('*').eq('Nombre', name);
      print(Response);

    }on Exception catch (e){
      GenericPopUp(context, 'Error', 'It seems there was an error');
      print(e);
      return false;
    }

    if(Response.isEmpty){
      GenericPopUpWithIcon(context, () { }, const Icon(Icons.error, color:Colors.red), 'Invalid Credentials');
    }

    if(Response.isNotEmpty){
      user = UserObject.User(
        name,
        Response[0]['Imagen'],
        Response[0]['Email'], 
        Response[0]['Telefono'], 
        Response[0]['Fecha_nacimiento'], 
        password
      );
      
      print(user);
      try {
        await signIn(user.email, user.password);
        await saveData(user, 'UserPrefs');
        return true;
      }on Exception catch (e){
        GenericPopUpWithIcon(context, () { }, const Icon(Icons.error, color:Colors.red), 'Invalid Credentials');
        print(e);
      }
    }
    return false;
  }

  //Ver informaciòn de un usuario
  static Future<List<Map<String, dynamic>>> GetUserInfoInRealtime(String UserProfileView) async {
    final Response = await supabase.from('infoUsuarios').select('''*''').eq('Nombre', UserProfileView);
    return Response;
  }

  //Deslogar Usuario
  static Future<void> logoutUser(context) async{
    await deleteData();
    await supabase.auth.signOut();
    for (var i = 0; i < 2; i++) {
      Navigator.of(context).pop();
    }
    nav('Init', context);
  }

  static Future<void> signSpoti() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.spotify,
       redirectTo: 'jpztuzgyiluqazttymmb.supabase.co/auth/v1/callback',
    );
  }

  //Extraer todos los usuarios
  static Future<List<Map<String, dynamic>>> getAllusers(String user) async {
    if(user == ''){
      return [];
    }else{
      final Response = await supabase.from('infoUsuarios').select('''Nombre, Imagen''').ilike('Nombre', '$user%');
      return Response;
    }
  }

  //Actualizar la imagen del perfil de usuario
  static Future<bool> updateImage(String? image) async {
    if (image != null) {
      if(user.image !=null){
        String fileName = user.image!.split('/').last;
        await supabase.storage.from('avatars').remove([Uri.decodeFull(fileName)]);
      }

      try {
        final avatarFile = File(image);

        String imageName =  '${user.name} + ${DateTime.now()}';

        await supabase.storage.from('avatars').upload(imageName, avatarFile);

        String publicUrl = await supabase.storage.from('avatars').getPublicUrl(imageName);

        await supabase.from('infoUsuarios').update({ 'Imagen': publicUrl }).match({ 'Nombre': user.name });

        user.image = publicUrl;

        return true;

      } catch (e) {
        print(e);
        
      }
    } else {
      print('el path es null');
      return true;
    }

    return false;
  }


  //Actualizar datos del perfil de usuario
  static Future<bool> updateData(String Phone, String Name) async{

    bool validate = true;

    if(Phone!=''){
      try {
        await supabase.from('infoUsuarios').update({ 'Telefono': Phone }).match({ 'Nombre': user.name });
        validate = true;
      } catch (e) {
        validate = false;
        print(e);
      }
    }

    if (Name!='') {
      try {
         await supabase.from('infoUsuarios').update({ 'Nombre': Name }).match({ 'Nombre': user.name });
         user.name = Name;
         await deleteData();
         await saveData(user, 'UserPrefs');
         validate = true;
      } catch (e) {
        print(e);
        validate = true;
      }
    }
    return validate;
  }

}

class songHandler {

  //Extraer canciones
  static Future<List<Map<String, dynamic>>> getSong() async {
    try{
      final data =  await supabase.from("post").select('*,  cancion!inner(*), infoUsuarios!inner(*)');
      print(data);
      return data;
    }on Exception catch (e){
      print("Error: ${e}");
      return [];
    }
  }

  static Future<bool> postSong() async {

    return true;
  }


}



