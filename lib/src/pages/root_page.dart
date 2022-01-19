// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:animations/animations.dart';
import 'package:applibre/src/pages/shopping_cart_page.dart';
import 'package:applibre/src/util/data.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  List<Widget> widgetOptions = createPages(getRegistre());

  void onItemTapped(int index) {
    setState(() {
      setIndex(index);
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(
            child: Image(
          image: AssetImage('assets/logo.png'),
          width: 50,
        )),
      ),
      body: buildPageView(),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        openBuilder: (BuildContext context, VoidCallback _) {
          return ShoppingPage(
            includeMarkAsDoneButton: false,
          );
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(56 / 2),
          ),
        ),
        closedColor: Color.fromRGBO(184, 28, 28, 1),
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
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
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red[900],
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
