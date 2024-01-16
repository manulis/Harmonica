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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(59, 6, 69, 1),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            headLogo(height),
            SingleChildScrollView(
              child: Container(
                height: height,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
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
                              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                              hintText: 'Write your name',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
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
                              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                              hintText: 'Write your Password',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
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
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              buildClickableText('Forgot your Password?', () {
                                
                              }),
                              const SizedBox(width: 15),
                              buildClickableText('Need an account?', () {
                                
                              }),
                            ],
                          ),
                          const SizedBox(height: 30),
                          buildButton('Sign In', () async {

                            
                          }),
                        ],
                      ),
                    ),
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