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

//campos de texto especiales

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'Password', labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic),hintText: 'Write your Password' ,hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}