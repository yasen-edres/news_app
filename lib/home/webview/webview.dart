import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {
  const Webview({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as Map<String, News>;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(news['news']!.url!)),
        ),
      ),
    );
  }
}
