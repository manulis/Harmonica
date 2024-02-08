import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color.fromRGBO(40, 4, 64, 1),
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
              child: userHandler.user.image == null
                  ? Image.asset('assets/images/userGenericImage.jpg', width: 38, height: 38,)
                  : Image.network(
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
        future: songHandler.getSong(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al obtener datos', style: TextStyle(color:Colors.white),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles', style: TextStyle(color:Colors.white),));
          } else {
            return Center(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  final Post = snapshot.data![index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      splashColor: Color.fromARGB(26, 102, 61, 168),
                      onTap: (){},
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(Post['cancion']['Imagen']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10,),
                                          Text('${Post['cancion']['Artista']}', 
                                            style: const TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          Text('${Post['cancion']['Nombre']}'),
                                        ]
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.5),
                                ],
                                stops: [0.6, 1.0],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child:
                            Row(children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: Post['infoUsuarios']['Imagen'] == null
                                        ? Image.asset('assets/images/userGenericImage.jpg', width: 38, height: 38,)
                                        : Image.network(
                                      Post['infoUsuarios']['Imagen']!,
                                      width: 38.0,
                                      height: 38.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                '${Post['infoUsuarios']['Nombre']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],)
                          
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
                itemWidth: 300.0,
                itemHeight: screenHeight/1.5,
                layout: SwiperLayout.STACK,
              ),
            );
          }
        },
      ),
    );
  }
}
