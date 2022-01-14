// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields
import 'package:applibre/src/pages/cupons.dart';
import 'package:applibre/src/pages/home.dart';
import 'package:applibre/src/pages/maps.dart';
import 'package:applibre/src/pages/menu.dart';
import 'package:applibre/src/pages/profile.dart';
import 'package:applibre/src/routes/routes.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
    static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      CuponsPage(),
      MenuPage(),
      MapsPage(),
      ProfilePage()
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
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem (
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.home),
            label: 'Cupones',
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.home),
            label: 'Carta',
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.add_location_alt_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.home),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[900],
        unselectedItemColor: Colors.brown[700],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orangeAccent[100],
      ),
    );
  }
}