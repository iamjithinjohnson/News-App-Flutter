import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  bool isLightTheme = true;
  Color backgroundcolor;

  // the code below is to manage the status bar color when the theme changes
  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF26242e),
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }

  colorCon(bool press) {
    isLightTheme = press;
    if (isLightTheme) {
      backgroundcolor = Colors.white;
      Color d = Color(0xFf34323d);
      Color dd = Color(0xFF222029);
      Color ddd = Color(0xFFe7e7e8);
      Color dddd = Color(0xFFd8d7da);
      Color ddddd = Color(0x66000000);
    } else {
      backgroundcolor = Color(0x66000000);
    }
  }
}
