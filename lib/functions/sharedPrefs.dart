import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

saveData(Object object, String keyPrefs) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(keyPrefs, json.encode(object));
}

getData(String keyPrefs) async{

}
