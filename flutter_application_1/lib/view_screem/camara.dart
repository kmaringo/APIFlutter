import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_screem/camara.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CameraApp(),
    );
  }
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _image;

  Future _getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Tomar Foto'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No has tomado una foto.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: _getImageFromCamera,
        tooltip: 'Tomar Foto',
        child: const Icon(Icons.camera),
      ),
    );
  }
}