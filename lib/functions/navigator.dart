
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmonica/screens/Login.dart';
import 'package:harmonica/screens/Register.dart';
import 'package:harmonica/NavigatorBar.dart';
import 'package:harmonica/screens/Init.dart';
import 'package:harmonica/screens/Profile.dart';
import 'package:harmonica/screens/EditProfile.dart';

nav(String ScreenName, context){
  switch (ScreenName) {
    case 'Login':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Login();}));
      break;
    case 'Register':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Register();}));
      break;
    case 'Init':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Init();}));
      break;
    case 'Profile':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return Profile();}));
      break;
    case 'EditProfile':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return EditProfile();}));
      break;

    case 'NavigatorBar':
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){return NavigatorBar();}));
      break;
  }
}