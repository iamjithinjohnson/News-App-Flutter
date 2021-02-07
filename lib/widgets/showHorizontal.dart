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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: CachedNetworkImage(
                        imageUrl: imgurl,
                        height: heightsize * 0.68,
                        width: MediaQuery.of(context).size.width,
                        filterQuality: FilterQuality.none,
                        fit: BoxFit.cover),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(title,
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                  Positioned(
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(source,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 13),
              //     child: heightsize > 480
              //         ? DescriptionTextWidget(text: desc)
              //         : DescText(desctext: desc)),
            ],
          ),
        ),
      ),
    );
  }
}
