// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:applibre/src/models/user.dart';
import 'package:applibre/src/widgets/defaultImageWidget.dart';
import 'package:applibre/src/widgets/imageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  ProfilePage({Key? key, this.user }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
_defaultImage() async {
    File f = await getImageFileFromAssets('noImageProgile.png');
    return f;
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  Icon icon = Icon(Icons.edit);
  bool read = true;
  bool edit = false;
  String? userName;
  String? text;
  final _formKey = GlobalKey<FormState>();
  Future pickImage(ImageSource imageSource) async{
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState (() => this.image = imageTemporary);
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
  void dispose(){
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Tu perfil'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
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
                onChanged: (text) => setState((){text = text;}),
                )
              ),
              IconButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      if (!edit) {
                        edit = true;
                        icon = Icon(Icons.check);
                        read = false;
                      } else {
                        edit = false;
                        userName = text;
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
      )
    );
  }

  _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Correo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: 5,),
        Text(widget.user!.email)
      ]
    );
  }
} 