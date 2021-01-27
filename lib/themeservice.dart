import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  Color text, boxcolor = Colors.yellow;
  Color statusbarcolor;
  Brightness statusbariconbrightness;

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!loadThemeFromBox());
    getCurrentStatusNavigationBarColor();
  }

  // if (_loadThemeFromBox()) {
  //     text = Colors.grey[800];
  //     boxcolor = Colors.grey[100];
  //     statusbarcolor = Colors.white;
  //     statusbariconbrightness = Brightness.dark;
  //   } else {
  //     text = Colors.yellow;
  //     boxcolor = Color(0xFf34323d);
  //     statusbarcolor = Colors.black;
  //     statusbariconbrightness = Brightness.light;
  //   }
  getCurrentStatusNavigationBarColor() {
    if (loadThemeFromBox()) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFFFFFFFF),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFF26242e),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      buttonColor: Colors.blue,
      dividerColor: Colors.white);
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Color(0xFF222029),
    buttonColor: Colors.red,
    dividerColor: Color(0xFf34323d),
  );
}
