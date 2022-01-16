// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:applibre/src/pages/login.dart';
import 'package:applibre/src/pages/profile.dart';
import 'package:applibre/src/pages/root_page.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:applibre/src/util/data.dart';
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
  @override
  Widget build(BuildContext context) {
    return generatePage();
  }

  Widget generatePage() {
    return Scaffold(
      body: ListView(
        children: [
          generarCabecera(),
          Divider(),
          generarTarjetaPerfil(),
          Divider(),
          generarCardImagen(),
          Divider(),
          generarCuponesCabecera(),
          Divider(),
          generarCupones(),
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
              setIndex(4);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RootPage()));
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

  Widget generarCardImagen() {
    return Container(
      child: ClipRRect(
        child: Card(
          child: InkWell(
            splashColor: Colors.green[700],
            onTap: () {
              setState(() {
                setIndex(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RootPage()));
              });
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image: NetworkImage(
                  'https://abancommercials.com/es/uploadComercial/7108.jpg'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget generarCuponesCabecera() {
    return ListTile(
      title: Text('Cupones'),
      trailing: TextButton(
        onPressed: () {
          setState(() {
            setIndex(1);
            Navigator.pushReplacement(
                context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => RootPage(),
                transitionDuration: Duration.zero));
          });
        },
        child: Text('Ver todo'),
      ),
    );
  }

  Widget generarCupones() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
              generarCuponesSlider()),
    );
  }

  Widget generarCuponesSlider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.green,
      child: InkWell(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/cargando.gif'),
                image: NetworkImage('https://via.placeholder.com/150x300'),
                height: 140,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            _mostrarAlert(context);
          });
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Código de promoción'),
            content: Text('sdgfsdfgsdf'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok')),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          );
        });
  }
}
