// ignore_for_file: prefer_const_constructors

import 'package:applibre/src/pages/pages.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';

List<Widget> createPages(bool registro) {
  if (registro) {
    return <Widget>[
      HomePage(),
      CuponsPage(),
      MenuPage(),
      PreMapPage(),
      ProfilePage(user: getUser()),
    ];
  } else {
    return <Widget>[
      HomePage(),
      CuponsPage(),
      MenuPage(),
      PreMapPage(),
      LoginPage(),
    ];
  }
}
