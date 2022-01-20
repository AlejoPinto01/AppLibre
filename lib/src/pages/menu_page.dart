// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields,prefer_const_constructors, must_be_immutable

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  List<Category> _categories = [
    Category(
        name: 'Kebabs',
        icon: Icon(
          Icons.fastfood,
          color: Colors.white,
        ),
        imageURL: 'assets/images/food/categories/kebab.jpg',
        color: Colors.orange),
    Category(
        name: 'Pizzas',
        icon: Icon(
          Icons.local_pizza,
          color: Colors.white,
        ),
        imageURL: 'assets/images/food/categories/pizza.jpg',
        color: Colors.red),
    Category(
        name: 'Bebidas',
        icon: Icon(
          Icons.local_drink,
          color: Colors.white,
        ),
        imageURL: 'assets/images/food/categories/drink.jpg',
        color: Colors.blue),
    Category(
        name: 'Postres',
        icon: Icon(
          Icons.cake,
          color: Colors.white,
        ),
        imageURL: 'assets/images/food/categories/dessert.jpg',
        color: Colors.pink),
    Category(
        name: 'Ensaladas',
        icon: Icon(
          Icons.restaurant,
          color: Colors.white,
        ),
        imageURL: 'assets/images/food/categories/salad.jpg',
        color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(
                      category: _categories[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
