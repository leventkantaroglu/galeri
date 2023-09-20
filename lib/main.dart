import 'package:flutter/material.dart';

import 'package:galeri/first_page.dart';

void main() => runApp(const GaleriApp());

class GaleriApp extends StatelessWidget {
  const GaleriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}
