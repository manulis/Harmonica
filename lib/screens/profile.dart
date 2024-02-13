import 'package:flutter/material.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/objects/User.dart';
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
      color: Color.fromARGB(255, 19, 1, 31),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ), // Puedes cambiar este texto por el nombre deseado
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(),
              FavArtists(),
            ],
          ),
        ),
      ),
    );
  }
}




class ProfileCard extends StatefulWidget {
  @override
  State<ProfileCard> createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: userHandler.GetUserInfoInRealtime(userHandler.UserProfileView),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al obtener datos',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {

            final userInfo = snapshot.data!;
            List followers = userInfo[0]['Seguidores'];
            List following = userInfo[0]['Seguidos'];
            bool userFollowed = false;
            
            for (var i = 0; i < followers.length; i++) {
              if(followers[i] == userHandler.user.name){
                userFollowed = true;
                break;
              }
            }

            return Center(
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
                            child: Container(
                              width: 100, // Tamaño deseado para la imagen
                              height: 100, // Tamaño deseado para la imagen
                              child: userInfo[0]['Imagen'] == null
                                ? Image.asset(
                                    'assets/images/userGenericImage.jpg',
                                    width: 100,
                                    height: 100,
                                  )
                                : Image.network(
                                    userInfo[0]['Imagen'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          '${userInfo[0]['Nombre']}',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                        SizedBox(
                          height: 20,
                        ),
                      
                    if(userHandler.UserProfileView != userHandler.user.name && !userFollowed)
                      Center(child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          buildButton2('Follow', () async {
                            await User.follow(userHandler.UserProfileView);
                            setState(() {
                              userFollowed = true;
                            });
                          }),
                        ],),
                      )

                    else if(userHandler.UserProfileView != userHandler.user.name)
                        Center(child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          buildButton2('Following', () async {

                          }),

                        ],),
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
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  '${followers.length}',
                                  style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                            
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Following",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),

                                    Text(
                                      '${following.length}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (userHandler.UserProfileView == userHandler.user.name)
                        buildButton('Edit Profile', () {}),
                 
                      
                      
                     const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          }
        },
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