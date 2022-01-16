import 'package:applibre/src/models/category.dart';
import 'package:applibre/src/widgets/categorycard.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  List<Category> _categories = [
    Category(
        name: 'Kebabs',
        icon: Icon(
          Icons.fastfood,
          color: Colors.white,
        ),
        imageURL:
            'https://www.gourmetkebab.es/wp-content/uploads/2021/04/kebab-que-es.jpg',
        color: Colors.orange),
    Category(
        name: 'Pizzas',
        icon: Icon(
          Icons.local_pizza,
          color: Colors.white,
        ),
        imageURL:
            'https://www.unileverfoodsolutions.es/dam/global-ufs/mcos/SPAIN/calcmenu/recipes/ES-recipes/general/pizza-kebab/main-header.jpg',
        color: Colors.red),
    Category(
        name: 'Bebidas',
        icon: Icon(
          Icons.local_drink,
          color: Colors.white,
        ),
        imageURL:
            'https://www.clikisalud.net/wp-content/uploads/2019/07/refrescos-aumentan-riesgo-cancer.jpg',
        color: Colors.blue),
    Category(
        name: 'Postres',
        icon: Icon(
          Icons.cake,
          color: Colors.white,
        ),
        imageURL: 'https://i.ytimg.com/vi/2_FUW8y2J1M/maxresdefault.jpg',
        color: Colors.pink),
    Category(
        name: 'Ensaladas',
        icon: Icon(
          Icons.restaurant,
          color: Colors.white,
        ),
        imageURL:
            'http://www.comedera.com/wp-content/uploads/2015/10/ensalada-de-pollo.jpg',
        color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Text(
              'Seleccione una categoria',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: _categories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
