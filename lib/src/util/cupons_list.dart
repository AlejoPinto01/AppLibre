import 'package:applibre/src/models/models.dart';

List<Cupon> getListaCupones() {
  return [
    Cupon(
      name: 'Kebab 2x1',
      description:
          'Con este cupón podrás de disfrutar dos Kebabs por el precio de uno!',
      code: '4862',
      imageURL: 'assets/images/food/cupons/kebab.jpg',
    ),
    Cupon(
      name: 'Durum',
      description: 'Kebab rollo! WOW! AMAZING!',
      code: '4672',
      imageURL: 'assets/images/food/cupons/durum.jpg',
    ),
    Cupon(
      name: 'Menú kebab',
      description: 'asdfasdfasfd',
      code: '4523',
      imageURL: 'assets/images/food/cupons/menu.png',
    ),
    Cupon(
      name: 'Double crispy',
      description: 'La doble crispy del nimbuu, siuuuu',
      code: '7523',
      imageURL: 'assets/images/food/cupons/doublecrispy.jfif',
    ),
    Cupon(
      name: 'KePollo',
      description: 'Nuestro Kebab de pollo por solo 4€',
      code: '1532',
      imageURL: 'assets/images/food/cupons/kepollo.jpg',
    ),
    Cupon(
      name: 'KeVegano',
      description: 'Nuestro Kebab vegano por solo 5€',
      code: '9834',
      imageURL: 'assets/images/food/cupons/kevegano.jpg',
    ),
    Cupon(
      name: 'Pizza 2x1',
      description: 'Dos pizzas al precio de una!',
      code: '7235',
      imageURL: 'assets/images/food/cupons/2x1pizza.jpg',
    ),
    Cupon(
      name: 'Pizza Menú',
      description: 'Menú de pizza por solo 7€',
      code: '6234',
      imageURL: 'assets/images/food/cupons/pizzacupon.jpg',
    )
  ];
}
