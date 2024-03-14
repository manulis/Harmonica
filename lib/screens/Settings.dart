import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/functions/navigator.dart';

class Settings extends StatefulWidget{
 @override
  State<Settings> createState() => _Settings();
}


class _Settings extends State<Settings>{

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: const Text(
        'Settings',
        style: TextStyle(color: Colors.white),
      ),
     
    ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Center(child: Column(children: [
                   SvgPicture.asset(
                      'assets/images/gears-solid.svg',
                       width: 90.0,
                        height: 90.0,
                      colorFilter: ColorFilter.mode(const Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn),
                      semanticsLabel: 'Settings '
                      
                ),
                SizedBox(height: 20,),

                GestureDetector(onTap: (){nav('EditProfile', context);},
                  child:  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    
                    elevation: 5,
                      margin: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 241, 241, 241),
                    child: const Row(children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child:
                                Icon(Icons.person),
                              ),
                            ),
                      Text('Edit Profile'),
                  ],),)
                ),


                 GestureDetector(
                  onTap: (){
                   userHandler.signSpoti();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 5,
                      margin: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 241, 241, 241),
                    child:  Row(children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child:
                                  SvgPicture.asset(
                                    'assets/images/spotify.svg',
                                      width: 30,
                                    colorFilter: ColorFilter.mode(Color.fromARGB(255, 0, 0, 0), BlendMode.srcIn),
                                    semanticsLabel: 'Settings '
                                ),

                              ),
                            ),
                      Text('Connect Spotify'),
                  ],),)
                
                ),
                
                GestureDetector(
                  onTap: (){
                    userHandler.logoutUser(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 5,
                      margin: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 241, 241, 241),
                    child: const Row(children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child:
                                Icon(Icons.logout),
                              ),
                            ),
                      Text('Logout'),
                  ],),)
                
                )



                ],),)

                ],
              ),
            ),
          ),
        
      );

    
  }


}