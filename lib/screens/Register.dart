import 'package:flutter/material.dart';
import 'package:harmonica/widgets.dart';

class Register extends StatefulWidget{
  @override
  State<Register> createState() => _Register();
}


class _Register extends State<Register>{
  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    bool next = false;
    bool _obscureText = true;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(59, 6, 69, 1),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            headLogo(height),
            SingleChildScrollView(
              child: Container(
                height: height/0.88,
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
                          const SizedBox(height: 30),
                          const Text(
                            'Register',
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
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Write your Email',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Phone number',
                                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: '+34',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {

                                });
                              },
                            ),
                                TextField(
                              onChanged: (text) {
                                setState(() {});                
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Create Password', 
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Type a Password',
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
                            TextField(
                              onChanged: (text) {
                                setState(() {});                
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password', 
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Retype a Password',
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
                            const SizedBox(height: 30),
                            buildButton('Next', () {
                              setState(() {
                                next = true;
                                print(next);
                              });
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


