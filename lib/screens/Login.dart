import 'package:flutter/material.dart';
import 'package:harmonica/widgets.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{
  Widget build(BuildContext context){
  final width = MediaQuery.of(context).size.width ;
  final height = MediaQuery.of(context).size.height ;
    return Scaffold(
      backgroundColor: Color.fromRGBO(59, 6, 69, 1),
      body: SizedBox(
         height: height,
         child: Stack(children: [
            headLogo(height),
            SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        height: height / 1.9,
                        margin: const EdgeInsets.all(20),
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32)
                        ),
                        child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            const SizedBox(height: 22),
                            const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            const SizedBox(height: 30),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Name', labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic),
                                hintText: 'Write your name' ,hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic),
                              ),
                                onChanged: (text) {
                                setState(() {

                                });
                              },
                            ),

                            PasswordTextField(),

                            const SizedBox(height: 30),

                            buildButton('Sign In', () { 


                            })



                        ],
                        ),
                    )
                  ],
                ),
              ),
            ),
         ], 
         ),
      ),
    );
  }
}