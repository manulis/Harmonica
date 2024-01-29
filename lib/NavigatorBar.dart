import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/screens/Home.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});
  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        
        indicatorColor: Color.fromRGBO(102, 61, 168, 1),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white), 
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white), 
            icon: Icon(Icons.search),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add, color: Colors.white), 
            icon: Icon(Icons.add),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2', style: TextStyle(color: Colors.white)),
              child: Icon(Icons.messenger_sharp, color: Colors.white),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Home(),
        /// Search page
        Center(child:Text('En desarrollo')),
        /// Add page
        Center(child:Text('En desarrollo')),
        /// Message page
        Center(child:Text('En desarrollo')),
      ][currentPageIndex],
    );
  }
}