import 'package:applibre/src/models/dish.dart';
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
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  child: Image.asset(
                    dish.image,
                    fit: BoxFit.cover,
                  ),
                  tag: dish.name,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Precio: ',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      '${dish.price}€',
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(dish.description),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {},
        backgroundColor: Colors.red[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
