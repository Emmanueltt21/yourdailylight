import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yourdailylight/utils/my_colors.dart';

class BrowserTabScreen extends StatefulWidget {
  final String title;
  final String url;

  const BrowserTabScreen({Key? key, required this.title, required this.url}) : super(key: key);

  @override
  _BrowserTabScreenState createState() => _BrowserTabScreenState();
}

class _BrowserTabScreenState extends State<BrowserTabScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        backgroundColor: MyColors.primary, // Change to MyColors.primary if needed
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

void openBrowserTab(BuildContext context, String title, String url) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BrowserTabScreen(title: title, url: url),
    ),
  );
}
