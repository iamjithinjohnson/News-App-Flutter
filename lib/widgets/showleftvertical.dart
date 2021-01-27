import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/webview.dart';
import 'package:get/get.dart';

class ShowLeftVertical extends StatelessWidget {
  final String title;
  final String desc;
  final String url;
  final String imgurl;
  final String source;
  ShowLeftVertical({
    this.title,
    this.desc,
    this.imgurl,
    this.url,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
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
            color: context.theme.dividerColor,
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.35,
                  imageUrl: imgurl,
                  width: MediaQuery.of(context).size.width,
                  filterQuality: FilterQuality.none,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
