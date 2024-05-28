import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/functions/validateFormsCamps.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:harmonica/main.dart';
import 'package:harmonica/functions/sharedPreferencesOperations.dart';
import 'dart:convert';
import 'package:harmonica/objects/Song.dart';
import 'package:http/http.dart' as http;


class userHandler{

  static bool NameExists = false;
  static bool EmailExists = false;
  static bool PhoneExists = false;
  static var UserProfileView = '';
  static UserObject.User user = UserObject.User('', '', '', '', '','');
  static bool retry = false;

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
        if(retry == false){
          await signUp(user.email, user.password);
        }
        
        GenericPopUpWithIcon(context, () async {
          try {
            await signIn(user.email, user.password);
            await supabase.from('infoUsuarios').insert({'Nombre': user.name, 'Imagen': user.image ,'Email': user.email, 'Telefono': user.phone, 'Fecha_nacimiento': user.birthDate, 'Seguidos': [], 'Seguidores':[]});
            await saveData(user, 'UserPrefs'); 
            // ignore: use_build_context_synchronously
            GenericPopUpWithIcon(context, () async{
              Navigator.of(context).pop();
              nav('Login', context);
            }, Icon(Icons.check_circle, color: Colors.green, size: 50), 'Registred!');
          }on Exception catch(e){
            print(e);
            GenericPopUpWithIcon(context, () { retry = true; userHandler.postUser(user, context);}, Icon(Icons.error), 'You dont confirm the Email');
          }
        }, Icon(Icons.email), 'We sent an email to ' + user.email + ' dont Continue until you confirm the email');
      
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
    final Session? session = res.session;
    final User? user = res.user;

    print(session);
    print(user);
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

  //Conectar con cuenta Spotify
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
    if(phoneValidate(Phone)){

      if(Phone!=''){
          try {
            await supabase.from('infoUsuarios').update({ 'Telefono': Phone }).match({ 'Nombre': user.name });
            validate = true;
          } catch (e) {
            validate = false;
            print(e);
          }
        }

    }else{
      validate = false;
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
        validate = false;
      }
    }

    return validate;
  }


  //Actualizar Contraseña

  static Future updatePassword() async{

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
  
  final client_id = "8f014b27dd6542d1a3344be72948fdb7";
  final client_secret = "11f44aab63654684b1551c5220f2bf01";



  static Future<String> getToken() async {
    var response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': '8f014b27dd6542d1a3344be72948fdb7',
        'client_secret': '11f44aab63654684b1551c5220f2bf01',
      },
    );
    print(response.body);
    Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['access_token'];
    print(token);
    return token;
  }

  static Future<http.Response> searchSong(String song, String access_token) async {
      try {
        final uri = "https://api.spotify.com/v1/search?q=$song&type=track&limit=1";
        //print(uri);
        //print(access_token);
        var header = {"Authorization": "Bearer " + access_token};
        var response = await http.get(Uri.parse(uri), headers: header);
        print(response.body);
        return response;
      }catch (error) {
        return http.Response("error: $error",500);}
  }
    

  static Future<void> postSong(Song song) async {

    final response = await userHandler.GetUserInfoInRealtime(userHandler.user.name);

    final id = response[0]['id'];
      await supabase.from('cancion').insert({
          'id_cancion': song.song_id, 
          'Nombre': song.song_name, 
          'Artista': song.song_artist, 
          'Album': song.song_album,
          'Preview': song.song_preview,
          'Imagen': song.song_image_url
        });
      await supabase.from('post').insert({'id_cancion': song.song_id, 'id_usuario': id});
    
  }

}