import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:galeri/detail_page.dart';
import 'package:galeri/model.dart';
import 'package:galeri/pictures.dart';

//TODO(nadir): Bir kez geri tuşuna basarsa kullanıcıya şu mesajı verelim: "Uygulamdan çıkmak için 3 sn içinde tekrar geri tuşuna basın. print ettir  veya"(-toas-popup mesajı)
//3 sn içinde tekrar geri tuşuna basarsa, kullanıcı app'dan çıkabilsin.
//3sn için tekrar geri tuşuna basmamışsa yuksarıdaki mesajı tekrar göster
//ipucu double tap to exit vss. bunun örneği var. onwillpop

//https://github.com/sivaprasadnk/double_tap_to_exit/blob/master/lib/double_tap_to_exit.dart

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime preBackPressTime = DateTime.now();
  //?? burada sürekli bir zaman mı kaydediliyor??

  late File selectedImage;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => warningState(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // TODO (levent): Rsim yükleme özelliği geliştirilecek.
                getImageFromDevice(ImageSource.gallery);
              },
              icon: const Icon(Icons.upload),
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/flower.png",
              height: double.infinity,
              repeat: ImageRepeat.repeat,
            ),
            SafeArea(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                scrollDirection: Axis.vertical,
                children: [
                  for (var picture in Assets.pictures) gridViewItem(picture),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridViewItem(Picture picture) {
    final imagePath = "assets/images/${picture.picName}.${picture.type}";
    return InkWell(
      child: Container(
        child: picture.type != "svg"
            ? Image.asset(
                imagePath,
                fit: BoxFit.contain,
              )
            : SvgPicture.asset(
                imagePath,
              ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => DetailPage(
              picture: picture,
            ),
          ),
        );
      },
    );
  }

  Future<bool> warningState() async {
    //The `onWillPop` function is called when the user presses the back button. It’s a callback that returns a `Future<bool>`.

    final timeGap = DateTime.now().difference(preBackPressTime);

    print("$timeGap");

    final noExit = timeGap >= const Duration(seconds: 3);

    preBackPressTime = DateTime.now();

    if (noExit) {
      //show toastmessage
      Fluttertoast.showToast(
          msg: "Press Back Button Again to Exit in 3 seconds");

      return false;
    } else {
      return true;
    }
  }

  Future getImageFromDevice(ImageSource imageSource) async {
    final picker = ImagePicker();
    final selected = await picker.pickImage(source: imageSource);

    //getImage(source: imageSource);

    setState(() {
      if (selected != null) {
        selectedImage = File(selected.path);
      }
    });
  }
}
