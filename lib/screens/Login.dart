import 'package:flutter/material.dart';
import 'package:harmonica/widgets.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      body: SafeArea(
        child: ListView(
          children: [
            headLogo(screenHeight),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 22),
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontStyle: FontStyle.italic,
                                fontSize: 16),
                            hintText: 'Write your name',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                                fontStyle: FontStyle.italic,
                                fontSize: 16),
                          ),
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                        TextField(
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontStyle: FontStyle.italic,
                                fontSize: 16),
                            hintText: 'Write your Password',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                                fontStyle: FontStyle.italic,
                                fontSize: 16),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ), 
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildClickableText('Forgot your Password?', () {}),
                            Spacer(),
                            buildClickableText('Need an account?', () {}),
                          ],
                        ),
                        const SizedBox(height: 20),
                        buildButton('Sign In', () async {}),
                        
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
