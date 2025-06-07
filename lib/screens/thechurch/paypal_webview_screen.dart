import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/screens/thechurch/transac_success_page.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalWebView extends StatefulWidget {
  final String? url, from, msg, amt, orderId, addNote;

  const PaypalWebView({Key? key, this.url, this.from, this.msg, this.amt, this.orderId, this.addNote}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatePayPalWebView();
  }
}

class StatePayPalWebView extends State<PaypalWebView> {
  String message = "";
  bool isloading = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<WebViewController> _controller = Completer<
      WebViewController>();
  DateTime? currentBackPressTime;
  double? width, height;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                DateTime now = DateTime.now();
                if (currentBackPressTime == null ||
                    now.difference(currentBackPressTime!) >
                        const Duration(seconds: 2)) {
                  currentBackPressTime = now;
                  setSnackbar(
                      "Don't press back while doing payment!\n Double tap back button to exit");

                  //return Future.value(false);
                }
              //  if (widget.from == "order" && widget.orderId != null) deleteOrder();
                Navigator.pop(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(left: width! / 20.0),
                  child: const Icon(Icons.arrow_back_ios,
                       size: 32,))),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(ApiUrl.appName,
              textAlign: TextAlign.center,
              style: TextStyle(color: darkGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
        body: WillPopScope(
            onWillPop: onWillPop,
            child: Container(
              margin: EdgeInsets.only(top: height! / 30.0),
              decoration: boxCurveShadow(),
              width: width,
              child: Container(
                margin: EdgeInsets.only(left: width! / 20.0,
                    right: width! / 20.0,
                    top: height! / 50.0),
                child: Stack(
                  children: <Widget>[
                   /* WebView(
                      initialUrl: widget.url,
                      //javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                      },
                      javascriptChannels: <JavascriptChannel>{
                        _toasterJavascriptChannel(context),
                      },
                      navigationDelegate: (NavigationRequest request) async {
                        print("Url:=================***********${request.url}");
                        if (request.url.startsWith("appPaymentStatusUrl") ||
                            request.url.startsWith(
                                "flutterwavePaymentResponseUrl")) {
                          if (mounted) {
                            setState(() {
                              isloading = true;
                            });
                          }

                          String responseurl = request.url;

                          if (responseurl.contains("Failed") ||
                              responseurl.contains("failed")) {
                            if (mounted) {
                              setState(() {
                                isloading = false;
                                message = "Transaction Failed";
                              });
                            }
                            Timer(const Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          } else if (responseurl.contains("Completed") ||
                              responseurl.contains("completed") ||
                              responseurl.toLowerCase().contains("success")) {
                            if (mounted) {
                              setState(() {
                                if (mounted) {
                                  setState(() {
                                    message = "Transaction Successfull";
                                  });
                                }
                              });
                            }
                            List<String> testdata = responseurl.split("&");
                            for (String data in testdata) {
                              if (data.split("=")[0].toLowerCase() == "tx" ||
                                  data.split("=")[0].toLowerCase() ==
                                      "transaction_id") {
                                // String txid = data.split("=")[1];

                                //userProvider.setCartCount("0");

                                // CUR_CART_COUNT = "0";

                                if (widget.from == "order") {
                                  if (request.url.startsWith(
                                      "appPaymentStatusUrl")) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(builder: (
                                            BuildContext context) =>  ThankYouForOrderScreen(paymentStatus: message)),
                                        ModalRoute.withName('/home'));
                                  } else {
                                    String txid = data.split("=")[1];

                                    placeOrder(txid);
                                  }
                                } else if (widget.from == "wallet") {
                                  if (request.url.startsWith(
                                      "flutterwavePaymentResponseUrl")) {
                                    String txid = data.split("=")[1];
                                    sendRequest(txid, "flutterwave");
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                }

                                break;
                              }
                            }
                          }

                          if (request.url.startsWith("appPaymentStatusUrl") &&
                              widget.orderId != null &&
                              (responseurl.contains('Canceled-Reversal') ||
                                  responseurl.contains('Denied') ||
                                  responseurl.contains('Failed'))) {
                           // deleteOrder();
                          }
                          return NavigationDecision.prevent;
                        }
                        else if (request.url.startsWith("https://app.yourdailylight.org/dailylight/app_payment_status.php?")){
                          if(request.url.contains("Completed")){
                            //Return after payment
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    ThankYouForOrderScreen(paymentStatus: 'Successful',)));
                          }else{
                            //Return after payment
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    ThankYouForOrderScreen(paymentStatus: 'Failed',)));
                          }

                        }
                        else {}

                        return NavigationDecision.navigate;
                      },
                      onPageFinished: (String url) {
                        setState(() {
                          isloading = false;
                        });
                      },
                    ),*/
                    isloading
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                        : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
                    message
                        .trim()
                        .isEmpty
                        ? Container()
                        : Center(
                        child: Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              message,
                              style: const TextStyle(color: Colors.white),
                            )))
                  ],
                ),
              ),
            )));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      setSnackbar(
          "Don't press back while doing payment!\n Double tap back button to exit");

      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<Null> sendRequest(String txnId, String payMethod) async {

  }



  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 1.0,
    ));
  }

  Future<void> placeOrder(String tranId) async {


  }

  Future<void> addTransaction(String tranId, String orderID, String status,
      String? msg, bool redirect) async {

  }

  static BoxDecoration boxCurveShadow() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -9),
          )
        ]);
  }

}