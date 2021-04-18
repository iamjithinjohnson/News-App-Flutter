import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class WebVieww extends StatefulWidget {
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
  _WebViewwState createState() => _WebViewwState();
}

class _WebViewwState extends State<WebVieww> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

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
          await Share.share(widget.url);
        },
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
