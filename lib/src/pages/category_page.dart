import 'package:applibre/src/models/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  Category category;

  CategoryPage({required this.category});

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
                  Image.network(
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
              _buildList(50),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text('Item ${i.toString()}',
              style: new TextStyle(fontSize: 25.0))));
    }

    return listItems;
  }
}
