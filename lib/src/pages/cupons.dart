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
          'https://www.gourmetkebab.es/wp-content/uploads/2021/04/kebab-que-es.jpg',
    ),
    Cupon(
      name: 'Kebab + patatas',
      description: 'Las patatas te salen a mitad de precio!',
      code: '456456',
      imageURL:
          'https://kebabvarillas.com/wp-content/uploads/2020/08/Tapa-Varillas-Carne-con-Patatas-y-Ensalada.png',
    ),
    Cupon(
      name: 'Menú kebab',
      description: 'asdfasdfasfd',
      code: '12341234',
      imageURL:
          'https://kebabvarillas.com/wp-content/uploads/2020/08/Menu-Doner-Kebab-Falafel-Patatas-Bebida.png',
    ),
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
