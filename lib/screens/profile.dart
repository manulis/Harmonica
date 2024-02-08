import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/databasePetitions.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color:Color.fromARGB(255, 19, 1, 31) ,
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
        body: Column(
          children:[
          ProfileCard(),
          FavArtists()
          ]),
    ));
  }
}

class ProfileCard extends StatefulWidget{
  @override
  State<ProfileCard> createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 350,
        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child:
                        userHandler.user.image == null
                          ? Image.asset('assets/images/userGenericImage.jpg', width: 100, height: 100,)
                          : Image.network(
                          userHandler.user.image!,
                          width: 38.0,
                          height: 38.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(userHandler.user.name,style: TextStyle(color: Colors.black,fontSize: 25)),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Followers",style: TextStyle(color: Colors.black,fontSize: 15)),
                          Text("0",style: TextStyle(color: Colors.black,fontSize: 15)), 
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                         
                          Column(
                            children: [
                              Text("Following",style: TextStyle(color: Colors.black,fontSize: 15)),
                              Text("0",style: TextStyle(color: Colors.black,fontSize: 15))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      
                      Column(
                        children: [
                          Text("Posts",style: TextStyle(color: Colors.black,fontSize: 15)),
                          Text("0",style: TextStyle(color: Colors.black,fontSize: 15))

                        ],
                      ),

                    ],
                  ),

                  
                ),
                
                buildButton('Edit Profile', () { 
                  
                }),
                SizedBox(height: 10,),
              ],
            )
          ),
      ),
    );
  }
}


class FavArtists extends StatefulWidget {
  const FavArtists({super.key});

  @override
  State<FavArtists> createState() => _FavArtistsState();
}

class _FavArtistsState extends State<FavArtists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Stack(alignment:Alignment.topCenter,
            children:[
              Text("Artistas favoritos",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 18))]),
           
          ],
        ),
      ),
    );
  }
}