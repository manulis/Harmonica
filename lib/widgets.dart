import 'package:flutter/material.dart';


//Widgets para titulos
class Titles extends StatefulWidget {
  final String texto;
  const Titles(this.texto);
  @override
  _TitlesState createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texto,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 50,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

//Widgets para botones
Widget buildButton(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(20.0),
      minimumSize: const Size(200.0, 60.0),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    child: Text(text),
  );
}