import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class Home extends StatefulWidget{
 @override
  State<Home> createState() => _Home();

}

class _Home extends State<Home>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Color.fromRGBO(40, 4, 64, 1),
      key: _scaffoldKey,
      appBar: 
      AppBar(
        toolbarHeight: 90,
        backgroundColor:  Color.fromRGBO(40, 4, 64, 1),
        centerTitle: true,
        title: Image.asset('assets/images/Isotipo2.png', width: 82, height: 40,),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: 
              userHandler.user.image == null ? Image.asset('assets/images/userGenericImage.jpg', width: 38, height: 38,) :
              Image.network(
                userHandler.user.image!,
                width: 38.0,
                height: 38.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 38,
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white,),
          )
        ],
      ),
        drawer: drawerProfile(userHandler.user, context),
        
        body: FutureBuilder<List<Map<String, dynamic>>>(
        future:  songHandler.getSong(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al obtener datos', style: TextStyle(color:Colors.white),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles', style: TextStyle(color:Colors.white),));
          } else {
            
          return Center(child: 
           Swiper(
              itemBuilder: (BuildContext context,int index){
                final Post = snapshot.data![index];
                return Card(child: Column(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(Post['id_cancion']),
                        fit: BoxFit.cover,
                      ),
                    ),
                      
                      child: Text('Music'),)
                    ,]
                ),);
                
                
                 
              },
              itemCount: snapshot.data!.length,
                          
                itemWidth: 400.0,
                itemHeight: 400.0,
                layout: SwiperLayout.TINDER,
                    
            ));
          }
        },
      ),
    );
  }   
}