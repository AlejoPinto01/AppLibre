import 'package:applibre/src/models/category.dart';
import 'package:applibre/src/models/dish.dart';
import 'package:applibre/src/widgets/dishcard.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  Category category;

  CategoryPage({required this.category});

  List<Dish> _dishes = [
    Dish(
      name: 'Kebab1234',
      description: 'asdfasdf',
      price: 2.45,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Pizza1234',
      description: 'asdfasdf',
      price: 2.45,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Pizzas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            shadowColor: Colors.black,
            backgroundColor: category.color,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category.name),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    category.imageURL,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Colors.black54,
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(
              _buildList2(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];

    for (int i = 0; i < count; i++) {
      listItems.add(
        new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text(
            'Item ${i.toString()}',
            style: new TextStyle(fontSize: 25.0),
          ),
        ),
      );
    }

    return listItems;
  }

  List<Widget> _buildList2() {
    List<Widget> listItems = [];
    for (int i = 0; i < _dishes.length; i++) {
      if (_dishes[i].categoryName == category.name) {
        listItems.add(
          new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Text(
              'Item ${_dishes[i].name}',
              style: new TextStyle(fontSize: 25.0),
            ),
          ),
        );
      }
    }
    return listItems;
  }
}
