import 'package:applibre/src/models/models.dart';

List<Dish> getListaDishes() {
  return [
    Dish(
      name: 'Kebab',
      description:
          'Kebab tradicional. Laminas de carne de cordero, ternera, pollo o pavo (condimentadas) asada como bocadillo en pan de pita junto con vegetales (cebolla, perejil, tomate …etc.) y salsas.',
      price: 3.5,
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
      price: 3.5,
      image: 'assets/images/food/dishes/kebabplato.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Pizza kebab',
      description: 'Pizza con trozos de carne de kebab encima.',
      price: 5.5,
      image: 'assets/images/food/dishes/pizzakebab.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Pizza margarita',
      description: 'asdfasdf',
      price: 5.5,
      image: 'assets/images/food/dishes/pizzamargarita.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Postre random genérico',
      description: 'asdfasdf',
      price: 2.5,
      image: 'assets/images/food/dishes/postre.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Polo',
      description: 'asdfasdf',
      price: 2,
      image: 'assets/images/food/dishes/polo.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Helado',
      description: 'asdfasdf',
      price: 2.5,
      image: 'assets/images/food/dishes/helado.jpg',
      categoryName: 'Postres',
    ),
    Dish(
      name: 'Coca-Cola',
      description: 'asdfasdf',
      price: 1.5,
      image: 'assets/images/food/dishes/cocacola.png',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Coca-Cola zero',
      description: 'asdfasdf',
      price: 1.5,
      image: 'assets/images/food/dishes/cocacolazero.jpg',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Agua',
      description: 'asdfasdf',
      price: 1,
      image: 'assets/images/food/dishes/water.jpg',
      categoryName: 'Bebidas',
    ),
    Dish(
      name: 'Ensalada con pollo',
      description: 'asdfasdf',
      price: 4,
      image: 'assets/images/food/dishes/ensaladapollo.jpg',
      categoryName: 'Ensaladas',
    ),
    Dish(
      name: 'Ensalada',
      description: 'asdfasdf',
      price: 4,
      image: 'assets/images/food/dishes/ensalada.jpg',
      categoryName: 'Ensaladas',
    ),
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
