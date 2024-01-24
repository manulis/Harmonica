import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';


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
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://img.freepik.com/foto-gratis/hombre-feliz-pie-playa_107420-9868.jpg?1',
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
          
        children: [   
          SingleChildScrollView(




          ),
        ],
      ), 
    );
  }   
}
