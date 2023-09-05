import 'package:flutter/material.dart';

import 'package:galeri/pictures.dart';

class FirstPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FirstPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Text(
          pictures.length.toString(),
          style: const TextStyle(fontSize: 38),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(120, 64);
}
