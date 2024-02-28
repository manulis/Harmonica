import 'package:flutter/material.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/objects/User.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';


bool _Loading = false;

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
      home: 
      Scaffold(
        backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              nav('NavigatorBar', context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ), // Puedes cambiar este texto por el nombre deseado
        ),
        body: 
       
        SingleChildScrollView(
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
            if (_Loading == false) {
               return Center(child: loadingPage());
            }
            return Center(child: Text(''),);
           
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

            print(followers.runtimeType);
            
            for (var i = 0; i < followers.length; i++) {
              if(followers[i] == userHandler.user.name){
                userFollowed = true;
                break;
              }
            }

            return
             _Loading ? loadingPage():
             Center(
              child: Container(
                width: MediaQuery.of(context).size.width/1.1,
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
                            GenericPopUpWithIcon(context, 
                              () async {
                                setState(() {_Loading= true;});
                                await User.unfollow(userHandler.UserProfileView);
                                setState(() {_Loading = false;});
                              }, 
                              const Icon(Icons.person), 

                              '¿Are you sure you want unfollow ${userHandler.UserProfileView}?' 
                            );
                           
                          }),

                        ],),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async{

                                setState(() {_Loading = true;});
                                  
                                print(followers);
                                var mapfollowers = [];
                                
                                for (var i = 0; i < followers.length; i++) {
                                  var followersGetInfo = await userHandler.GetUserInfoInRealtime(followers[i]);
                                  mapfollowers.add(followersGetInfo);
                                }

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return followsFollowersListWidget(mapfollowers, 'Followers', context);
                                },);
                                
                                setState(() {_Loading = false; });
                            
                              },
                                child: Column(
                                children: [
                                const Text(
                                    "Followers",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                              
                                  Text(
                                    '${followers.length}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 70, 58, 58), fontSize: 15),
                                  ),
                                    
                                  
                                ],
                              ),
                            ),
                          
                            Row(
                              children: [
                               const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    
                                    setState(() {
                                      _Loading = true;
                                    });

                                    var mapfollowing = [];

                                    for (var i = 0; i < following.length; i++) {
                                      var followingGetInfo = await userHandler.GetUserInfoInRealtime(following[i]);
                                      mapfollowing.add(followingGetInfo);
                                    }

                                    print(mapfollowing);
                                    
                                    
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return followsFollowersListWidget(mapfollowing, 'Following', context);
                                    },);

                                    setState(() {
                                      _Loading = false;
                                    });

                                  },
                                  child: 
                                  Column(
                                    children: [
                                     const Text(
                                        "Following",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      
                                      Text(
                                        '${following.length}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),     
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      if (userHandler.UserProfileView == userHandler.user.name)
                        buildButton('Edit Profile', () {

                          nav('EditProfile', context);
                        }),

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
      width: MediaQuery.of(context).size.width/1.1,
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


Widget followsFollowersListWidget(List<dynamic> list, String title, context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(40, 4, 64, 1),
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      title: Text(title,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      centerTitle: true,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 255, 255, 255)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
    body: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index][0];
        return SizedBox(
          height: 70,
          child: 
            Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 5,
              margin: EdgeInsets.all(8),
            color: Color.fromARGB(255, 241, 241, 241),
            child:
            ListTile(
              leading: 
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: item['Imagen'] == null
                      ? Image.asset(
                          'assets/images/userGenericImage.jpg',
                          width: 38,
                          height: 38,
                        )
                      : Image.network(
                          item['Imagen'],
                          width: 38.0,
                          height: 38.0,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              title: Text(item['Nombre'].toString()),
              onTap: () {
                userHandler.UserProfileView = item['Nombre'];
                nav('Profile', context);
              
              },
            )
          
          )
        
        
        );
      },
    ),
  );
}