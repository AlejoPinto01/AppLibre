import 'dart:io';

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
