import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/screen/home.dart';

class SplashController extends GetxController {
  void time(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );
  }
}
