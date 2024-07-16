import 'package:flutter/material.dart';
import 'package:otomotifzal/feature/add_data_page.dart';
import 'package:otomotifzal/feature/list_page.dart';
import 'package:otomotifzal/feature/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ListPage(),
    AddDataPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'List Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}