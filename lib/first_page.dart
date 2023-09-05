import 'package:flutter/material.dart';

// TODO USE PROVIDER AS STATE MANAGEMENT
import 'package:fluttertoast/fluttertoast.dart';

import 'package:galeri/first_page_appbar.dart';
import 'package:galeri/first_page_fab.dart';
import 'package:galeri/firt_page_body.dart';

//https://github.com/sivaprasadnk/double_tap_to_exit/blob/master/lib/double_tap_to_exit.dart

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime preBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => warningState(),
      child: const Scaffold(
        appBar: FirstPageAppBar(),
        body: FirstPageBody(),
        floatingActionButton: FirstPageFab(), //<---
      ),
    );
  }

  Future<bool> warningState() async {
    //The `onWillPop` function is called when the user presses the back button. It’s a callback that returns a `Future<bool>`.

    final timeGap = DateTime.now().difference(preBackPressTime);

    //print("$timeGap");

    final noExit = timeGap >= const Duration(seconds: 3);

    preBackPressTime = DateTime.now();

    if (noExit) {
      //show toastmessage
      Fluttertoast.showToast(
          msg: "Press Back Button Again to Exit in 3 seconds");

      return false;
    } else {
      return true;
    }
  }
}
