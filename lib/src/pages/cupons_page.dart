// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/util/cupons_list.dart';
import 'package:applibre/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CuponsPage extends StatelessWidget {
  List<Cupon> _cuponsList = getListaCupones();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(_cuponsList.length, (index) {
          return Center(
            child: CuponCard(cupon: _cuponsList[index]),
          );
        }),
      ),
    );
  }
}
