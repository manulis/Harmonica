import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

saveData(Object object, String keyPrefs) async {
  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyPrefs, json.encode(object));
    print('Datos guardados correctamente en $keyPrefs');
  }on Exception catch (e){
    print(e);
  }
}


deleteData() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}