import 'package:flutter/material.dart';
import 'package:harmonica/widgets.dart';
import 'package:harmonica/navigator.dart';
import 'package:harmonica/functions/databasePetitions.dart';

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
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Color.fromRGBO(40, 4, 64, 1),
                expandedHeight: screenHeight / 4,
                floating: false,
                pinned: false,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: headLogo(screenHeight),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            const Expanded(
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
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
                            const Spacer(),
                            buildClickableText('Need an account?', () {
                              nav('Register', context);
                            }),
                          ],
                        ),
                        const SizedBox(height: 20),
                        buildButton('Sign In', () async {
                          await userHandler.getUser();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
