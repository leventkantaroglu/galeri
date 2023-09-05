import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:galeri/model.dart';
import 'package:galeri/pictures.dart';

class FirstPageFab extends StatefulWidget {
  const FirstPageFab({super.key});

  @override
  State<FirstPageFab> createState() => _FirstPageFabState();
}

class _FirstPageFabState extends State<FirstPageFab> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            getImageFromDevice(ImageSource.gallery);
          },
          icon: const Icon(Icons.upload),
        ),
        IconButton(
          onPressed: () {
            getImageFromDevice(ImageSource.camera);
          },
          icon: const Icon(Icons.photo_camera),
        )
      ],
    );
  }

  Future getImageFromDevice(ImageSource imageSource) async {
    final picker = ImagePicker();
    final selected = await picker.pickImage(source: imageSource);

    setState(() {
      if (selected != null) {
        Picture filePicture = Picture(
          file: File(selected.path),
          user: User("Nuriye"),
          source: ImgSource.file,
        );
        pictures.add(filePicture);
      }
    });
  }
}
