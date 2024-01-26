import 'package:flutter/material.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/User.dart' as UserObject;
import 'package:harmonica/functions/databasePetitions.dart';

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
              child: Image.network(
                userHandler.user.image ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                width: 39.0,
                height: 39.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 38,
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white,),
          )
        ],
      ),
        drawer: drawerProfile(userHandler.user, context),
    
        body: FutureBuilder<List<Map<String, dynamic>>>(
        future:  songHandler.getSong(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: spinkit);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al obtener datos', style: TextStyle(color:Colors.white),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles', style: TextStyle(color:Colors.white),));
          } else {
          
            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final Post = snapshot.data![index];
                      return InkWell(
                        onTap: () {
                          
                        },
                        child: ListTile(
                          title: Text('${Post['Nombre']}'),
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }   
}
