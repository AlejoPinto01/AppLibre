// ignore_for_file: prefer_const_constructors

import 'package:applibre/src/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double appBarHeight = AppBar().preferredSize.height;

class PreMapPage extends StatelessWidget {
  const PreMapPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Center(
                child: Text('Kebab4u', 
                  style: GoogleFonts.montserrat(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              height: appBarHeight,
              color: Colors.red[700]
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
            Container(
              child: Center(
                child: Text('Gran Via Colom, 3, 07300 Inca, Illes Balears',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
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
                child: Text('Abrir mapa',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                  primary: Colors.red[900],
                  shadowColor: Colors.pink[700],
                  elevation: 15
                ),
              ),
            ),
            SizedBox(height: 40,),
            Center(
              child: Text('kebab4u@gmail.com', 
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Text('971836441',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 5)
          ],
        ),
      )
    );
  }
}