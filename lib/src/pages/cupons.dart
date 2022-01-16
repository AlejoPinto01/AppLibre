// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:applibre/src/util/data.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:flutter/material.dart';

class CuponsPage extends StatefulWidget {
  CuponsPage({Key? key}) : super(key: key);

  @override
  _CuponsPageState createState() => _CuponsPageState();
}

class _CuponsPageState extends State<CuponsPage> {
  int _changePage = 0;
  List<Widget> _widgetOptions = createPages();

  void onItemTapped(int index) {
    setState(() {
      print(index);
      _changePage = index;
      Navigator.push(context, MaterialPageRoute(builder: (context) => _widgetOptions.elementAt(index)));
    });
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cupons'),),
      );
  }
}