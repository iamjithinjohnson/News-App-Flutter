import 'package:flutter/material.dart';
import 'package:newsapp/themeservice.dart';

Widget noInternet(BuildContext context) {
  bool check = ThemeService().loadThemeFromBox();
  return Center(
      child: check
          ? Image.asset('assets/images/netdark.png')
          : Image.asset('assets/images/net.png'));
}
