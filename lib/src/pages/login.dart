import 'package:applibre/src/pages/profile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _pass = '';
  String _user = '';
  String _info = '';
  bool _isOpen = false;
  bool _submited = false;
  Icon _infoIcon = Icon(Icons.info);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('Registro'),
      )),
      //Llista per mostrar els elements en forma vertical
      body: Form(
        key: _formKey,
        child: ListView(
          //shrinkWrap: true,
          //posar padding per a que no estigui aferrat als costats i adalt
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
                  _crearPassword(),
                  _crearInfoPass(),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              _info,
              style: TextStyle(
                color: (Colors.red),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20.0,
            ),
            _buttonLogin(context)
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        autovalidateMode: _submited ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'El usuario no puede estar vacío';
          }
          if (text.length < 4) {
            return 'El nombre de usuario es muy corto';
          }
          return null;
        },

        //el valor es posa dins la variable _user
        onChanged: (text) => setState(() => _user = text));
  }

//crear el input d'email
  Widget _crearEmail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correu electrònic',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        autovalidateMode: _submited ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        validator: (String? value) {
          RegExp mailExp = new RegExp(
              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");
          if (value == null || value.isEmpty) {
            return 'El correo no puede estar vacío';
          } else if (!mailExp.hasMatch(value)) {
            return 'El correo introducido no tiene el formato correcto';
          }
        },
        //el valor es posa dins la variable _email
        onChanged: (text) => setState(() => _email = text));
  }

//crear input de password, posant el valor ocult
  Widget _crearPassword() {
    return SizedBox(
      width: 320,
      child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          autovalidateMode: _submited ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
          validator: (String? value) {
            RegExp passRegEx =
                new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
            if (value == null || value.isEmpty) {
              return 'La contraseña no puede estar vacia';
            } else if (!passRegEx.hasMatch(value)) {
              return 'La contraseña no està en el formato correcto';
            }
          },
          //el valor es posa dins la variable _passs
          onChanged: (text) => setState(() => _pass = text)),
    );
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
                  "La contraseña tiene que cumplir los siguientes requisitos: \n" +
                      "Al menos 1 mayúscula\n" +
                      "Al menos 1 minúsucla\n" +
                      "Mínimo 8 carácteres\n" +
                      "Al menos 1 número";
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
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
        onPressed: () { 
          _submited = true;
          if(_formKey.currentState!.validate()){ 
            _openData(context);
          }else{
            null;
          } 
        } //_loginDialog(context),
      )
    );
  }

  _openData(BuildContext context) {
    if (_formKey.currentState!.validate()) {      
      final route = MaterialPageRoute(builder: (context) {
        return ProfilePage();
      });
      Navigator.push(context, route);
    }
  }
}
