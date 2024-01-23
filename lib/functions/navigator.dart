
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmonica/screens/Login.dart';
import 'package:harmonica/screens/Register.dart';
import 'package:harmonica/screens/Home.dart';

nav(String ScreenName, context){
  switch (ScreenName) {
    case 'Login':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Login();}));
      break;
    case 'Register':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Register();}));
      break;
    case 'Home':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Home();}));

  }
}