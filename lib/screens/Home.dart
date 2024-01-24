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
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/Isotipo.png',
                  width: 30.0, // Ajusta el tamaño según tus preferencias
                  height: 30.0, // Ajusta el tamaño según tus preferencias
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.settings),
            )
          ],
        ),
    
        body: Column(
        children: [   
          SingleChildScrollView(




          ),
        ],
      ), 
    );
  }   
}
