import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:galeri/model.dart';

class DetailPage extends StatelessWidget {
  final Picture picture;
  const DetailPage({required this.picture, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            const Text("Doğa Resimleri", style: TextStyle(color: Colors.black)),
      ),
      body: bodyImage(),
      bottomSheet: Text(
        picture.user.name,
        style: const TextStyle(fontSize: 20),
      ),
      extendBodyBehindAppBar: true,
    );
  }

  Widget bodyImage() {
    final imagePath = "assets/images/${picture.picName}.${picture.type}";
    return Stack(
      children: [
        Image.asset(
          "assets/images/flower.png",
          height: double.infinity,
          repeat: ImageRepeat.repeat,
        ),
        Positioned.fill(
          child: Container(
            child: picture.type != "svg"
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  )
                : SvgPicture.asset(imagePath),
          ),
        ),
      ],
    );
  }
}
