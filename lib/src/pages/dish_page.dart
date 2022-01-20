import 'dart:async';

import 'package:applibre/src/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishPage extends StatefulWidget {
  Dish dish;

  DishPage({required this.dish});

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  double _bottom = 400;
  double _left = 20;
  double _width = 350;
  double _height = 250;
  double _radius = 20;
  bool _visible = false;

  TextStyle _style = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        color: Colors.yellow[100],
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      widget.dish.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _dishImageContainer(),
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
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Precio: ',
                              textAlign: TextAlign.left,
                              style: _style,
                            ),
                          ),
                          Text(
                            '${widget.dish.price.toStringAsFixed(2)}€',
                            textAlign: TextAlign.right,
                            style: _style,
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
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        widget.dish.description,
                        style: _style,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _addDishAnimation(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          setState(
            () {
              _width = 30;
              _height = 30;
              _bottom = 20;
              _left = 190;
              _visible = true;
              Timer(
                Duration(
                  milliseconds: 1100,
                ),
                () {
                  setState(
                    () {
                      _reset();
                    },
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.red[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _dishImageContainer() {
    return Container(
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
            widget.dish.image,
            fit: BoxFit.cover,
          ),
          tag: widget.dish.name,
        ),
      ),
    );
  }

  _addDishAnimation() {
    return AnimatedPositioned(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          _radius,
        ),
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: Colors.transparent,
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.easeOutCirc,
          child: Visibility(
            visible: _visible,
            child: Image.asset(
              widget.dish.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottom: _bottom,
      left: _left,
      duration: Duration(
        seconds: 1,
      ),
      curve: Curves.easeInOutExpo,
    );
  }

  void _reset() {
    _bottom = 400;
    _left = 20;
    _width = 350;
    _height = 250;
    _radius = 20;
    _visible = false;
  }
}
