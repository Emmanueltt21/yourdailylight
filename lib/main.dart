import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourdailylight/providers/translate_provider.dart';
import 'package:yourdailylight/service/notification_service.dart';
import 'package:yourdailylight/utils/my_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yourdailylight/firebase_options.dart';
import 'package:yourdailylight/screens/thechurch/my_main_home_page.dart';
import 'package:yourdailylight/screens/OnboardingPage.dart';
import 'package:yourdailylight/MyApp.dart';
import 'package:yourdailylight/providers/AppStateManager.dart';
import 'package:yourdailylight/providers/NotificationProvider.dart';
import 'package:yourdailylight/providers/BibleModel.dart';
import 'package:yourdailylight/providers/BookmarksModel.dart';
import 'package:yourdailylight/providers/PlaylistsModel.dart';
import 'package:yourdailylight/providers/AudioPlayerModel.dart';
import 'package:yourdailylight/providers/HymnsBookmarksModel.dart';
import 'package:yourdailylight/providers/DownloadsModel.dart';
import 'package:yourdailylight/providers/NotesProvider.dart';
import 'package:yourdailylight/providers/ChatManager.dart';
import 'package:yourdailylight/providers/cart_provider.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<bool> areExactAlarmsPermitted() async {
  try {
    final result = await MethodChannel('com.lighthouse.yourdailylight/exact_alarms').invokeMethod('areExactAlarmsPermitted');
    return result ?? false;
  } catch (e) {
    print("Error checking exact alarms permission: $e");
    return false;
  }
}

Future<void> main() async {
  // Ensure bindings are initialized first
  WidgetsFlutterBinding.ensureInitialized();

  // Set debug zone errors to fatal for easier debugging
  BindingBase.debugZoneErrorsAreFatal = true;

  // Initialize dependencies
  HttpOverrides.global = MyHttpOverrides();

  // Initialize Firebase
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }

  // Initialize notifications
  await NotificationService.initialize();

  // Check exact alarms permission before scheduling
  bool isPermitted = await areExactAlarmsPermitted();
  if (isPermitted) {
    try {
      await NotificationService.scheduleDailyNotification();
    } catch (e) {
      print("Failed to schedule daily notification: $e");
    }
  } else {
    print("Exact alarms not permitted. Skipping notification scheduling.");
  }

  // Set up Firebase Cloud Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await setupFCM();

  // Initialize Just Audio Background
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.lighthouse.yourdailylight',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
  );

  // Set preferred orientations and system UI
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.primaryDark,
    statusBarBrightness: Brightness.light,
  ));

  // Determine the first screen
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget firstScreen = prefs.getBool("user_seen_onboarding_page") == true
      ? MyMainHomePage()
      : OnboardingPage();

  // Run the app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateManager()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => BookmarksModel()),
        ChangeNotifierProvider(create: (_) => PlaylistsModel()),
        ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
        ChangeNotifierProvider(create: (_) => DownloadsModel()),
        ChangeNotifierProvider(create: (_) => HymnsBookmarksModel()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => BibleModel()),
        ChangeNotifierProvider(create: (_) => TranslateProvider()),
        ChangeNotifierProvider(create: (_) => ChatManager()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(defaultHome: firstScreen),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        final isValidHost = [ApiUrl.BASEURL_ADD].contains(host);
        return isValidHost;
      };
  }
}

Future<void> setupFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("User granted permission for notifications");
    await messaging.subscribeToTopic("all_users");
    print("Subscribed to 'all_users' topic");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a foreground message: ${message.messageId}");
      if (message.notification != null) {
        print("Notification Title: ${message.notification?.title}");
        print("Notification Body: ${message.notification?.body}");
      }
      if (message.data.containsKey('body')) {
        String fullBody = message.data['body'];
        print("Full Notification Body: $fullBody");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification clicked!");
    });
  } else {
    print("User denied permission for notifications");
    await messaging.subscribeToTopic('all_users');
  }
}