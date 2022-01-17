// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

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
          generarMiniMapa()
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
                pageController.animateToPage(getIndex(), duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            },
            child: compruebaEstado()),
        color: Colors.red,
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
              setState(() {
                setIndex(2);
                pageController.animateToPage(getIndex(), duration: Duration(milliseconds: 500), curve: Curves.ease);
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
            pageController.animateToPage(getIndex(), duration: Duration(milliseconds: 500), curve: Curves.ease);
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
                  child: Text('Ok')),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          );
        });
  }

  Widget generarMiniMapa() {
    return Container(
      child: ClipRRect(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              InkWell(
                splashColor: Colors.green[700],
                onTap: () {
                  setState(() {
                    setIndex(3);
                    pageController.animateToPage(getIndex(), duration: Duration(milliseconds: 500), curve: Curves.ease);
                  });
                },
                child: FadeInImage(
                  placeholder: AssetImage('assets/cargando.gif'),
                  image: NetworkImage(
                      'https://i.gyazo.com/c6edda1b4038750705d0d90938b4b70a.png'),
                  fadeInDuration: Duration(milliseconds: 100),
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Text("Ok");
                    }),
                ],
              )
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
