import 'package:flutter/material.dart';
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
                const Titulos("Welcome!"),
                const SizedBox(height: 20),
                const Text("Harmonica, Connecting Listeners"),
                const SizedBox(height: 30),
                buildButton("Login", () { 


                }),
                const SizedBox(height: 30),
                buildButton("Register", () { 
                  

                })

              ],)
            ),
        
        )
      ), 
    );
  }
}