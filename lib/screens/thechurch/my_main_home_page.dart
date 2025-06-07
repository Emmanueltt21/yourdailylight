import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/screens/thechurch/bookstore_home.dart';
import 'package:yourdailylight/screens/thechurch/devotion_home.dart';
import 'package:yourdailylight/screens/thechurch/news_home_fragment.dart';
import 'package:yourdailylight/screens/thechurch/podcast_home.dart';
import 'package:yourdailylight/screens/thechurch/profile_home.dart';

import '../../i18n/strings.g.dart';
import '../../providers/AudioPlayerModel.dart';
import '../../providers/HomeProvider.dart';

class MyMainHomePage extends StatefulWidget {
 // const MyMainHomePage({Key? key}) : super(key: key);
  static const routeName = "/myhomepage";
  MyMainHomePage();

  @override
  State<MyMainHomePage> createState() => _MyMainHomePageState();
}

class _MyMainHomePageState extends State<MyMainHomePage> {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  int pageIndex = 0;

  final pages = [
     NewsHomeFragment(),
     DevotionHome(),
     PodcastHome(),
     BookStoreHome(),
     ProfileHome(),
  ];

  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }


  /// Check if notification permission is granted
  Future<void> _checkNotificationPermission() async {
    final bool? granted = await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();

    if (granted == null || !granted) {
      await _requestNotificationPermission();
    }
  }

  /// Request notification permission
  Future<void> _requestNotificationPermission() async {
    final PermissionStatus status = await Permission.notification.request();

    if (status.isDenied) {
      // If denied, show a dialog to guide user to settings
      _showPermissionDialog();
    }
  }

  /// Show a dialog to manually enable notifications in settings
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enable Notifications"),
        content: const Text(
            "Notifications are disabled. Please enable them in Settings to receive alerts."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await openAppSettings(); // Open app settings
              Navigator.pop(context);
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }


  void exitAppFx(){
    print('Exit app ----------> ');
  }

  void exitAppAlert(){
    if (Provider.of<AudioPlayerModel>(context, listen: false).currentMedia != null) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: new Text(t.quitapp),
          content: new Text(t.quitappaudiowarning),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text(t.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<AudioPlayerModel>(context, listen: false).cleanUpResources();
                Navigator.of(context).pop(true);
                //Navigator.of(context).pop(true);
                exitAppFx();
              },
              child: new Text(t.ok),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: new Text(t.quitapp),
          content: new Text(t.quitappwarning),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(t.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                print("i was clicked");
                Navigator.of(context).pop(true);
               // Navigator.of(context).pop(true);
                exitAppFx();
              //  SystemNavigator.pop();
              },
              child: new Text(t.ok),
            ),
          ],
        ),
      );
    }
  }
  DateTime? backPressTime;

  onWillPop() {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) >= const Duration(seconds: 2)) {
      backPressTime = now;
      //
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
            .currentMedia !=
            null) {
          return (await (showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: new Text(t.quitapp),
              content: new Text(t.quitappaudiowarning),
              actions: <Widget>[
                new ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text(t.cancel),
                ),
                new ElevatedButton(
                  onPressed: () {
                    Provider.of<AudioPlayerModel>(context, listen: false)
                        .cleanUpResources();
                    Navigator.of(context).pop(true);
                    exitAppFx();
                  },
                  child: new Text(t.ok),
                ),
              ],
            ),
          ))) ??
              false;
        } else {
          return (await (
              showDialog(
            context: context,
            builder: (context) => new CupertinoAlertDialog(
              title: new Text(t.quitapp),
              content: new Text(t.quitappwarning),
              actions: <Widget>[
                new ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text(t.cancel),
                ),
                new ElevatedButton(
                  onPressed: () {
                    print("i was clicked");
                    Navigator.of(context).pop(true);
                  //  Navigator.of(context).pop(true);
                    exitAppFx();
                   // SystemNavigator.pop();
                  },
                  child: new Text(t.ok),
                ),
              ],
            ),
          ))) ??
              false;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffC4DFCB),
       /* appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Geeks For Geeks",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),*/
        body: ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: pages[pageIndex]),
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }


  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.play_arrow_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.work_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.work_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
