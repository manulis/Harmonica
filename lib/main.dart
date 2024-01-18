import 'package:flutter/material.dart';
import 'package:harmonica/screens/Init.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://jpztuzgyiluqazttymmb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpwenR1emd5aWx1cWF6dHR5bW1iIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY4NTI4NTcsImV4cCI6MjAxMjQyODg1N30.R1ppxbGbX0pJ2rDysdlqdJ3QXiDvvjOtV-d5WuepWVQ',
  );
  runApp(MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Init(),
    );
  }
}
