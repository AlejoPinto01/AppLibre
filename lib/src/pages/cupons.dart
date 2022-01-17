import 'package:applibre/src/models/cupon.dart';
import 'package:applibre/src/widgets/cuponcard.dart';
import 'package:flutter/material.dart';

class CuponsPage extends StatelessWidget {
  List<Cupon> _cuponsList = [
    Cupon(
      name: '2x1',
      description:
          'Con este cupón podrás de disfrutar dos Kebabs por el precio de uno!',
      code: '4862',
      imageURL:
          'assets/images/food/cupons/kebab.jpg',
    ),
    Cupon(
      name: 'Durum',
      description: 'Kebab rollo! WOW! AMAZING!',
      code: '456456',
      imageURL:
          'assets/images/food/cupons/durum.jpg',
    ),
    Cupon(
      name: 'Menú kebab',
      description: 'asdfasdfasfd',
      code: '12341234',
      imageURL:
          'assets/images/food/cupons/menu.png',
    ),
    Cupon(
        name: 'Double crispy',
        description: 'La doble crispy del nimbuu, siuuuu',
        code: 'D3334',
        imageURL:
            'assets/images/food/cupons/doublecrispy.jfif')
  ];

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
