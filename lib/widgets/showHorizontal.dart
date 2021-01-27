import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/webview.dart';
import 'package:newsapp/theme.dart';

import 'desc.dart';

class ShowHorizontal extends StatelessWidget {
  final String title;
  final String desc;
  final String url;
  final String imgurl;
  final String source;
  ShowHorizontal({
    this.title,
    this.desc,
    this.imgurl,
    this.url,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightsize = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WebVieww(
                title: title,
                image: imgurl,
                url: url,
                desc: desc,
              ),
            ),
          );
        },
        child: Container(
          //color: Colors.grey,
          //elevation: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: CachedNetworkImage(
                    imageUrl: imgurl,
                    height: heightsize * 0.6,
                    width: MediaQuery.of(context).size.width,
                    filterQuality: FilterQuality.none,
                    fit: BoxFit.cover),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: TitleText(titletext: title)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: heightsize > 580
                      ? DescriptionTextWidget(text: desc)
                      : DescText(desctext: desc)),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 18),
              //   child: Row(
              //     children: [
              //       Text('$source - ', style: TextStyle(color: main)),
              //       Text('time', style: TextStyle(color: main)),
              //       Spacer(),
              //       GestureDetector(
              //           child: Icon(Icons.share, color: main, size: 15),
              //           onTap: null),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
