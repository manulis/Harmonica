import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:harmonica/functions/databasePetitions.dart';

class Home extends StatefulWidget{
 @override
  State<Home> createState() => _Home();

}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(   
          centerTitle: true,
          title: AppbarTitles(context, 'Home'),
         leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                print('CircleAvatar clickeado');
                print("User");
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    userHandler.user.image ?? 'https://www.hemomadrid.com/wp-content/uploads/2015/11/foto-generica.jpg',
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              iconSize: 30,
              onPressed: () {
                
              },
              icon: Icon(Icons.settings, ),
            )
          ],
        ),
    
        body: 
        Column(
          
        
        children: [],
      ), 
    );
  }   
}
