import 'package:flutter/material.dart';
import 'package:harmonica/widgets.dart';
import 'package:intl/intl.dart';
class Register extends StatefulWidget{
  @override
  State<Register> createState() => _Register();
}


class _Register extends State<Register>{
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  DateTime _selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
    context: context, 
    firstDate: DateTime(1900), 
    lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  
  @override
  Widget build(BuildContext context){
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
                          const SizedBox(height: 20),
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
                                setState(() {

                                });
                              },
                            ),

                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Write your Email',
                                suffixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {

                                });
                              },
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Phone number',
                                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: '+34',
                                suffixIcon: Icon(Icons.phone),
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                              ),
                              onChanged: (text) {
                                setState(() {

                                });
                              },
                            ),
                        
                            GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              } ,
                              
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Fecha de Nacimiento',
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontStyle: FontStyle.italic,fontSize: 16),  
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),

                            TextField(
                              onChanged: (text) {
                                setState(() {

                                });                
                              },
                              obscureText: _obscureText1,
                              decoration: InputDecoration(
                                labelText: 'Create Password', 
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Type a Password',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText1 ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  },
                                ),
                              ),  
                            ),
                            TextField(
                              onChanged: (text) {
                                setState(() {

                                });                
                              },
                              obscureText: _obscureText2,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password', 
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontStyle: FontStyle.italic, fontSize: 16),
                                hintText: 'Retype your Password',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172), fontStyle: FontStyle.italic, fontSize: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText2 ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText2 = !_obscureText2;
                                    });
                                  },
                                ),
                              ),  
                            ),
                           
                            const SizedBox(height: 30),
                            buildButton('Sign Up', () async {

                             
                              
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