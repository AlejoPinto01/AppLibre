import 'package:applibre/src/models/dish.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  Dish dish;

  DishCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(dish.name),
    );
  }
}
