// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/pages/pages.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:applibre/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  Category category;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  CategoryPage({required this.category});

  List<Dish> _dishes = getListaDishes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: category.color,
                  shape: CircleBorder(),
                ),
                child: new IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
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
