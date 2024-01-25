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
          NavigationDestination(selectedIcon: Icon(Icons.home),icon: Icon(Icons.home_outlined),label: '',),
          NavigationDestination(icon:  Icon(Icons.search),label: '',),
          NavigationDestination(icon:  Icon(Icons.add),label: '',),
          NavigationDestination(icon: Badge(label: Text('2'),child: Icon(Icons.messenger_sharp),),label: '',),
        ],
      ),
      body: <Widget>[
        /// Home page
        Home(),
        /// Search page
        Home(),
        /// Add page
        Home(),
        /// Message page
        Home(),
      ][currentPageIndex],
    );
  }
}