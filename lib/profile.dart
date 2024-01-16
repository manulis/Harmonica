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
        body: Column(children: [ProfileCard()]),
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.circular(100.0),
                  child:Image(
                    image: AssetImage("profile.jpg"),
                    height: 100,
                    width: 100,
                  ),
                ),
                Text("Hola"),
              ],
            ),
          )
        ),
    );
  }
}
