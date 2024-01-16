
import 'package:flutter/material.dart';
import 'package:harmonica/screens/Login.dart';
import 'package:harmonica/screens/Register.dart';

nav(String ScreenName, context){
  switch (ScreenName) {
    case 'Login':
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ); 
      break;
    case 'Register':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register()),
      );
      break;
    default:
  }
}