// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unnecessary_brace_in_string_interps
import 'dart:io';
import 'maps_page.dart';

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:applibre/src/pages/pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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
    return Container(
      color: Colors.yellow[100],
      child: ListView(
        physics: BouncingScrollPhysics(),
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
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'kebab4u@gmail.com',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '971836441',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
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
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            getImage() != null ? _imgPerfil() : _imgDefaultPerfil(),
          ],
        ),
      ),
    );
  }

  Widget _imgDefaultPerfil() {
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

  Widget _imgPerfil() {
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
        child: ListView(
          children: [
            Center(
              child: Text(
                'Todavía no estás registrado?',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25,
                  height: 3.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Haz click aquí',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 15, height: 2.0),
              ),
            ),
          ],
        ),
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }

  Widget generarCuponesCabecera() {
    return ListTile(
      title: Text(
        'Cupones',
        style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800]),
      ),
      trailing: TextButton(
        onPressed: () {
          setIndex(1);
          pageController.jumpToPage(getIndex());
        },
        style: TextButton.styleFrom(
          primary: Colors.red[900],
          textStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        child: Text(
          'Ver todo',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget generarCupones() {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          ListView.separated(
            itemCount: getListaCupones().length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10,
              );
            },
            itemBuilder: (BuildContext context, int i) =>
                generarCuponesSlider(i),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.black.withOpacity(0.2), Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget generarCuponesSlider(int index) {
    final targeta = InkWell(
      child: SizedBox(
        width: 110,
        height: 100,
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image: AssetImage(getListaCupones()[index].imageURL),
              fadeInDuration: Duration(milliseconds: 100),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                getListaCupones()[index].name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
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
      width: 140,
      child: ClipRRect(
        child: targeta,
        borderRadius: BorderRadius.circular(20.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          content: FittedBox(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    cupon.description,
                    style: GoogleFonts.montserrat(fontSize: 20),
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
                    style: GoogleFonts.montserrat(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Ok',
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red[900],
              ),
            ),
          ],
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
            title: Text(
              'Kebab4U',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Gran Via Colom, 3, 07300 Inca, Illes Balears',
                  style: GoogleFonts.montserrat(),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: FadeInImage(
                      placeholder: AssetImage('assets/cargando.gif'),
                      image: NetworkImage(
                          'https://i.gyazo.com/2cf6fa3e62cd925f9f9795f3186693f3.jpg'),
                      fadeInDuration: Duration(milliseconds: 100),
                      fit: BoxFit.fitHeight),
                  height: 150,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Ok',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                  ),
                ),
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
                  'https://i.gyazo.com/0560d0bfa852c7ba0969b4d9b7c7126c.jpg'),
              fadeInDuration: Duration(milliseconds: 100),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Text(
              '\nNo sabes como llegar a nosotros?\n Tranquilo, aquí tienes un mapa',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.95, 0),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red[900]),
              child: TextButton(
                child: Icon(Icons.map),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          MapsPage(),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
