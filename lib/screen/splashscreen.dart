import 'package:flutter/material.dart';
import 'package:newsapp/controller/splashcontroller.dart';
import 'package:get/get.dart';
import 'package:newsapp/themeservice.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  SplashController timeController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    bool check = ThemeService().loadThemeFromBox();
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Center(
          child: GetBuilder<SplashController>(
            initState: (data) => timeController.time(context),
            builder: (timeController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //check
                  // ? Image.asset(
                  //     'assets/images/kudu.png',
                  //     scale: 3,
                  //   )
                  // : Image.asset(
                  //     'assets/images/ku.png',
                  //     scale: 3,
                  //   ),

                  Text(
                    'KUDU',
                    style: TextStyle(
                      fontSize: 65,
                      color: check ? Colors.white : Color(0xff8e0438),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //SizedBox(height: 5),
                  Text(
                    'news',
                    style: TextStyle(
                      fontSize: 35,
                      color: check ? Colors.white : Color(0xff8e0438),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ));
    //
  }
}
