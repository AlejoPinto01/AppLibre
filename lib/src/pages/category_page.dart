// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:applibre/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  Category category;

  CategoryPage({required this.category});

  List<Dish> _dishes = getListaDishes();

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
              title: Text(
                category.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                ),
              ),
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

  List<Widget> _buildList2() {
    List<Widget> listItems = [];
    for (int i = 0; i < _dishes.length; i++) {
      if (_dishes[i].categoryName == category.name) {
        listItems.add(
          DishCard(dish: _dishes[i]),
        );
      }
    }
    return listItems;
  }
}
