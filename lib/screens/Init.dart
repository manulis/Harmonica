import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';

class Init extends StatefulWidget {
  @override
  State<Init> createState() => _Init();
}

class _Init extends State<Init> {


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: Column(
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