import 'package:flutter/material.dart';
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
          backgroundColor: Color.fromRGBO(40, 4, 64, 1),
          title: const Text('Post Song', style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            hintText: 'Search Song',
            leading: const Icon(Icons.search),
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
      ),
    );
  }

}