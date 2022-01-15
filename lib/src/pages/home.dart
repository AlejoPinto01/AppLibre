// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:applibre/src/pages/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibre/src/util/bottomBar.dart';
import 'package:flutter/material.dart';

import 'cupons.dart';
import 'maps.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _changePage = 0;

  @override
  Widget build(BuildContext context) {
    switch (_changePage) {
      case 0:
        return generatePage();
      case 1:
        return CuponsPage();
      case 2:
        return MenuPage();
      case 3:
        return MapsPage();
      case 4:
        return ProfilePage();
    }
    return generatePage();
  }

  Widget generatePage() {
    return Container(
      color: Colors.yellow[100],
      child: ListView(
        children: [
          generarCabecera(),
          Divider(),
          generarTarjetaPerfil(),
        ],
      ),
    );
  }

  Widget generarCabecera() {
    //Mejor una imagen con un logo
    return Center(
      child: Text(
        'Kebab4U',
        style: GoogleFonts.oswald(
          textStyle: TextStyle(
            color: Colors.brown[700],
            fontSize: 25,
            height: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget generarTarjetaPerfil() {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.green[700],
          onTap: () {
            setState(() {
              _changePage = 4;
            });
          },
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: ListView(children: [
                Center(
                  child: Text(
                    'Todavía no estás registrado?',
                    style: GoogleFonts.permanentMarker(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      height: 3.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                Center(
                  child: Text(
                    'Haz click aquí',
                    style: GoogleFonts.permanentMarker(
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 15, height: 2.0)),
                  ),
                )
              ]),
            ),
          ),
        ),
        color: Colors.red,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: 150,
    );
  }
}
