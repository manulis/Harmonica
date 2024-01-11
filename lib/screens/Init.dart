import 'package:flutter/material.dart';
import 'package:harmonica/screens/Login.dart';
import 'package:harmonica/screens/Register.dart';
import 'package:harmonica/widgets.dart';
import 'package:harmonica/widgets.dart';

class Init extends StatefulWidget{
 @override
  State<Init> createState() => _Init();
}

class _Init extends State<Init>{
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(child: 
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
            child: Column(children: [
              const Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 60.0,
                ),
              const SizedBox(height: 30),
              const Titles("Welcome!"),
              const SizedBox(height: 20),
              Container(child: 
                const Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text("Harmonica,", 
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),

                  Text(" Connecting Listeners",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  )
                ],
                ),
              ),
              const SizedBox(height: 30),
              buildButton("Login", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              const SizedBox(height: 30),
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