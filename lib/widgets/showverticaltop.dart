import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/webview.dart';
import 'package:newsapp/theme.dart';
import 'package:get/get.dart';

import 'desc.dart';

class ShowVerticalTop extends StatelessWidget {
  final String title;
  final String desc;
  final String url;
  final String imgurl;
  final String source;
  ShowVerticalTop({
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
          color: context.theme.dividerColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CachedNetworkImage(
                imageUrl: imgurl,
                height: height * 0.35,
                width: MediaQuery.of(context).size.width,
                filterQuality: FilterQuality.none,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              Positioned(
                top: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(' -  $source',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
