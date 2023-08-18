import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:galeri/detail_page.dart';
import 'package:galeri/model.dart';
import 'package:galeri/pictures.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // TODO(Nadir): Bir kez geri tuşuna basarsa kullanıcıya şu mesajı verelim: "Uygulamadan çıkmak için 3 sn içinde tekrar geri tuşuna basın"
        // 3 sn içinde tekrar geri tuşuna basarsa, kullanıcı app'ten çıkabilsin
        // 3 sn içinde tekrar geri tuşuna basmamışsa, yukarıdaki mesajı tekrar göster
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                //TODO(Levent): Resim yükleme özelliği geliştirilecek
              },
              icon: const Icon(
                Icons.upload,
              ),
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
            : SvgPicture.asset(imagePath),
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
}
