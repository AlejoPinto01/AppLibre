// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:applibre/src/util/data.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage( {Key? key}) : super(key: key);
  
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _changePage = getIndex();
  List<Widget> widgetOptions = createPages(getRegistre());

  void onItemTapped(int index) {
    setState(() {
        _changePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_changePage),
      bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Cupones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Carta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_location_alt_outlined),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Perfil',
        ),
      ],
      currentIndex: _changePage,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red,
    ),
    );
  }
}