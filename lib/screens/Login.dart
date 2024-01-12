import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _Login();
}


class _Login extends State<Login>{
  Widget build(BuildContext context){
  final height = MediaQuery.of(context).size.height ;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
         height: height,
         child: Stack(children: [
            Container(
              height: height/2,
              width: double.infinity,
              decoration: 
              const BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)
                )
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.audiotrack,
                    color: Colors.green,
                    size: 60.0,
                  ),
              ]),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        height: height / 2,
                        margin: const EdgeInsets.all(10),
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32)
                        ),
                        child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            const Text('Login', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                            const SizedBox(height: 22),
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