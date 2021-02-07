import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/webview.dart';
import 'package:newsapp/theme.dart';
import 'package:share/share.dart';
import 'desc.dart';
import 'package:get/get.dart';

class ShowVertical extends StatelessWidget {
  final String title;
  final String desc;
  final String url;
  final String imgurl;
  final String source;
  ShowVertical({
    this.title,
    this.desc,
    this.imgurl,
    this.url,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
        child: Material(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          color: context.theme.dividerColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                  imageUrl: imgurl,
                  height: height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  filterQuality: FilterQuality.none,
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DescriptionTextWidget(text: desc),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      source.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                        child: Icon(Icons.share, size: 15),
                        onTap: () async {
                          await Share.share(url, subject: title);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
