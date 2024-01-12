import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
        child: Column(
          children: [
            Card(
              color:Colors.purple,
              child: Padding(
                padding: EdgeInsets.only(top: 100,bottom: 100,left: 300, right: 300 ),
                child: Column(
                  children: [
                    Image(image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),)
                  ],
                ),
              )
            )
          ],
          ),
      ),
      ),
    );
  }
}