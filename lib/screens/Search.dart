import 'package:flutter/material.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/databasePetitions.dart';

class Search extends StatefulWidget{
  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color.fromRGBO(40, 4, 64, 1),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return CustomSearchBar(
                    controller: controller,
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (text) {
                      print(controller.text);
                    },
                    hintText: 'Search User',
                    leading: Icon(Icons.search),
                  );
                },
               suggestionsBuilder: (BuildContext context, SearchController controller) {
                return Future<Iterable<Widget>>.delayed(Duration.zero, () async {
                  List<Map<String, dynamic>> userList = await userHandler.getAllusers(controller.text);
                  print(userList);
                  List<Widget> listTiles = userList.map((user) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: user['Imagen'] == null
                              ? Image.asset(
                                  'assets/images/userGenericImage.jpg',
                                  width: 38,
                                  height: 38,
                                )
                              : Image.network(
                                 user['Imagen'],
                                  width: 38.0,
                                  height: 38.0,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      title: Text(user['Nombre'] as String),
                      onTap: () {
                        setState(() {
                          controller.closeView(user['Nombre'] as String);
                          userHandler.UserProfileView = user['Nombre'];
                          nav('Profile', context);
                          print('Text' + controller.text);
                        });
                      },
                    );
                  }).toList();
                  return listTiles;
                });
              },

              ),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: userHandler.user.image == null
                  ? Image.asset(
                      'assets/images/userGenericImage.jpg',
                      width: 38,
                      height: 38,
                    )
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
            onPressed: () {
              nav('Settings', context);
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: drawerProfile(userHandler.user, context),
      body: Center(
        child: Card(),
      ),
    );
  }
}