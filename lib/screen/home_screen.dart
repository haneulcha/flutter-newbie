import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  final WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse('https://blog.haneulcha.com/'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              webViewController.loadRequest(Uri.parse('https://blog.haneulcha.com/'));
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              webViewController.goBack();
            },
          ),
        ],
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
