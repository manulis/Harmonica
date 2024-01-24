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
                    'https://thumbs.dreamstime.com/b/retrato-de-un-joven-apuesto-y-sonriente-con-brazos-plegados-hombres-alegres-sonrientes-las-manos-cruzadas-aislados-en-estudio-172869765.jpg',
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
