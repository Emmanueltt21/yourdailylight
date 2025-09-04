import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';
import 'package:html/parser.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yourdailylight/screens/thechurch/change_pwd.dart';
import 'package:yourdailylight/screens/thechurch/my_subscription.dart';
import 'package:yourdailylight/screens/thechurch/mylibrary.dart';
import 'package:yourdailylight/screens/thechurch/prayer_request.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../auth/LoginScreen.dart';
import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/NBDataProviders.dart';
import '../../service/notification_service.dart';
import '../../socials/Settings.dart';
import '../../utils/my_colors.dart';
import '../../utils/utils.dart';
import '../BrowserTabScreen.dart';
import 'SettingsScreen.dart';
import 'my_main_home_page.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({Key? key}) : super(key: key);


  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  //static const String storeBaseURL = 'https:play.google.com/';
  static const appStoreBaseUrl = 'https://www.apple.com/app-store/';
  double ratingValue = 0.0;
  late AppStateManager appManager;
  final _channel = MethodChannel('com.lighthouse.yourdailylight/exact_alarms');
  bool _isExactAlarmPermitted = false;
  bool _isLoading = false;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _checkExactAlarmPermission();
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteAccount(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }


  void showMessAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(
              message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount(BuildContext context) async {




      try {


        debugPrint("Deleting user .....>> ");

        appManager.unsetUserData();
        _handleSignOut();

        Provider.of<AppStateManager>(context, listen: false).unsetUserData;
        await googleSignIn.signOut();

        showMessAlert(context, 'Account deleted successfully');

        /*if (appManager.userdata != null) {
       // await user.delete();
        debugPrint("Deleting user .....>> ");
        appManager.unsetUserData;
          showMessAlert(context, 'Account deleted successfully');
        //Navigator.pushReplacementNamed(context, '/login');*/
      } catch (e) {
        debugPrint("Failed Deleting user .....>> ");
        showMessAlert(context, 'Failed to delete account: $e');
      }
    /*}else{
      debugPrint("Failed Deleting user .....>> ");
      showMessAlert(context, 'Account has been deleted : ');
    }*/
  }


  Future<void> _checkExactAlarmPermission() async {
    try {
      final bool isPermitted = await _channel.invokeMethod('areExactAlarmsPermitted');
      setState(() {
        _isExactAlarmPermitted = isPermitted;
        _statusMessage = isPermitted
            ? 'Exact alarms are permitted.'
            : 'Exact alarms are not permitted. Please enable in settings.';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Error checking exact alarm permission: $e';
      });
    }
  }

  Future<void> _openExactAlarmsSettings() async {
    try {
      await _channel.invokeMethod('openExactAlarmsSettings');
      // Re-check permission after returning from settings
      await Future.delayed(const Duration(seconds: 1));
      await _checkExactAlarmPermission();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error opening settings: $e';
      });
    }
  }

  Future<void> _scheduleDailyNotification() async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final bool isPermitted = await _channel.invokeMethod('areExactAlarmsPermitted');
      if (!isPermitted) {
        setState(() {
          _isLoading = false;
          _statusMessage = 'Cannot schedule notification: Exact alarms not permitted.';
        });
        return;
      }

      // Schedule the daily notification (assuming NotificationService exists)
     // await NotificationService.scheduleDailyNotification();
      setState(() {
        _isLoading = false;
        _statusMessage = 'Daily notification scheduled successfully!';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _statusMessage = 'Error scheduling notification: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    appManager = Provider.of<AppStateManager>(context);
    Userdata? userdata = appManager.userdata;

    return Scaffold(
      appBar: AppBar(
       // title: Text(t.profile),
        title: Text(t.profile, style: const TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ))
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: context.cardColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  (userdata != null && userdata.coverPhoto != "")
                      ? Container(
                    width: 60,
                    height: 60,
                    //color: MyColors.primary,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(userdata.coverPhoto!),
                          fit: BoxFit.fill),
                    ),
                  ) :
                   CircleAvatar(
                      backgroundImage: AssetImage(NBNewsImage1),
                      radius: 40),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      5.height,
                      Text(userdata == null ? t.guestuser : userdata.name!, style: boldTextStyle(size: 18)),
                      5.height,
                      Text(userdata == null ? t.no_phone : userdata.phone!,
                          style: primaryTextStyle(color: Colors.grey.shade800)),
                      5.height,
                      Text(userdata == null ? t.no_address : userdata.email!,
                          style: secondaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
            ),
          /*  16.height,
            const Text(
              'Notification Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _statusMessage,
              style: TextStyle(
                color: _statusMessage.contains('Error') ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isExactAlarmPermitted ? null : _openExactAlarmsSettings,
              child: const Text('Enable Exact Alarms in Settings'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : _scheduleDailyNotification,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Schedule Daily Notification'),
            ),*/

            16.height,
            Container(
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: <Widget>[

                 /* profileOption(t.mylibrary, Icons.newspaper, MyColors.accentDark)
                      .onTap(() {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyLibrary()));
                  }),
                  profileOption(t.prayer_request, Icons.mail, MyColors.accentDark)
                      .onTap(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerRequest()));

                  }),*/
                  /*profileOption(
                      t.mySubscription, Icons.payment, MyColors.accentDark)
                      .onTap(() {xx
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MySubscription()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePass()));
                  }),*/
                  profileOption(
                      t.changepwd, Icons.key, MyColors.accentDark)
                      .onTap(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePwd()));
                  }),

                ],
              ),
            ),
            16.height,
            Container(
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: <Widget>[
                  10.height,
                /*  profileOption(
                      t.settings, Icons.settings, MyColors.accentDark).onTap((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      }),
                  profileOption(
                    t.share,
                    Icons.share,
                    MyColors.accentDark,
                  ).onTap(() async {
                    await Utils.shareApp(Platform.isIOS
                        ? ApiUrl.iosAppShareUrlDesc
                        : ApiUrl.androidAppShareUrlDesc);

                  }),

                  profileOption(
                    t.rate,
                    Icons.rate_review,
                    MyColors.accentDark,
                  ).onTap(() async {

                    rateAppNow(context);

                    *//*PackageInfo.fromPlatform().then((value) {
                      String package = '';
                      if (isAndroid) package = value.packageName;

                      launchUrl('${storeBaseURL()}$package');
                    });*//*
                  }),

                  profileOption(t.help_support, Icons.call, MyColors.accentDark)
                      .onTap(() async {
                   openEmailSupport(context);

                  }),*/

                  profileOption(t.delete_account, Icons.delete, MyColors.accentDark)
                      .onTap(() async {
                        if(appManager.userdata!=null){
                          _showDeleteAccountDialog(context);
                        }else{
                          showMessAlert(context, "Account has already been deleted ");
                        }

                   // openBrowserTab(context, t.facebook, ApiUrl.appContactDeleteAcc);

                  }),
                  10.height,
                ],
              ),
            ),
            16.height,
          /*  Container(
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  profileOption("Terms & Conditions",
                      Icons.sticky_note_2_outlined, MyColors.accentDark)
                      .onTap(() {

                  }),
                  *//*profileOption("Questions & Answers", Icons.help,
                      MyColors.accentDark)
                      .onTap(() {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpGuide()));
                  }),*//*
                  profileOption("Help & Support ", Icons.call, MyColors.accentDark)
                      .onTap(() {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupportPage()));
                  }),
                  8.height,
                ],
              ),
            ),*/
           // 16.height,
           /* Container(
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: <Widget>[
                  profileOption(t.logout, Icons.logout, Colors.red).onTap( () async {
                    bool? res = await showConfirmDialog(
                      context,
                      t.quest_logout,
                      positiveText: t.yes,
                      negativeText: t.no,
                    );

                    if (res ?? false) {
                     // Navigator.of(context).pop();
                      appManager.unsetUserData();
                     _handleSignOut();

                    }
                  }

                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  void rateAppNow(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            elevation: 5,
            insetPadding: const EdgeInsets.all(30),
            insetAnimationCurve: Curves.easeInExpo,
            insetAnimationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingBar(
                    initialRating: 0.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 45,
                    glowColor: Colors.orange,
                    unratedColor: Colors.grey,
                    glow: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      half:
                      const Icon(Icons.star_half, color: Colors.orange),
                      empty:  Icon(Icons.star_border,
                          color: Colors.grey.shade300),
                    ),
                    onRatingUpdate: (double value) {
                      debugPrint("rating=> $value");
                      ratingValue = value;
                    },
                  ),
                  Text(
                    t.enjoy_using + "${ApiUrl.appName}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                        fontStyle: FontStyle.normal
                    ),
                  ),
                    Text(
                    t.tap_rate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontStyle: FontStyle.normal
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (ratingValue == 0.0) {
                            Utils().showToast(
                                t.please_rate);
                          } else {
                            // App Rating Api Call After Button Click
                            debugPrint("Clicked on rateApp");
                            await Utils.redirectToStore();
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient:   LinearGradient(
                                colors: [ MyColors.primary,
                                  MyColors.accent,],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child:   Text(
                            t.submit,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontStyle: FontStyle.normal
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 120,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child:  Text(
                            t.cancel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }


  //from helper

  void openEmailSupport(BuildContext context) {
    List<String> emails = ['infos@yourdailylight.org'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Contact Support'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: emails.map((email) {
            return ListTile(
              title: Text(email, style: TextStyle(fontSize: 16, color: Colors.blue)),
              trailing: IconButton(
                icon: Icon(Icons.copy, size: 20,),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: email));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email copied to clipboard')),
                  );
                },
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }






  Future openEmailSupportOLD(context) async {
   /* EmailContent email = EmailContent(
      to: [
        'admin@yourdailylight.org',
        'infos@yourdailylight.org',
      ],
      subject: 'Your Daily Light Help and Support',
      body: 'Hello! \n\n ',
    //  cc: ['user2@domain.com', 'infos@your.com'],
      //bcc: ['boss@domain.com'],
    );

    OpenMailAppResult result =
    await OpenMailApp.composeNewEmailInMailApp(
        nativePickerTitle: t.select_email,
        emailContent: email);
    if (!result.didOpen && !result.canOpen) {
      showNoMailAppsDialog(context);
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) => MailAppPickerDialog(
          mailApps: result.options,
          emailContent: email,
        ),
      );
    }*/
  }



  Future<void> launchUrl(String url, {bool forceWebView = false}) async {
    await launch(url, forceWebView: forceWebView, enableJavaScript: true,universalLinksOnly:true).catchError((e) {
      log(e);
      toast('Invalid URL: $url');
    });
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(t.open_mail),
          content: Text(t.no_mailer),
          actions: <Widget>[
            TextButton(
              child: Text(t.ok),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  String storeBaseURL() {
    return isAndroid ? playStoreBaseURL : appStoreBaseUrl;
  }

  Future<void> _handleSignOut() async {
    try {
      await googleSignIn.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyMainHomePage()),
            (route) => false, // removes all previous routes
      );
    } catch (error) {
      print(error);
    }
  }

  Widget profileOption(var heading, var icon, Color color) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: color),
              16.width,
              Text(heading, style: primaryTextStyle()),
            ],
          ).expand(),
          const Icon(Icons.keyboard_arrow_right, color: MyColors.accentDark),
        ],
      ),
    );
  }
}
