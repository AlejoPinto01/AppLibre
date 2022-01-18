import 'dart:io';

import 'package:applibre/src/models/cupon.dart';
import 'package:applibre/src/models/dish.dart';
import 'package:applibre/src/models/user.dart';
import 'package:flutter/material.dart';

int index = 0;
bool registre = false;
User? newUser;
String nombreUsuario = '';
File? image;

int getIndex() {
  return index;
}

void setIndex(int i) {
  index = i;
}

bool getRegistre() {
  return registre;
}

void setRegistre(bool state) {
  registre = state;
}

void setNombreUsuario(String nombre) {
  nombreUsuario = nombre;
}

String getNombreUsuario() {
  return nombreUsuario;
}

void setUser(String nombre, String correo, String pass) {
  newUser = User(name: nombre, email: correo, password: pass);
}

User? getUser() {
  return newUser;
}

void setImage(File? temporalImg) {
  image = temporalImg;
}

File? getImage() {
  return image;
}

PageController pageController = PageController(initialPage: 0, keepPage: true);

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

List<Cupon> getListaCupones() {
  return [
    Cupon(
      name: '2x1',
      description:
          'Con este cupón podrás de disfrutar dos Kebabs por el precio de uno!',
      code: '4862',
      imageURL: 'assets/images/food/cupons/kebab.jpg',
    ),
    Cupon(
      name: 'Durum',
      description: 'Kebab rollo! WOW! AMAZING!',
      code: '456456',
      imageURL: 'assets/images/food/cupons/durum.jpg',
    ),
    Cupon(
      name: 'Menú kebab',
      description: 'asdfasdfasfd',
      code: '12341234',
      imageURL: 'assets/images/food/cupons/menu.png',
    ),
    Cupon(
        name: 'Double crispy',
        description: 'La doble crispy del nimbuu, siuuuu',
        code: 'D3334',
        imageURL: 'assets/images/food/cupons/doublecrispy.jfif')
  ];
}
