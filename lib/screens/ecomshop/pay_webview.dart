import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  String mTitle, mUrl;
  PayWebView({required this.mTitle, required this.mUrl});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {

  bool isLoading=true;
  final _key = UniqueKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.mTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: [
         /* WebView(
            key: _key,
            initialUrl:
            '${widget.mUrl}',
           // javascriptMode: JavascriptMode.unrestricted,
            gestureRecognizers: Set()
              ..add(Factory<DragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
            onPageFinished: (value) {
              setState(() {
                isLoading = false;
              });
            },
            navigationDelegate: (NavigationRequest request) async {
              if (request.url.contains('http://return_url/?status=success')) {
                print('return url on success');
                Navigator.pop(context);
              }
              if (request.url.contains('http://cancel_url')) {
                Navigator.pop(context);
              }
              return NavigationDecision.navigate;
            },
          ),*/
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }
}
