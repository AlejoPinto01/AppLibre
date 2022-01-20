import 'package:applibre/src/models/models.dart';

List<Dish> getListaDishes() {
  return [
    Dish(
      name: 'Kebab',
      description:
          'Kebab tradicional. Laminas de carne de cordero, ternera, pollo o pavo (condimentadas) asada como bocadillo en pan de pita junto con vegetales (cebolla, perejil, tomate …etc.) y salsas.',
      price: 3.50,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Durum',
      description:
          'Döner enrollado en un pan plano, muy empleado en la cocina turca.',
      price: 4.50,
      image: 'assets/images/food/dishes/durum.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Kebab al plato',
      description: 'Kebab pero al plato... ¿que te esperabas?',
      price: 3.50,
      image: 'assets/images/food/dishes/kebabplato.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Pizza kebab',
      description: 'Pizza con trozos de carne de kebab encima.',
      price: 5.50,
      image: 'assets/images/food/dishes/pizzakebab.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Pizza margarita',
      description: 'asdfasdf',
      price: 5.50,
      image: 'assets/images/food/dishes/pizzamargarita.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Panacotta de fresa',
      description: 'asdfasdf',
      price: 2.50,
      image: 'assets/images/food/dishes/postre.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Polo',
      description: 'asdfasdf',
      price: 2.00,
      image: 'assets/images/food/dishes/polo.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Helado',
      description: 'asdfasdf',
      price: 2.50,
      image: 'assets/images/food/dishes/helado.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Coca-Cola',
      description: 'asdfasdf',
      price: 1.50,
      image: 'assets/images/food/dishes/cocacola.png',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Coca-Cola zero',
      description: 'asdfasdf',
      price: 1.50,
      image: 'assets/images/food/dishes/cocacolazero.jpg',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Agua',
      description: 'asdfasdf',
      price: 1.00,
      image: 'assets/images/food/dishes/water.jpg',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Ensalada con pollo',
      description: 'asdfasdf',
      price: 4.00,
      image: 'assets/images/food/dishes/ensaladapollo.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Ensalada',
      description: 'asdfasdf',
      price: 4.00,
      image: 'assets/images/food/dishes/ensalada.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Ensalada césar',
      description: 'Ensalada con salsa césar, también contiene pollo a la plancha o rebozado, a elección.',
      price: 4.50,
      image: 'assets/images/food/dishes/ensaladacesar.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Ensalada mixta',
      description: 'Una ensalada muy colorida con el rojo del tomate, la acebolla morada, el amarillo del maíz, el verde de la lechuga y el blanco del huevo.',
      price: 5.50,
      image: 'assets/images/food/dishes/ensaladamixta.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Tarta de aràndanos',
      description: 'Tarta de queso con base de galleta recubierta de mermelada de aràndanos',
      price: 3.00,
      image: 'assets/images/food/dishes/tartaarandanos.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Tarta de limón',
      description: 'Tarta de limón',
      price: 3.00,
      image: 'assets/images/food/dishes/tartalimon.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Ensalada de col y manzana',
      description: 'Ensalada con col y manzana',
      price: 3.45,
      image: 'assets/images/food/dishes/tartacolmanzana.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Fanta naranja',
      description: 'Bebida gaseaosa de naranja',
      price: 1.50,
      image: 'fantanaranja.jpg',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Cerveza estrella galicia',
      description: 'Cerveza estrella galicia',
      price: 2.00,
      image: 'cerveza.jpg',
      categoryName: 'Bebidas',
    )
  ];
}

List<Dish> pedido = [];

List<Dish> getPedido() {
  return pedido;
}

void addPedido(Dish dish) {
  pedido.add(dish);
}

void deleteDish(Dish dish) {
  pedido.remove(dish);
}

Map<String, int> cantidad = {};

calcularPrecio(int posi, int unit) {
  return (getPedido()[posi].price * cantidad[getPedido()[posi].name]!.toInt())
      .toStringAsFixed(2);
}
