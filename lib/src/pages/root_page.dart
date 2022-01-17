// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:applibre/src/util/data.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  List<Widget> widgetOptions = createPages(getRegistre());

  void onItemTapped(int index) {
    setState(() {
        setIndex(index);
        pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings),
          label: 'Cupones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Carta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_location_alt_outlined),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Perfil',
        ),
      ],
      currentIndex: getIndex(),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red,
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          pageChanged(index);
        });
      },
      children: createPages(getRegistre()),
    );
  }

  void pageChanged(int index) {
    setState(() {
      setIndex(index);
    });
  }
}
