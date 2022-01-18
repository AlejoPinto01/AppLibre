// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:applibre/src/models/cupon.dart';
import 'package:applibre/src/pages/login.dart';
import 'package:applibre/src/pages/profile.dart';
import 'package:applibre/src/pages/root_page.dart';
import 'package:applibre/src/util/pages.dart';
import 'package:applibre/src/widgets/imageWidget.dart';
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
  String nombreUsuario = getNombreUsuario();
  AssetImage defaultimg = AssetImage("assets/noImageProfile.png");
  @override
  Widget build(BuildContext context) {
    return generatePage();
  }

  Widget generatePage() {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: ListView(
        children: [
          generarTarjetaPerfil(),
          Divider(),
          generarCardImagen(),
          Divider(),
          generarCuponesCabecera(),
          Divider(),
          generarCupones(),
          generarMiniMapa(),
          Container(
            height: 100,
          )
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
              setIndex(4);
              pageController.jumpToPage(getIndex());
            },
            child: compruebaEstado()),
        color: Colors.red[900],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: compruebaAltura(),
    );
  }

  double compruebaAltura() {
    if (getRegistre()) {
      return 100;
    } else {
      return 150;
    }
  }

  Widget compruebaEstado() {
    if (getRegistre()) {
      return boxRegistrado();
    } else {
      return boxNoRegistrado();
    }
  }

  Widget boxRegistrado() {
    return SizedBox(
      width: 300,
      height: 50,
      child: Center(
        child: Column(
          children: [
            Text(
              'Hola, ${nombreUsuario}',
              style: GoogleFonts.permanentMarker(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            getImage() != null ? _imgPerfil() : _imgDefaultPerfil(),
          ],
        ),
      ),
    );
  }

  Widget _imgDefaultPerfil(){
    return ClipOval(
      child: Material(
        color: Colors.transparent,
      child: Ink.image(
        image: defaultimg,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
        ),
      ),
    );
  }

Widget _imgPerfil(){
    final imagePath = image!.path;
    final finalImage = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
      child: Ink.image(
        image: finalImage as ImageProvider,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
        ),
      ),
    );
  }
  
  Widget boxNoRegistrado() {
    return SizedBox(
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
                ),
              ),
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
    );
  }

  Widget generarCardImagen() {
    return Container(
      child: ClipRRect(
        child: Card(
          child: InkWell(
            splashColor: Colors.green[700],
            onTap: () {
              setIndex(2);
              pageController.jumpToPage(getIndex());
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image: NetworkImage(
                  'https://i.gyazo.com/8486de22fc88daadd7f29644bbd6b640.png'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget generarCuponesCabecera() {
    return ListTile(
      title: Text('Cupones', 
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold,
          color: Colors.brown[800]
          ),
        ),
      ),
      trailing: TextButton(
        onPressed: () {
          setIndex(1);
          pageController.jumpToPage(getIndex());
        },
        style: TextButton.styleFrom(
          primary: Colors.red[900],
          textStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 15
            ),
          ),
        ),
        child: Text('Ver todo'),
      ),
    );
  }

  Widget generarCupones() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 200,
      child: ListView.separated(
          itemCount: getListaCupones().length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 5,
            );
          },
          itemBuilder: (BuildContext context, int i) =>
              generarCuponesSlider(i)),
    );
  }

  Widget generarCuponesSlider(int index) {
    final targeta = InkWell(
      child: Container(
        width: 110,
        height: 100,
        // color: Colors.green,
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image: NetworkImage(getListaCupones()[index].imageURL),
              fadeInDuration: Duration(milliseconds: 100),
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(getListaCupones()[index].name, style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),
              ),),
            ),
          ],
        ),
      ),
      onTap: () {
        _mostrarAlertCupones(context, getListaCupones()[index]);
      },
    );
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        child: targeta,
        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 5.0))
        ],
        color: Colors.white,
      ),
    );
  }

  void _mostrarAlertCupones(BuildContext context, Cupon cupon) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            cupon.name,
            style: TextStyle(fontSize: 20),
          ),
          content: FittedBox(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: Text(
                    cupon.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cupon.qrCode),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    cupon.code,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Kebab Tot Bo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Carrer de Ponent, 1, 07300 Inca, Illes Balears'),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FadeInImage(
                      placeholder: AssetImage('assets/cargando.gif'),
                      image: NetworkImage(
                          'https://i.gyazo.com/5996a0545ed8c997e70b0038cf5172a9.png'),
                      fadeInDuration: Duration(milliseconds: 100),
                      fit: BoxFit.fitHeight),
                  height: 150,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
                style: TextButton.styleFrom(
                  primary: Colors.red[900],
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          );
        });
  }

  Widget generarMiniMapa() {
    return Card(
      child: Column(
        children: <Widget>[
          InkWell(
            splashColor: Colors.green[900],
            onTap: () {
              _mostrarAlert(context);
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image: NetworkImage(
                  'https://i.gyazo.com/c6edda1b4038750705d0d90938b4b70a.png'),
              fadeInDuration: Duration(milliseconds: 100),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Text(
                '\nNo sabes como llegar a nosotros?\n Tranquilo aquí tienes un mapa',
                style: GoogleFonts.montserrat(textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),),
          ),
          Align(
            alignment: Alignment(0.9, -1),
            heightFactor: 0.5,
            child: FloatingActionButton(
              backgroundColor: Colors.red[900],
              splashColor: Colors.green[900],
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return MapsPage();
                });
                Navigator.push(context, route);
              },
              child: Icon(Icons.map),
            ),
          )
        ],
      ),
    );
  }
}
