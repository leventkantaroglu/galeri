import 'package:galeri/model.dart';

final List<Picture> pictures = [
  for (var i = 1; i <= 5; i++) //original value :31
    Picture(
        picName: "$i",
        type: (i <= 4)
            ? "jpg"
            : (i <= 30)
                ? "jpeg"
                : "svg",
        user: User("Nuri"),
        source: ImgSource.assets),
];
