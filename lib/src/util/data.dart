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
double appBarHeight = AppBar().preferredSize.height;

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
