import 'package:applibre/src/models/models.dart';

List<Dish> getListaDishes() {
  return [
    Dish(
      name: 'Kebab de ternera',
      description:
          'Kebab tradicional. Laminas de carne de ternera (condimentadas) asada como bocadillo en pan de pita junto con vegetales (cebolla, perejil, tomate …etc.) y salsas.',
      price: 3.50,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Kebab de pollo',
      description:
          'Kebab tradicional. Laminas de carne de pollo (condimentadas) asada como bocadillo en pan de pita junto con vegetales (cebolla, perejil, tomate …etc.) y salsas.',
      price: 3.50,
      image: 'assets/images/food/dishes/kebabpollo.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Kebab vegano',
      description:
          'Kebab tradicional. Laminas de tofu (condimentada) asada como bocadillo en pan de pita junto con vegetales (cebolla, perejil, tomate …etc.) y salsas.',
      price: 3.50,
      image: 'assets/images/food/dishes/kebab vegano.jpg',
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
      name: 'Durum de ternera',
      description:
          'Durum Kebab de ternera, con verduras y salsa especia',
      price: 4.50,
      image: 'assets/images/food/dishes/durum.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Durum de pollo',
      description:
          'Durum Kebab de pollo, con verduras y salsa especial',
      price: 4.50,
      image: 'assets/images/food/dishes/durumpollo.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Durum mixto',
      description:
          'Durum Kebab de pollo y ternera, con verduras y salsa especial',
      price: 5.50,
      image: 'assets/images/food/dishes/durummixto.png',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Durum rústico',
      description: 'Durum Kebab de pollo y ternera, con verduras, aceitunas negras y salsa especial con un repaso por el horno de piedra',
      price: 6.50,
      image: 'assets/images/food/dishes/durumrustico.png',
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
      name: 'Pizza pepperoni',
      description: 'Pizza con pepperoni por encima.',
      price: 5.50,
      image: 'assets/images/food/dishes/pizza pepperoni.jfif',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Pizza pollo',
      description: 'Pizza con pollo por encima.',
      price: 5.50,
      image: 'assets/images/food/dishes/pizza pollo.jpg',
      categoryName: 'Pizzas',
    ),Dish(
      name: 'Pizza romana',
      description: 'Pizza con queso de cabra y aceitunas negras.',
      price: 5.50,
      image: 'assets/images/food/dishes/pizza romana.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Pizza variada',
      description: 'Una pizza con un trozo de cada pizza de la carta',
      price: 5.50,
      image: 'assets/images/food/dishes/pizza variada.jfif',
      categoryName: 'Pizzas',
    ),Dish(
      name: 'Pizza bacon',
      description: 'Pizza con trozos de carne de kebab encima.',
      price: 5.50,
      image: 'assets/images/food/dishes/pizzabacon.jpg',
      categoryName: 'Pizzas',
    ),
    Dish(
      name: 'Postre random genérico',
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
