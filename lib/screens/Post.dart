import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';

class Post extends StatefulWidget{
  @override
  State<Post> createState() => _Post();
}

class _Post extends State<Post>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
        appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
              nav('NavigatorBar', context);
            },
            child: Icon(Icons.close, color: Colors.white, size: 38,),
          ),

          backgroundColor: Color.fromRGBO(40, 4, 64, 1),
          title: const Text('Post Song', style: TextStyle(color: Colors.white),),
          actions: [
          IconButton(
            iconSize: 38,
            onPressed: () {

            },
            icon: const Icon(Icons.check, color: Colors.white,),
          )
        ],
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
            return CustomSearchBar(
                controller: controller,
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                hintText: 'Search Song',
                leading: Icon(Icons.search),
             );

          }, suggestionsBuilder:
          (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
          Card(


          ),
        ],
        )
      ),
    );
  }

}