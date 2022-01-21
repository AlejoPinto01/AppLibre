// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishCard extends StatelessWidget {
  Dish dish;

  DishCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) {
            return DishPage(dish: dish);
          },
        );
        Navigator.push(context, route);
      },
      child: Container(
        color: Colors.yellow[100],
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                width: 120,
                height: 120,
                  child: Hero(
                    tag: dish.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        dish.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '${dish.price.toStringAsFixed(2)}€',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
