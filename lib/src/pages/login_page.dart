// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_new, prefer_adjacent_string_concatenation, sized_box_for_whitespace

import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String pass = '';
  String user = '';
  String _info = '';
  bool _isOpen = false;
  bool _submited = false;
  Icon _infoIcon = Icon(Icons.info);
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      //Llista per mostrar els elements en forma vertical
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: appBarHeight,
              child: Center(
                child: Text('Registro',
                    style: GoogleFonts.montserrat(
                        color: Colors.brown[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        height: 2)),
              ),
            ),
            SizedBox(height: 5),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: [
                _crearUsername(),
                Divider(),
                _crearEmail(),
                Divider(),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 8, child: _crearPassword()),
                      _crearInfoPass(),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  _info,
                  style: TextStyle(
                    color: (Colors.red[900]),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                _buttonLogin(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

//crear el input d'username
  Widget _crearUsername() {
    return TextFormField(
        decoration: InputDecoration(
          hintText: 'Nombre de usuario',
          labelText: 'User',
          suffixIcon: Icon(Icons.person_outlined),
          icon: Icon(Icons.person),
          focusColor: Colors.red[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        autovalidateMode: _submited
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'El usuario no puede estar vac??o';
          }
          if (text.length < 4) {
            return 'El nombre de usuario es muy corto';
          }
          return null;
        },
        onChanged: (text) => setState(() => user = text));
  }

//crear el input d'email
  Widget _crearEmail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correu electr??nic',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        autovalidateMode: _submited
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: (String? value) {
          RegExp mailExp = new RegExp(
              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");
          if (value == null || value.isEmpty) {
            return 'El correo no puede estar vac??o';
          } else if (!mailExp.hasMatch(value)) {
            return 'El correo introducido no tiene el formato correcto';
          }
        },
        onChanged: (text) => setState(() => email = text));
  }

//crear input de password, posant el valor ocult
  Widget _crearPassword() {
    return TextFormField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          icon: Icon(Icons.lock),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        autovalidateMode: _submited
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: (String? value) {
          RegExp passRegEx =
              new RegExp(r"^(?=.*[a-z??])(?=.*[A-Z])(?=.*\d)[a-z??A-Z??\d]{8,}$");
          if (value == null || value.isEmpty) {
            return 'La contrase??a no puede estar vacia';
          } else if (!passRegEx.hasMatch(value)) {
            return 'La contrase??a no est?? en el formato correcto';
          }
        },
        //el valor es posa dins la variable _passs
        onChanged: (text) => setState(() => pass = text));
  }

  Widget _crearInfoPass() {
    return Center(
      child: IconButton(
        onPressed: () {
          setState(() {
            if (!_isOpen) {
              _isOpen = true;
              _infoIcon = Icon(Icons.info_outline);
              _info =
                  "La contrase??a tiene que cumplir los siguientes requisitos: \n" +
                      "Al menos 1 may??scula\n" +
                      "Al menos 1 min??sucla\n" +
                      "M??nimo 8 car??cteres\n" +
                      "Al menos 1 n??mero\n" +
                      "Ha de contener solo car??cteres y n??meros";
            } else {
              _isOpen = false;
              _infoIcon = Icon(Icons.info);
              _info = '';
            }
          });
        },
        icon: _infoIcon,
      ),
    );
  }

//boto per registrarse
  Widget _buttonLogin(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text(
            'Login',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: Colors.red[900],
            shadowColor: Colors.pink[700],
            elevation: 15,
          ),
          onPressed: () {
            _submited = true;
            if (_formKey.currentState!.validate()) {
              setState(() {
                setUser(user, email, pass);
                setNombreUsuario(user);
                setRegistre(true);
                setIndex(0);
                pageController.jumpToPage(
                  getIndex(),
                );
              });
            }
          } //_loginDialog(context),
          ),
    );
  }
}
