import 'package:applibre/src/pages/cupons.dart';
import 'package:applibre/src/pages/home.dart';
import 'package:applibre/src/pages/login.dart';
import 'package:applibre/src/pages/maps.dart';
import 'package:applibre/src/pages/menu.dart';
import 'package:flutter/material.dart';

List<Widget> createPages() {
  return <Widget>[
    HomePage(),
    CuponsPage(),
    MenuPage(),
    MapsPage(),
    LoginPage()
  ];
}