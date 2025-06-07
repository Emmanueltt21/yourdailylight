import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../auth/LoginScreen.dart';
import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/NotificationProvider.dart';
import '../../service/Firebase.dart';
import '../../service/notification_service.dart';
import '../../utils/ApiUrl.dart';
import '../../utils/TextStyles.dart';
import '../../utils/app_themes.dart';
import '../../utils/img.dart';
import '../../utils/langs.dart';
import '../../utils/my_colors.dart';
import '../BrowserTabScreen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late AppStateManager appManager;
  static const String storeBaseURL = 'https:play.google.com/';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(settings);
  }



  Future<void> showLogoutAlert() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: new Text(t.logoutfromapp),
          content: new Text(t.logoutfromapphint),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: false,
              child: Text(t.ok),
              onPressed: () {
                Navigator.of(context).pop();
                appManager.unsetUserData();
                _handleSignOut();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: false,
              child: Text(t.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }

  Future<void> _handleSignOut() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      print(error);
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

// Add this method to the _HomePageState class
  Future<void> _testNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'test_channel', // Channel ID
      'Test Notifications', // Channel name
      channelDescription: 'Channel for testing notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      999, // Notification ID
      'Your Daily Light - Devotions', // Title
      'This is a test notification!', // Body
      notificationDetails,
      payload: 'test_payload',
    );
  }
  

  @override
  Widget build(BuildContext context) {

    appManager = Provider.of<AppStateManager>(context);
    Userdata? userdata = appManager.userdata;
    bool themeSwitch = appManager.themeData == appThemeData[AppTheme.Dark];
    String language = appLanguageData[
    AppLanguage.values[appManager.preferredLanguage]]!['name']!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(child:
        Column(
          children: [
            16.height,
            Container(height: 8),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: SizedBox(
                            width: 180, child: Text(t.chooseapplanguage)),
                        content: Container(
                          height: 250.0,
                          width: 400.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: appLanguageData.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              var selected = appLanguageData[AppLanguage
                                  .values[index]]!['name'] ==
                                  language;
                              return ListTile(
                                trailing: selected
                                    ? Icon(Icons.check)
                                    : Container(
                                  height: 0,
                                  width: 0,
                                ),
                                title: Text(
                                  appLanguageData[AppLanguage
                                      .values[index]]!['name']!,
                                ),
                                onTap: () {
                                  appManager.setAppLanguage(index);
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.language, size: 20.0),
                    Container(width: 10),
                    Text(t.selectlanguage,
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Text(
                      language,
                      style: TextStyles.subhead(context).copyWith(
                          color: MyColors.primary, fontSize: 13),
                    ),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            Container(height: 20),
            Divider(height: 1, color: Colors.grey),
            Container(height: 20),

            Consumer<NotificationProvider>(
              builder: (context, provider, _) {
                return SwitchListTile(
                  title: const Text('Daily Notifications'),
                  value: provider.isNotificationEnabled,
                  onChanged: (value) => provider.toggleNotifications(value),
                );
              },
            ),

           /* Container(height: 16),
            FloatingActionButton(
              onPressed: () async {
                // Step 1: Force initialization
                await NotificationService.initialize();

                // Step 2: Create visual notification channel
                await NotificationService.createNotificationChannel();

                // Step 3: Schedule notification for 30 seconds from now
                await NotificationService.scheduleTestNotification();

                // Step 4: Verify scheduling
                final pending = await NotificationService.getPendingNotifications();
                print('Pending Notifications: ${pending.length}');

                // Step 5: Show countdown dialog
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Test Started'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Notification scheduled in 30 seconds\n\n'
                            'Keep app in these states:'),
                        _buildTestPhase('Foreground', Colors.green),
                        _buildTestPhase('Background', Colors.orange),
                        _buildTestPhase('Terminated', Colors.red),
                      ],
                    ),
                  ),
                );
              },
              child: const Icon(Icons.notification_add),
            ),
            Container(height: 16),

            ElevatedButton(
              child: Text( 'Test Push Notification',),
              onPressed: () async {
                await _testNotification();
              },
            ),*/

            Container(height: 16),

            InkWell(
              onTap: () async {
               /* final InAppReview inAppReview = InAppReview.instance;

                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }*/
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.rate_review,
                        size: 20.0, color: Colors.grey[500]),
                    Container(width: 10),
                    Text(t.rate,
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Icon(Icons.navigate_next,
                        size: 25.0, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
            Container(height: 10),
            InkWell(
              onTap: () {
                openBrowserTab(context, t.about, ApiUrl.ABOUT);
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info, size: 20.0, color: Colors.grey[500]),
                    Container(width: 10),
                    Text(t.about,
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Icon(Icons.navigate_next,
                        size: 25.0, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
            Container(height: 10),
            InkWell(
              onTap: () {
                openBrowserTab(context, t.terms, ApiUrl.TERMS);
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.chrome_reader_mode,
                        size: 20.0, color: Colors.grey[500]),
                    Container(width: 10),
                    Text(t.terms,
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Icon(Icons.navigate_next,
                        size: 25.0, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
            Container(height: 10),
            InkWell(
              onTap: () {
                openBrowserTab(context, t.privacy, ApiUrl.PRIVACY);
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.label_important,
                        size: 20.0, color: Colors.grey[500]),
                    Container(width: 10),
                    Text(t.privacy,
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Icon(Icons.navigate_next,
                        size: 25.0, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
            60.height,
            Container(height: 10),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Text(
                  "Follow us on",
                  style: TextStyles.headline(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              //color: Colors.white,
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //openBrowserTab(homeProvider!.data['facebook_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_facebook.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(width: 10),
                    InkWell(
                      onTap: () {
                        //openBrowserTab(homeProvider!.data['youtube_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_youtube.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    /*Container(width: 10),
                    InkWell(
                      onTap: () {
                        // openBrowserTab(homeProvider!.data['twitter_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_twitter.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),*/
                    Container(width: 10),
                    InkWell(
                      onTap: () {
                        // openBrowserTab(homeProvider!.data['instagram_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_instagram.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Container(height: 15),
            Container(height: 0),
          ],
        ),
      ),


    );
  }

  

  Widget _buildTestPhase(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 12),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

}
