import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../i18n/strings.g.dart';
import '../screens/SubscriptionScreen.dart';
import '../auth/LoginScreen.dart';

class Alerts {
  static Future<void> show(context, title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(t.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showCupertinoAlert(context, title, message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text(title),
              content: new Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  static showProgressDialog(BuildContext context, String title) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  CupertinoActivityIndicator(),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Flexible(
                      flex: 8,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }

  static subscriptionloginrequiredhint(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.loginrequired),
          content: Text(t.loginrequiredhint),
          actions: <Widget>[
            ElevatedButton(
              child: Text(t.cancel.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(t.login.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }

  static showPlaySubscribeAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.subscribehint),
          content: Text(t.playsubscriptionrequiredhint),
          actions: <Widget>[
            ElevatedButton(
              child: Text(t.cancel.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(t.subscribe),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SubscriptionScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }

  static showPreviewSubscribeAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.subscribehint),
          content: Text(t.previewsubscriptionrequiredhint),
          actions: <Widget>[
            ElevatedButton(
              child: Text(t.cancel.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(t.subscribe),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SubscriptionScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }

  static showSuccessRegAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.success),
          content: Text("You Have Successfully Created and Verify your Account Login to Proceed"),
          actions: <Widget>[
            /*ElevatedButton(
              child: Text(t.ok.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),*/
            ElevatedButton(
              child: Text(t.login),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            )
          ],
        );
      },
    );
  }

  static void showToast(BuildContext context, String message) {
   /* showFlash(
        context: context,
        duration: Duration(seconds: 3),
        builder: (_, controller) {
          return Flash(
            controller: controller,
            position: FlashPosition.bottom,
            behavior: FlashBehavior.fixed,
            backgroundColor: Colors.black,
            child: FlashBar(
              content: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });*/
  }
}
