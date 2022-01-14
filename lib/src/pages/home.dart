// ignore_for_file: prefer_const_constructors

import 'package:applibre/src/util/bottomBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return generatePage();
  }

  Widget generatePage() {
    return Container(child: AppBar(title: Text('Home Page'), backgroundColor: Colors.deepOrange,),);
  }
}
