import 'package:flutter/material.dart';
import 'package:movie_app/List_screen.dart';
import 'package:movie_app/filter_screen.dart';

import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selected_index = 0;
  List<Widget> screens = [HomeScreen(), ListScreen(), FilterScreen()];
  List<String> titles = ["See Movie", "Explore", "Search"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selected_index])),
      body: screens[selected_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected_index = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: selected_index,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Filter",
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            child: const Text('Drawer'),
          ),
        ),
      ),
    );
  }
}