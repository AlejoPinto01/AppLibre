import 'package:applibre/src/models/user.dart';
import 'package:flutter/material.dart';

int index = 0;
bool registre = false;
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

String nombreUsuario = '';

void setNombreUsuario(String nombre) {
  nombreUsuario = nombre;
}

String getNombreUsuario() {
  return nombreUsuario;
}

User? newUser;

void setUser(String nombre, String correo, String pass) {
  newUser = User(name: nombre, email: correo, password: pass); 
}

User? getUser() {
  return newUser;
}

PageController pageController = PageController(
    initialPage: 0,
    keepPage: true
  );