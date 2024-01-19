import 'package:flutter/material.dart';
import 'package:harmonica/functions/validateFormsCamps.dart';
import 'package:harmonica/widgets.dart';
import 'package:harmonica/navigator.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:intl/intl.dart';
import 'package:harmonica/objects/User.dart' as UserObject;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  DateTime _selectedDate = DateTime.now();
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
                        const SizedBox(height: 20),
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
                                'Register',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                        Form(
                        key: _formKey,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: _NameController,
                              validator: FocusName,
                              decoration:  const InputDecoration(
                                labelText: 'User Name',
                                labelStyle:  TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                hintText: 'Write your name',
                                hintStyle:  TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  name = text;
                                });
                              },
                            ),
                            TextFormField(
                              controller: _EmailController,
                              validator: FocusEmail,
                              decoration: const InputDecoration(
                                
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                hintText: 'Write your Email',
                                suffixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  email = text;
                                });
                              },
                            ),
                            TextFormField(
                              controller: _PhoneController,
                              validator: FocusPhone,
                              decoration: const InputDecoration(
                                labelText: 'Phone number',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                hintText: 'Write your Phone number',
                                suffixIcon: Icon(Icons.phone),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  phone = text;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: InputDecorator( 
                                decoration: const InputDecoration(
                                  labelText: 'Birth Date',
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _PasswordController,
                              
                              obscureText: _obscureText1,
                              decoration: InputDecoration(
                                labelText: 'Create Password',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                hintText: 'Type a Password',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  },
                                ),
                              ),
                               onChanged: (text) {
                                setState(() {
                                  password = text;
                                });
                              },
                            ),
                            TextFormField(
                              
                              obscureText: _obscureText2,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                hintText: 'Retype your Password',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText2
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText2 = !_obscureText2;
                                    });
                                  },
                                ),
                              ),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              child: buildButton('Sign Up', () async {
                                _save();
                                String birthDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
                                UserObject.User user = UserObject.User(name, email, phone, birthDate, password, [''], ['']);
                                print(email);
                                if(emailValidate(email) && phoneValidate(user.phone) && name.isNotEmpty && password.isNotEmpty){
                                  print(user);
                                  bool registerInfo = await userHandler.postUser(user);
                                  if (registerInfo) {
                                    PopUp(context, 'Registrado', 'Registrado con exito');
                                  }
                                  if(!registerInfo) {
                                    PopUp(context, 'Error', 'Parece que hubo un error');
                                  }
                                }
                              }),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildClickableText('Already have an account? Sign In', () {
                                  nav('Login', context);
                                }),
                              ],
                            ),
                          ],)
                        ),
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

  void _save() {
    if (_formKey.currentState!.validate()) print('Okey');
    print('Error');
  }

}