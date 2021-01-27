import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class WebVieww extends StatelessWidget {
  final String title;
  final String image;
  final String url;
  final String desc;

  WebVieww({
    @required this.title,
    @required this.image,
    @required this.url,
    @required this.desc,
  });
  @override
  Widget build(BuildContext context) {
    Completer<WebViewController> _controller = Completer<WebViewController>();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
        onPressed: () async {
          await Share.share(url);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Material(
                  elevation: 1,
                  color: context.theme.dividerColor,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        height: MediaQuery.of(context).size.height * 0.55,
                        imageUrl: image,
                        width: MediaQuery.of(context).size.width,
                        filterQuality: FilterQuality.none,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical,
                child: WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
