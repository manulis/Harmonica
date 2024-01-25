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
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: AppbarTitles(context, 'Home'),
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
                width: 30.0,
                height: 30.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.settings),
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
            return Center(child: Text('Error al obtener datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
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
