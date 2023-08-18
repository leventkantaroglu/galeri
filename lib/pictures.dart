import 'package:galeri/model.dart';

class Assets {
  static List<Picture> pictures = [
    for (var i = 1; i <= 31; i++)
      Picture(
        picName: "$i",
        type: (i <= 4)
            ? "jpg"
            : (i <= 30)
                ? "jpeg"
                : "svg",
        user: User("Nuri"),
      ),
  ];
}
