import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        home: const Scaffold(
        body: Column(
          children:[
          ProfileCard(),
          FavArtists()
          ]),
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 300,
        child: Card(
            color: const Color.fromRGBO(40, 4, 64, 1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child:Image.asset("assets/images/userGenericImage.jpg",height: 100,width: 100),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("genericUsername",style: TextStyle(color: Colors.white,fontSize: 25)),
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
                          Text("Seguidores",style: TextStyle(color: Colors.white,fontSize: 15)),
                          Text("0",style: TextStyle(color: Colors.white54,fontSize: 15)), 
                        ],
                      ),
                      Row(
                        children: [
                          VerticalDivider(color: Colors.white54,thickness: 2.0,width:5,endIndent: 0,),
                          Column(
                            children: [
                              Text("Seguidores",style: TextStyle(color: Colors.white,fontSize: 15)),
                              Text("0",style: TextStyle(color: Colors.white54,fontSize: 15))
                            ],
                          ),
                        ],
                      ),
                      VerticalDivider(color: Colors.white54,thickness: 2.0,width:5,endIndent: 0,),
                      Column(
                        children: [
                          Text("Post",style: TextStyle(color: Colors.white,fontSize: 15)),
                          Text("0",style: TextStyle(color: Colors.white54,fontSize: 15))
                        ],
                      ),
                    ],
                  ),
                )
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
        color: Color.fromRGBO(40, 4, 64, 1),
        child: Column(
          children: [
            Stack(alignment:Alignment.topCenter,
            children:[
              Text("Artistas favoritos",style: TextStyle(color: Colors.white,fontSize: 18))]),
              ListView.builder(
                itemBuilder: 10,
                scrollDirection: Axis.horizontal,
              )
          ],
        ),
      ),
    );
  }
}