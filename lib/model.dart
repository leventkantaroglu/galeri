import 'dart:io';

enum ImgSource {
  assets,
  file,
}

class Picture {
  final String? picName; // asset
  final File? file; // device file
  final String? type; // asset
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
