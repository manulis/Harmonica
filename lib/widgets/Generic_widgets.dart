import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Cabecera con Logo:
Widget headLogo(double height){
  return SizedBox(
     height: height/4,
      child:  
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/LogoPositivo.png", width: 300),
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
        style: TextStyle(color: const Color.fromRGBO(59, 6, 69, 1), fontSize: 12),
        
      ),
    ),
  );
}


//Pop up
void GenericPopUp(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}


//Form widgets
class GenericTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator; // Modificado el tipo del parámetro
  final String labelText;
  final String hintText;
  final IconData suffixIcon;
  final void Function(String) onChanged;

  GenericTextField({
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.onChanged,
  });

  @override
  _GenericTextFieldState createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (text) => widget.validator(text ?? ''),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        hintText: widget.hintText,
        suffixIcon: Icon(widget.suffixIcon),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 172, 172, 172),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final void Function(bool) onToggleObscureText;
  final void Function(String) onChanged;

  const CustomPasswordTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.onToggleObscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: 'Create Password',
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        hintText: 'Type a Password',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 172, 172, 172),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            onToggleObscureText(!obscureText);
          },
        ),
      ),
      onChanged: onChanged,
    );
  }
}


//LoadingSpinner
final spinkit = SpinKitFadingFour(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      
      decoration: BoxDecoration(
        color: index.isEven ? Color.fromRGBO(59, 6, 69, 1): Color.fromRGBO(102, 61, 168, 1),
      ),
    );
  },
);