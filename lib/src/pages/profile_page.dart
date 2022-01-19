// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:applibre/src/models/models.dart';
import 'package:applibre/src/util/utils.dart';
import 'package:applibre/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

class _ProfilePageState extends State<ProfilePage> {
  File? image = getImage();
  Icon icon = Icon(Icons.edit);
  bool read = true;
  bool edit = false;
  String? userName;
  String? _text;
  final _formKey = GlobalKey<FormState>();
  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        setImage(imageTemporary);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.user!.name);
    userName = widget.user!.name;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
          shrinkWrap: true,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            image != null
                ? ImageWidget(
                    image: image!,
                    onClicked: (source) => pickImage(source),
                  )
                : DefaultImageWidget(
                    onClicked: (source) => pickImage(source),
                  ),
            SizedBox(height: 30),
            _buildName(),
            SizedBox(height: 25),
            _buildEmail(),
            SizedBox(
              height: 50,
            ),
            _logOut()
          ],
        ),
      ),
    );
  }

  _buildName() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              children: [
                Expanded(
                    flex: 8,
                    child: TextFormField(
                      controller: controller,
                      readOnly: read,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'El usuario no puede estar vacío';
                        }
                        if (text.length < 4) {
                          return 'El nombre de usuario es muy corto';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _text = text;
                      }),
                    )),
                IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        if (!edit) {
                          edit = true;
                          icon = Icon(Icons.check);
                          read = false;
                        } else {
                          edit = false;
                          userName = _text;
                          nombreUsuario = _text!;
                          icon = Icon(Icons.edit);
                          read = true;
                        }
                      });
                    } else {
                      null;
                    }
                  },
                  icon: icon,
                )
              ],
            )
          ],
        ));
  }

  _buildEmail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Correo",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      SizedBox(
        height: 5,
      ),
      Text(widget.user!.email)
    ]);
  }

  Widget _logOut() {
    return ElevatedButton(
      child: Text("Log out", 
        style:  GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(10.0),
        primary: Colors.red[900],
        shadowColor: Colors.pink[700],
        elevation: 15
      ),
      onPressed: () {
        setState(() {
          setImage(null);
          setRegistre(false);
          setIndex(0);
          pageController.jumpToPage(index);
        });
      },
    );
  }
}
