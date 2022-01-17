import 'package:applibre/src/models/cupon.dart';
import 'package:applibre/src/util/data.dart';
import 'package:applibre/src/widgets/cuponcard.dart';
import 'package:flutter/material.dart';

class CuponsPage extends StatelessWidget {
  List<Cupon> _cuponsList = getListaCupones();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: GridView.count(
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
