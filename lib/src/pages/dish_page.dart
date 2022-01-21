// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, use_key_in_widget_constructors,prefer_const_literals_to_create_immutables, unused_field

import 'dart:async';

import 'package:animations/animations.dart';
import 'package:applibre/src/models/dish.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages.dart';

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
  bool _buttonVisible = false;
  Timer? _timer;

  TextStyle _style = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Align(
          alignment: Alignment(-0.2, 0),
          child: Image(
            image: AssetImage('assets/logo.png'),
            width: 50,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow[100],
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      _priceContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      _descriptionContainer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85,
                ),
              ],
            ),
            _addDishAnimation(),
            _openCartButtom(),
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
              _left = 20;
              _visible = true;
              _buttonVisible = true;
              _timer = Timer(
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
          calcularPedido(widget.dish);
        },
        backgroundColor: Colors.red[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _dishImageContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.dish.image,
                fit: BoxFit.cover,
              ),
            ),
            tag: widget.dish.name,
          ),
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
      right: _left,
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

  void calcularPedido(Dish dish) {
    if (cantidad.containsKey(dish.name)) {
      int actual = cantidad[dish.name]!;
      cantidad[dish.name] = (actual + 1);
      if (cantidad[dish.name] == 1) {
        addPedido(dish);
      }
    } else {
      cantidad[dish.name] = 1;
      addPedido(dish);
    }
  }

  _openCartButtom() {
    return Positioned(
      right: 10,
      bottom: 15,
      child: AnimatedScale(
        duration: Duration(
          milliseconds: 700,
        ),
        curve: Curves.bounceOut,
        scale: _buttonVisible ? 1 : 0,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return ShoppingPage(
              includeMarkAsDoneButton: false,
            );
          },
          closedElevation: 6.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(56 / 2),
            ),
          ),
          closedColor: Color.fromRGBO(184, 28, 28, 1),
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return SizedBox(
              height: 56,
              width: 56,
              child: Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _priceContainer() {
    return Container(
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
    );
  }

  _descriptionContainer() {
    return Container(
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
                widget.dish.description,
                style: _style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
