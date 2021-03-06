import 'package:applibre/src/pages/pages.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
