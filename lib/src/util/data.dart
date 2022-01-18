import 'dart:io';

import 'package:applibre/src/models/cupon.dart';
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

void setImage(File? temporalImg){
  image = temporalImg;
}

File? getImage() {
  return image;
}
PageController pageController = PageController(
  initialPage: 0,
  keepPage: true  
);

List<Cupon> getListaCupones() {
  return [
    Cupon(
      name: '2x1',
      description:
          'Con este cupón podrás de disfrutar dos Kebabs por el precio de uno!',
      code: '555763',
      imageURL:
          'https://www.gourmetkebab.es/wp-content/uploads/2021/04/kebab-que-es.jpg',
    ),
    Cupon(
      name: 'KePatatas',
      description: 'Las patatas te salen a mitad de precio!',
      code: '987124',
      imageURL:
          'https://kebabvarillas.com/wp-content/uploads/2020/08/Tapa-Varillas-Carne-con-Patatas-y-Ensalada.png',
    ),
    Cupon(
      name: 'Menú kebab',
      description: 'asdfasdfasfd',
      code: '642987',
      imageURL:
          'https://kebabvarillas.com/wp-content/uploads/2020/08/Menu-Doner-Kebab-Falafel-Patatas-Bebida.png',
    ),
    Cupon(
      name: 'ExtraQueso',
      description:
          'Con este cupón disfruta de un extra de queso en uno de nuestros productos.\n¡El que quieras!',
      code: '083512',
      imageURL:
          'https://unareceta.com/wp-content/uploads/2016/08/receta-kebab-de-cordero.jpg',
    ),
    Cupon(
      name: 'DurumBida',
      description: 'Tu durum con una bebida totalmente gratis',
      code: '723918',
      imageURL:
          'https://kebabvarillas.com/wp-content/uploads/2020/08/Menu-Durum-Vegetal-Patatas-Bebida.png',
    ),
    Cupon(
      name: 'Durum 3€',
      description: 'Llévate un Durum por solo 3€',
      code: '163991',
      imageURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1SdeeHOa87Cf9t0t1leZtTM-DcfKHZ5K-_8J13NaEkcx7HoROOTzx9KzYP5gebUXTozc&usqp=CAU',
    ),
  ];
}
