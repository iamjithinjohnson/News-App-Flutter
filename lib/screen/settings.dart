import 'package:flutter/material.dart';
import 'package:newsapp/helper/category.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/screen/categorynews.dart';
import 'package:get/get.dart';
import 'package:newsapp/screen/privacy.dart';
import 'package:newsapp/themeservice.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  List<CategoryModel> catmodel = category();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Preferences',
              style: TextStyle(
                color: ThemeService().text,
                fontSize: 28,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 1,
              width: width,
              color: Colors.grey[300],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourites',
                  style: TextStyle(
                    color: ThemeService().text,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            SizedBox(height: 30),
            Container(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: catmodel.length,
                    itemBuilder: (BuildContext context, int ind) {
                      return CatShowSettings(
                        name: catmodel[ind].categoryName,
                        imgurl: catmodel[ind].imageUrl,
                        icons: catmodel[ind].icons,
                      );
                    })),
            SizedBox(height: 50),
            Container(
              height: 1,
              width: width,
              color: Colors.grey[300],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.night_shelter_outlined),
                SizedBox(width: 5),
                Text('Darkmode'),
                Spacer(),
                ToggleButton()
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Icon(Icons.privacy_tip_outlined),
                SizedBox(width: 5),
                InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PrivacyPolicy(
                                    check: true,
                                  )));
                    },
                    child: Text('Privacy Policy')),
                Spacer(),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 5),
                InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PrivacyPolicy(
                                    check: false,
                                  )));
                    },
                    child: Text('Terms and Condition')),
                Spacer(),
              ],
            ),
            Spacer(),
            Text('© Developed 2021'),
            SizedBox(height: 10),
            Text('Ver 1.2.0'),
            SizedBox(height: 10)
          ],
        ),
      )),
    );
  }
}

class CatShowSettings extends StatelessWidget {
  final String imgurl;
  final String name;
  final IconData icons;
  CatShowSettings(
      {@required this.name, @required this.imgurl, @required this.icons});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => CategoryNews(category: name)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: size * 0.4,
          decoration: BoxDecoration(
            color: context.theme.dividerColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icons,
                  //color: Colors.grey[300],
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ToggleButton extends StatelessWidget {
  bool togglevalue = ThemeService().loadThemeFromBox();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          focusColor: Colors.transparent,
          onTap: () {
            //togglevalue = !togglevalue;
            ThemeService().switchTheme();
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: togglevalue ? Colors.grey[600] : Color(0xFFe7e7e8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    '☀️',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    '🌙',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          //top: 3.0,
          left: togglevalue ? 30 : 0,
          right: togglevalue ? 0 : 30,
          child: AnimatedContainer(
            height: 30,
            width: 30,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0x66000000),
                    spreadRadius: 0.5,
                    blurRadius: 1,
                    offset: Offset(0, 2))
              ],
              shape: BoxShape.circle,
              color: togglevalue ? Color(0xFf34323d) : Color(0xFFFFFFFF),
            ),
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child: togglevalue
                    ? Text(
                        '🌙',
                        style: TextStyle(fontSize: 18),
                        key: UniqueKey(),
                      )
                    // Icon(
                    //     Icons.check_circle,
                    //     color: Colors.green,
                    //     size: 20,
                    //     key: UniqueKey(),
                    //   )
                    : Text('☀️',
                        style: TextStyle(fontSize: 18), key: UniqueKey())

                // Icon(
                //     Icons.remove_circle_outline,
                //     color: Colors.red,
                //     size: 20,
                //     key: UniqueKey(),
                //   ),
                ),
          ),
        )
      ],
    );
  }
}
