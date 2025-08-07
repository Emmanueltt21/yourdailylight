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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // Removed notificationService instance - using NotificationService() directly

  @override
  void initState()  {
    super.initState();
    //_initializeNotifications();
    // Check scheduled notifications in debug console
    print('INIT ---->> Settings Screen -------------->> ');
    checkSchedulingNot();

  }

  void checkSchedulingNot() async {
   try{
     final scheduled = await NotificationService().getScheduledNotifications();
     debugPrint(scheduled.toString());
   }catch(e){
     print('Error has occurred ---------->> $e');
   }

}
  Future<void> _initializeNotifications() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  // Cancel all test notifications on dispose
  @override
  void dispose() {
    NotificationService().cancelTestNotifications();
    super.dispose();
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

            /*Consumer<NotificationProvider>(
              builder: (context, provider, _) {
                return SwitchListTile(
                  title: const Text('Daily Notifications'),
                  value: provider.isNotificationEnabled,
                  onChanged: (value) => provider.toggleNotifications(value),
                );
              },
            ),*/

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
            ListTile(
              title: const Text('Daily Notification'),
              subtitle: const Text('Trigger immediate devotional notification'),
              leading: const Icon(Icons.notifications_active),
              onTap: () async {
                // Show test notification
                await NotificationService().showTestDailyDevotional();

                // Show confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Test notification triggered'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),

            // Scheduled Notifications List
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.green[700]),
                      const SizedBox(width: 12),
                      Text(
                        'Scheduled Daily Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  FutureBuilder<List<PendingNotificationRequest>>(
                    future: NotificationService().getScheduledNotifications(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      
                      if (snapshot.hasError) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error, color: Colors.red[600]),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Error loading notifications: ${snapshot.error}',
                                  style: TextStyle(color: Colors.red[600]),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      final notifications = snapshot.data ?? [];
                      final dailyNotifications = notifications.where((n) => 
                        n.title?.contains('Daily') == true || 
                        n.body?.contains('devotional') == true ||
                        n.id == 0 // Main daily notification ID
                      ).toList();
                      
                      if (dailyNotifications.isEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.warning, color: Colors.orange[600]),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  'No daily notifications scheduled. Daily reminders may not be active.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      return Column(
                        children: dailyNotifications.map((notification) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green[100]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'ID: ${notification.id}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.notifications_active,
                                      color: Colors.green[600],
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (notification.title != null)
                                  Text(
                                    notification.title!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                if (notification.body != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      notification.body!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                if (notification.payload != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Payload: ${notification.payload}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 12),
                                // Action buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          await _launchNotification(notification);
                                        },
                                        icon: const Icon(Icons.launch, size: 16),
                                        label: const Text('Launch'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[100],
                                          foregroundColor: Colors.blue[700],
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          await _editNotification(notification);
                                        },
                                        icon: const Icon(Icons.edit, size: 16),
                                        label: const Text('Edit'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange[100],
                                          foregroundColor: Colors.orange[700],
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          await _cancelNotification(notification);
                                        },
                                        icon: const Icon(Icons.cancel, size: 16),
                                        label: const Text('Cancel'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red[100],
                                          foregroundColor: Colors.red[700],
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            setState(() {}); // Refresh the list
                          },
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text('Refresh List'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[100],
                            foregroundColor: Colors.green[700],
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () async {
                try {
                  // 1. Show immediate test notification
                  await NotificationService().showTestDailyDevotional();

                  // 2. Verify scheduled notification
                  final scheduled = await NotificationService().getScheduledNotifications();
                  final hasScheduled = scheduled.any((n) => n.id == 0);

                  // 3. Show results
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(hasScheduled
                          ? '✅ Test successful! Scheduled notification active'
                          : '⚠️ Scheduled notification not found'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ Error: ${e.toString()}'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.bug_report, color: Colors.blue),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Test Notification System', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Verify scheduled notifications and permissions'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            /*InkWell(
              onTap: () async {
                await showDailyDevotionalNotification();
              },
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Container(width: 10),
                    Text('Daily Notifications',
                        style: TextStyles.subhead(context).copyWith(
                          fontSize: 15,
                        )),
                    Spacer(),
                    Icon(Icons.notifications_active,
                        size: 30.0, color: Colors.grey[500]),
                   *//* Icon(Icons.navigate_next,
                        size: 25.0, color: Colors.grey[300]),*//*
                  ],
                ),
              ),
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

  // Launch notification immediately
  Future<void> _launchNotification(PendingNotificationRequest notification) async {
    try {
      // Show the notification immediately
      await NotificationService().showTestDailyDevotional();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notification "${notification.title}" launched successfully'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to launch notification: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // Edit notification
  Future<void> _editNotification(PendingNotificationRequest notification) async {
    final titleController = TextEditingController(text: notification.title ?? '');
    final bodyController = TextEditingController(text: notification.body ?? '');
    
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Notification'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop({
                'title': titleController.text,
                'body': bodyController.text,
              });
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
    
    if (result != null) {
      try {
        // Cancel the old notification
        await NotificationService().cancelNotification(notification.id);
        
        // Create a new one with updated content
        // Note: This is a simplified approach. In a real app, you'd want to
        // reschedule with the same timing but new content
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notification updated successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        
        setState(() {}); // Refresh the list
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update notification: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Cancel notification
  Future<void> _cancelNotification(PendingNotificationRequest notification) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Notification'),
        content: Text('Are you sure you want to cancel the notification "${notification.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
    
    if (confirmed == true) {
      try {
        await NotificationService().cancelNotification(notification.id);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification "${notification.title}" cancelled successfully'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
        
        setState(() {}); // Refresh the list
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to cancel notification: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

}
