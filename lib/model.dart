class Picture {
  final String picName;
  final String type;
  final User user;

  Picture({
    required this.picName,
    required this.type,
    required this.user,
  });
}

class User {
  final String name;
  User(this.name);
}
