import 'package:applibre/src/models/category.dart';
import 'package:applibre/src/pages/category_page.dart';
import 'package:applibre/src/pages/dish_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatefulWidget {
  Category category;

  CategoryCard({required this.category});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.category.name);
        final route = MaterialPageRoute(
          builder: (context) {
            return CategoryPage(category: widget.category);
          },
        );
        Navigator.push(context, route);
      },
      child: _dishImageWidget(),
    );
  }

  _dishImageWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            //color: Colors.black.withOpacity(0.3),
            color: widget.category.color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 12),
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.category.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      color: widget.category.color,
                      padding: EdgeInsets.all(10),
                      child: widget.category.icon,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.category.name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
