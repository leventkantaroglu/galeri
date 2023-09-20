import 'dart:io';

enum ImgSource {
  assets, //asset local memory
  file, //device memory
}

class Picture {
  final String? picName; //assets
  final File? file; //device file
  final String? type; //assets
  final User user;
  final ImgSource source;

  Picture({
    this.picName,
    this.file,
    this.type,
    required this.user,
    required this.source,
  });
}

class User {
  final String name;
  User(this.name);
}
