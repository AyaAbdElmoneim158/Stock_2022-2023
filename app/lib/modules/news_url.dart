import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsUrl extends StatelessWidget {
  final String url;
  const NewsUrl({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // WebViewController controller = WebViewController();
    return Scaffold(
      appBar: AppBar(),
      body: WebView(initialUrl: url),
    );
  }
}
