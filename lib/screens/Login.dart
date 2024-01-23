import 'package:flutter/material.dart';
import 'package:harmonica/functions/validateFormsCamps.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/functions/databasePetitions.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loadinSpinner = false;
  String name = '';
  String password = '';
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                              const SizedBox(height: 15),
                              GenericTextField(
                                controller: _nameController, 
                                validator:  Focus, 
                                labelText: 'User Name', 
                                hintText: 'Write yor name', 
                                suffixIcon: Icons.person, 
                                onChanged: (text){
                                  setState(() {
                                    name = text;
                                  });
                                } ,
                              ),
                              PasswordTextField(
                                controller: _passwordController, 
                                validator: Focus,
                                labelText: 'Password',
                                hintText: 'Write your Password',
                                obscureText: _obscureText, 
                                onToggleObscureText: (bool value) {
                                  setState(() {
                                    _obscureText = value;
                                  });
                                },
                                onChanged: (text) {
                                  setState(() {
                                    password = text;
                                  });
                                },
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
                            _loadinSpinner ? spinkit :
                            buildButton('Sign In', () async {
                              setState(() {
                                _loadinSpinner = true;
                              });
                              bool loginUser = await userHandler.getUser(name, password, context);
                              setState(() {
                                _loadinSpinner = false;
                              });
                              _save();
                              if(loginUser){
                                nav('NavigatorBar', context);
                              }else{
                                print('Pareca que hubo un error');
                              }
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _save() {
    if (_formKey.currentState!.validate()) print('Okey');
    print('Error');
  }
  
  String? Focus(String? value){
    if(value==''){
      return 'This field is empty';
    }
    return null;
  }
}

