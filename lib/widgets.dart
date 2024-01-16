import 'package:flutter/material.dart';

//Cabecera con Logo
Widget headLogo(double height){
  return Container(
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
  );
}

//Botones:

Widget buildButton(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      
      padding: const EdgeInsets.all(20.0),
      minimumSize: const Size(191.0, 60.0),
      backgroundColor: Color.fromRGBO(102, 61, 168, 1),
      foregroundColor: Colors.white,
    ),
    child: Text(text),
  );
}

Widget buildClickableText(String text, VoidCallback onTap) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(color: const Color.fromRGBO(59, 6, 69, 1)),
        ),
      ),
    );
  }



