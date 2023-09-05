import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:galeri/detail_page.dart';
import 'package:galeri/model.dart';
import 'package:galeri/pictures.dart';

class FirstPageBody extends StatefulWidget {
  const FirstPageBody({super.key});

  @override
  State<FirstPageBody> createState() => _FirstPageBodyState();
}

class _FirstPageBodyState extends State<FirstPageBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              for (var picture in pictures) gridViewItem(picture),
            ],
          ),
        ),
      ],
    );
  }

  Widget gridViewItem(Picture picture) {
    final imagePath = "assets/images/${picture.picName}.${picture.type}";
    return InkWell(
      child: Container(
        child: (picture.source == ImgSource.file)
            ? (picture.file != null)
                ? Image.file(picture.file!)
                : const Icon(Icons.broken_image)
            : picture.type != "svg"
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
}
