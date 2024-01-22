import 'package:flutter/material.dart';
import 'package:harmonica/functions/validateFormsCamps.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/navigator.dart';
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
  bool _loadinSpinner = false;
  DateTime _selectedDate = DateTime.now();
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String Retypepassword = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _RetypePasswordController = TextEditingController();

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

  String? passEq(String? value){
    if(value!=password){return 'The password are not equal';}
    return null;
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
              child:  Column(
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
                            GenericTextField(
                              controller: _NameController,
                              validator: FocusName,
                              labelText: 'User Name',
                              hintText: 'Write your User Name',
                              suffixIcon: Icons.person,
                              onChanged: (text) {
                                setState(() {
                                  name = text;
                                });
                              },
                            ),
                            GenericTextField(
                              controller: _EmailController,
                              validator: FocusEmail,
                              labelText: 'Email',
                              hintText: 'Write your Email',
                              suffixIcon: Icons.email,
                              onChanged: (text) {
                                setState(() {
                                  email = text;
                                });
                              },
                            ),
                            GenericTextField(
                              controller: _PhoneController,
                              validator: FocusPhone,
                              labelText: 'Phone number',
                              hintText: 'Write your Phone number',
                              suffixIcon: Icons.phone,
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
                            CustomPasswordTextField(
                              controller: _PasswordController,
                              validator: FocusPassword,
                              obscureText: _obscureText1,
                              onToggleObscureText: (bool value) {
                                setState(() {
                                  _obscureText1 = value;
                                });
                              },
                              onChanged: (text) {
                                setState(() {
                                  password = text;
                                });
                              },
                            ),
                            CustomPasswordTextField(
                              controller: _RetypePasswordController,
                              validator: passEq,
                              obscureText: _obscureText1,
                              onToggleObscureText: (bool value) {
                                setState(() {
                                  _obscureText2 = value;
                                });
                              },
                              onChanged: (text) {
                                setState(() {
                                  Retypepassword = text;
                                });
                              },
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              child: 
                              _loadinSpinner ? spinkit :
                              buildButton('Sign Up', () async {
                                String birthDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
                                print(_NameController.selection);
                                UserObject.User user = UserObject.User(name, email, phone, birthDate, password, '' , [''] , ['']);
                                if(emailValidate(user.email) && phoneValidate(user.phone) && name.isNotEmpty && PasswordValidate.GoodPassword(password) && password==Retypepassword){
                                  print(user);
                                  bool registerInfo = await userHandler.postUser(user, context);
                                  setState(() {
                                    _loadinSpinner=true;
                                  });
                                  if(registerInfo){
                                    RegistrationSuccessPopup(context, () {nav('Login', context);});
                                  }
                                  setState(() {
                                    _loadinSpinner = false;
                                  });
                                  _save();
                                  print(registerInfo); 
                                  
                                }else{
                                  _save();
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

 void RegistrationSuccessPopup(BuildContext context, VoidCallback onContinuePressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.check_circle, color: Colors.green, size: 50),
          content: Text("¡Registro exitoso!", textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                onContinuePressed(); 
              },
              child: Text("Continuar"),
            ),
          ],
        );
      },
    );
  }