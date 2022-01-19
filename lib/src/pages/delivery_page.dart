// ignore_for_file: unnecessary_new

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:applibre/src/pages/pages.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: const Color.fromRGBO(176, 76, 60, 1),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Text('Tu pedido ha sido procesado con éxito,\n estamos en ello',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 15,
              height: 2
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 130),
          Center(
            child: Image.asset(
              "assets/motorcycle-scooter.gif",
              height: 125.0,
              width: 125.0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(20),
        width: 200,
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Procesando pedido...',
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              TypewriterAnimatedText('Poniendo la carne a punto...',
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              TypewriterAnimatedText('Llamándote amego...',
                   textStyle: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Volver al inicio'),
        backgroundColor: Colors.red[900],
        leading: new IconButton(
          onPressed: () {
            setIndex(0);
            pedido.clear();
            cantidad.clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RootPage()),
              (Route<dynamic> route) => false
            );
          },
          icon: const Icon(Icons.check)
        ),
      )
    );
  }
}
