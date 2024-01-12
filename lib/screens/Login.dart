import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _Login();
}


class _Login extends State<Login>{
  Widget build(BuildContext context){
  final height = MediaQuery.of(context).size.height ;
  final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Color.fromRGBO(59, 6, 69, 1),
      body: SizedBox(
         height: height,
         child: Stack(children: [
            Container(
              height: height/2,
              width: double.infinity,
              decoration:
              const BoxDecoration(
                color: Color.fromRGBO(40, 4, 64, 1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)
                )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/LogoPositivo.png", width: 300,),
              ]),
            ),
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
                            const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
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