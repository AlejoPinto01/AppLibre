// ignore_for_file: prefer_const_constructors

import 'package:applibre/src/pages/maps.dart';
import 'package:flutter/material.dart';

class PreMapPage extends StatelessWidget {
  const PreMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Center(
                child: Text('Kebab4u', style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  ),
                ),
              ),
              height: 70,
              color: Colors.green[900]
            ),
            Container(
              height: 420,
              width: 400,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/premap.png"),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                child: Text('Gran Via Colom, 3, 07300 Inca, Illes Balears',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){
                  final route = MaterialPageRoute(builder: (context) {
                    return MapsPage();
                  });
                  Navigator.push(context, route);
                }, 
                child: Text('Abrir mapa'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)
                  ),
                  padding: EdgeInsets.all(15.0),
                  primary: Colors.white,
                  onPrimary: Colors.black
                ),
              ),
            ),
            SizedBox(height: 40,),
            Center(child: Text('kebab4u@gmail.com'),)
          ],
        ),
      )
    );
  }
}