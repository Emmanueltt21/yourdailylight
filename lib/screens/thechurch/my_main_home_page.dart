import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/screens/thechurch/bookstore_home.dart';
import 'package:yourdailylight/screens/thechurch/devotion_home.dart';
import 'package:yourdailylight/screens/thechurch/news_home_fragment.dart';
import 'package:yourdailylight/screens/thechurch/podcast_home.dart';
import 'package:yourdailylight/screens/thechurch/profile_home.dart';

import '../../i18n/strings.g.dart';
import '../../main.dart';
import '../../providers/AudioPlayerModel.dart';
import '../../providers/DevotionalAlarmService.dart';
import '../../providers/HomeProvider.dart';
import '../../service/notification_service.dart';
import '../../widgets/PermissionDialog.dart';

class MyMainHomePage extends StatefulWidget {
  static const routeName = "/myhomepage";
  final int initialPageIndex;

  const MyMainHomePage({super.key, this.initialPageIndex = 0});
  //MyMainHomePage({this.initialPageIndex = 0});

  @override
  State<MyMainHomePage> createState() => _MyMainHomePageState();
}
class _MyMainHomePageState extends State<MyMainHomePage>
    with WidgetsBindingObserver {
  late int pageIndex;
  int numberCheckPermission = 0;

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
    WidgetsBinding.instance.addObserver(this);
    pageIndex = widget.initialPageIndex;
    numberCheckPermission = 0;
  /*  Future.delayed(const Duration(seconds: 3), () {
      _checkPermissionsAndShowDialogIfNeeded();
    });*/
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

/*
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissionsAndShowDialogIfNeeded(onResume: true);
    }
  }

  void _checkPermissionsAndShowDialogIfNeeded({bool onResume = false}) async {
    final prefs = await SharedPreferences.getInstance();

    bool notificationGranted =
    await NotificationService.areNotificationsGranted();
    bool alarmGranted = await areExactAlarmsPermitted();

    bool notificationStored =
        prefs.getBool("permission_notification_granted") ?? false;
    bool alarmStored = prefs.getBool("permission_alarm_granted") ?? false;

    if (notificationGranted && alarmGranted) {
      if (!notificationStored || !alarmStored) {
        await prefs.setBool("permission_notification_granted", true);
        await prefs.setBool("permission_alarm_granted", true);

        await DevotionalAlarmService.scheduleDailyReminder();
        await prefs.setBool("alarm_set", true);

        if (onResume && context.mounted) {
          toast("✅ Permissions granted. Daily reminder enabled.");
        }
      }
      return;
    }

    if ((!notificationStored || !alarmStored) && context.mounted) {
      if (numberCheckPermission < 2) {
        numberCheckPermission++;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => PermissionDialog(
          ),
        );
      } else {
        if (!notificationStored && !alarmStored) {
          toasty(context,
              "Permission has not been granted to Receive All Notifications");
        } else if (!notificationStored) {
          toasty(context,
              "Permission has not been granted to Receive Custom Notifications");
        } else if (!alarmStored) {
          toasty(context,
              "Permission has not been granted to Receive Daily Notifications");
        }
      }
    }
  }
*/

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      pageIndex = args;
    }
  }

  void exitAppFx() {
    print('Exit app ----------> ');
  }

  void exitAppAlert() {
    if (Provider.of<AudioPlayerModel>(context, listen: false).currentMedia !=
        null) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(t.quitapp),
          content: Text(t.quitappaudiowarning),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(t.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<AudioPlayerModel>(context, listen: false)
                    .cleanUpResources();
                Navigator.of(context).pop(true);
                exitAppFx();
              },
              child: Text(t.ok),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(t.quitapp),
          content: Text(t.quitappwarning),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(t.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                print("i was clicked");
                Navigator.of(context).pop(true);
                exitAppFx();
              },
              child: Text(t.ok),
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
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false).currentMedia !=
            null) {
          return (await showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(t.quitapp),
              content: Text(t.quitappaudiowarning),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(t.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<AudioPlayerModel>(context, listen: false)
                        .cleanUpResources();
                    Navigator.of(context).pop(true);
                    exitAppFx();
                  },
                  child: Text(t.ok),
                ),
              ],
            ),
          )) ??
              false;
        } else {
          return (await showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(t.quitapp),
              content: Text(t.quitappwarning),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(t.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("i was clicked");
                    Navigator.of(context).pop(true);
                    exitAppFx();
                  },
                  child: Text(t.ok),
                ),
              ],
            ),
          )) ??
              false;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffC4DFCB),
        body: ChangeNotifierProvider(
            create: (context) => HomeProvider(), child: pages[pageIndex]),
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    double bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottomInset),
      height: 60 + bottomInset,
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
          buildNavItem(0, Icons.home_filled, Icons.home_outlined),
          buildNavItem(1, Icons.calendar_month, Icons.calendar_month_outlined),
          buildNavItem(2, Icons.play_arrow, Icons.play_arrow_outlined),
          buildNavItem(3, Icons.work_rounded, Icons.work_outline),
          buildNavItem(4, Icons.person, Icons.person_outline),
        ],
      ),
    );
  }

  Widget buildNavItem(int index, IconData active, IconData inactive) {
    return IconButton(
      enableFeedback: false,
      onPressed: () {
        setState(() {
          pageIndex = index;
        });
      },
      icon: Icon(
        pageIndex == index ? active : inactive,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
