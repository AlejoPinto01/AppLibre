import 'package:applibre/src/widgets/categorycard.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ListView(
            children: [
              CategoryCard(),
              CategoryCard(),
              CategoryCard(),
              CategoryCard(),
              CategoryCard(),
            ],
          ),
        ),
      ],
    );
  }
}
