import 'package:applibre/src/models/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('category.name'),
              background: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
