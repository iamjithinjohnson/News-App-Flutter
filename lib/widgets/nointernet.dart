import 'package:flutter/material.dart';
import 'package:newsapp/themeservice.dart';
import 'package:get/get.dart';

Widget noInternet({BuildContext context, Future<void> Function() refresh}) {
  bool check = ThemeService().loadThemeFromBox();
  return Center(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      check
          ? Image.asset('assets/images/netdark.png')
          : Image.asset('assets/images/net.png'),
      IconButton(
          icon: Icon(Icons.refresh),
          iconSize: 35,
          onPressed: () async {
            await Future.delayed(Duration(seconds: 2));
            await refresh();
          }),
    ],
  ));

  // message shown
}
