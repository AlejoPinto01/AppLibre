// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishPage extends StatelessWidget {
  Dish dish;

  DishPage({required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                dish.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Hero(
                child: Image.asset(
                  dish.image,
                  fit: BoxFit.cover,
                ),
                tag: dish.name,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          calcularPedido(dish);
        },
        backgroundColor: Colors.red[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void calcularPedido(Dish dish) {
    if(cantidad.containsKey(dish.name)) {
      int actual = cantidad[dish.name]!;
      cantidad[dish.name] = (actual + 1);
      if(cantidad[dish.name] == 1) {
        addPedido(dish);
      }
    } else {
      cantidad[dish.name] = 1;
      addPedido(dish);
    }
  }
}
