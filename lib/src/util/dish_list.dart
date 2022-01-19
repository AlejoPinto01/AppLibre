import 'package:applibre/src/models/models.dart';

List<Dish> getListaDishes() {
  return [
    Dish(
      name: 'Kebab',
      description: 'asdfasdf',
      price: 2.45,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Durum',
      description: 'asdfasdf',
      price: 3.50,
      image: 'assets/images/food/dishes/durum.jpg',
      categoryName: 'Kebabs',
    ),
    Dish(
      name: 'Pizza',
      description: 'asdfasdf',
      price: 2.45,
      image: 'assets/images/food/dishes/kebab.jpg',
      categoryName: 'Pizzas',
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

Map<String,int> cantidad = {};

calcularPrecio(int posi, int unit) {
  return (getPedido()[posi].price * cantidad[getPedido()[posi].name]!.toInt()).toStringAsFixed(2);
}