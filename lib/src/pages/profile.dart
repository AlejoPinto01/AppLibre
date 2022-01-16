import 'dart:async';
import 'dart:io';

import 'package:applibre/src/widgets/defaultImageWidget.dart';
import 'package:applibre/src/widgets/imageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

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
  //File f = _defaultImage();
  
  //File f = await getImageFileFromAssets('assets/myImage.jpg');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Tu perfil'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Spacer(),
            image != null
             ? ImageWidget(
                image: image!,
                onClicked: (source) => pickImage(source),
              )
            : DefaultImageWidget(
                image: Image.asset("assets/noImageProfile.png"),
                onClicked: (source) => pickImage(source),
              ),
            SizedBox(height: 24),
            _buildbutton(
              title: 'Pick image from gallery', 
              icon: Icons.image_outlined,
              onClicked: () => pickImage(ImageSource.gallery),
            ),
            SizedBox(height: 24),
            _buildbutton(
              title: 'Pick image from camera', 
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  _pickerDialog(BuildContext context) {
    showDialog(
      context: context,
      //permet tancar l'alerta quan es pitja defora
      barrierDismissible: true,
      builder: (context){
      return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text('Títol de la alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildbutton(
                title: 'Pick image from gallery', 
                icon: Icons.image_outlined,
                onClicked: () => pickImage(ImageSource.gallery),
              ),
              _buildbutton(
                title: 'Pick image from camera', 
                icon: Icons.camera_alt_outlined,
                onClicked: () {}
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel·lar')),
          ], 
        );
      }
    );
  }

  Widget _buildbutton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) => 
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(56),
            primary: Colors.white,
            onPrimary: Colors.black,
            textStyle: TextStyle(fontSize: 20),
          ),
          onPressed: onClicked, 
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 16),
              Text(title),
            ],
          ),
        );

  
} 