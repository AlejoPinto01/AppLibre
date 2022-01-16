import 'package:applibre/src/pages/cupons.dart';
import 'package:applibre/src/pages/home.dart';
import 'package:applibre/src/pages/login.dart';
import 'package:applibre/src/pages/maps.dart';
import 'package:applibre/src/pages/menu.dart';
import 'package:applibre/src/pages/profile.dart';
import 'package:applibre/src/util/data.dart';
import 'package:flutter/material.dart';

List<Widget> createPages(bool registro) {
  if (registro) {
    return <Widget>[
      HomePage(),
      CuponsPage(),
      MenuPage(),
      MapsPage(),
      ProfilePage(user: getUser()),
    ];
  } else {
    return <Widget>[
      HomePage(),
      CuponsPage(),
      MenuPage(),
      MapsPage(),
      LoginPage(),
    ];
  }
}
