import 'package:applibre/src/pages/home.dart';
import 'package:applibre/src/pages/root_page.dart';
import 'package:applibre/src/util/data.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: generaInicio(),
    );
  }

  Widget generaInicio() {
    setIndex(0);
    return RootPage();
  }
}
