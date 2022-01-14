import 'package:applibre/src/pages/home.dart';
import 'package:applibre/src/util/bottomBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BottomBar(),
    );
  }
}
