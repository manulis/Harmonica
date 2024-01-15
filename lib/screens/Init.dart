import 'package:flutter/material.dart';
import 'package:harmonica/screens/Login.dart';
import 'package:harmonica/screens/Register.dart';
import 'package:harmonica/widgets.dart';
import 'package:harmonica/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Init extends StatefulWidget{
 @override
  State<Init> createState() => _Init();
}

class _Init extends State<Init>{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      body: Container(
        child: Center(child: 
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
            child: Column(children: [
             Image.asset("assets/images/LogoPositivo.png"),
              const SizedBox(height: 50),
              const Text('Welcome!', textAlign: TextAlign.center,
                        style: 
                          TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                        ),
                      ),
              const SizedBox(height: 50),
              Container(child: 
                const Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text("Harmonica,", 
                    style: TextStyle(
                      color: Color.fromRGBO(188, 220, 76, 1),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),

                  Text(" Connecting Listeners",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
                ),
              ),
              const SizedBox(height: 80),
              buildButton("Login", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              const SizedBox(height: 50),
              buildButton("Register",  () { 
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              })
            ],)
          ),
        )
      ), 
    );
  }
}