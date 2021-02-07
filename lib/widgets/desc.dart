import 'package:flutter/material.dart';
import 'package:newsapp/theme.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DescriptionTextWidget extends StatelessWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  String firstHalf;
  String secondHalf;

  var flag = true.obs;

  @override
  Widget build(BuildContext context) {
    if (text.length > 70) {
      firstHalf = text.substring(0, 70);
      secondHalf = text.substring(70, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    return secondHalf.isEmpty
        ? Text(firstHalf,
            style: TextStyle(
                color: colorDesc, fontSize: 14, fontWeight: FontWeight.w400))
        : Column(
            children: <Widget>[
              Obx(
                () => Text(
                    flag.value ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: TextStyle(
                        color: colorDesc,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 5),
              Obx(() => flag.value
                  ? InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Read More",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        flag.value = false;
                      },
                    )
                  : Container()),
            ],
          );
  }
}

class TitleText extends StatelessWidget {
  final String titletext;
  TitleText({this.titletext});
  @override
  Widget build(BuildContext context) {
    String title;
    if (titletext.length > 50) {
      title = titletext.substring(0, 50);
      title = title + "....";
    } else {
      title = titletext;
    }
    return Text(title,
        style: TextStyle(
            fontSize: 18,
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic));
  }
}

class DescText extends StatelessWidget {
  final String desctext;
  DescText({this.desctext});
  @override
  Widget build(BuildContext context) {
    String desc;
    if (desctext.length > 70) {
      desc = desctext.substring(0, 70);
      desc = desc + "....";
    } else {
      desc = desctext;
    }
    return Text(desc,
        style: TextStyle(
            color: colorDesc, fontSize: 14, fontWeight: FontWeight.w400));
  }
}
