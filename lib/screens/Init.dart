import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Init extends StatefulWidget {
  @override
  State<Init> createState() => _Init();
}

class _Init extends State<Init> {

  bool _loadingPage = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString('UserPrefs');
    if (jsonUser != null) {
      try {
        UserObject.User user = UserObject.User.fromJson(json.decode(jsonUser));

        bool login = await userHandler.getUser(user.name, user.password, context);
        
        if(login){
          Navigator.of(context).pop();
          nav('NavigatorBar', context); 
          print('Usuario cargado correctamente: $user');

        }
      
      } catch (e) {
        GenericPopUp(context, 'Error', 'Parece que hubo un error');
        print('Error: $e');
        setState(() {_loadingPage = false;});
      }
    } else {
      print('La cadena JSON es nula');
      setState(() {_loadingPage = false;});
    }
    
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
     return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: 
              _loadingPage ? loadingPage() :
              Column(
                children: [
                  Image.asset("assets/images/LogoPositivo.png", width: screenWidth,),
                  const SizedBox(height: 50),
                   const Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Harmonica,",
                        style: TextStyle(
                          color: Color.fromRGBO(188, 220, 76, 1),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth*0.04,
                        ),
                      ),
                      Text(
                        " Connecting Listeners",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth*0.04,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 80),
                  buildButton("Login", () {
                    nav('Login', context);
                  }),
                  const SizedBox(height: 50),
                  buildButton("Register", () {
                    nav('Register', context);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}