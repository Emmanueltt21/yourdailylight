import 'dart:convert';
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:nb_utils/nb_utils.dart' as PlatformUtils;

import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
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
import 'StartupPermissionGate.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin notificationsPlugin =
FlutterLocalNotificationsPlugin();



// Workmanager callback
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    _showDailyDevotionalNotification();
    return Future.value(true);
  });
}

// Notification types
enum NotificationType {
  dailyDevotional,
  firebaseMessage,
}

// Initialize notifications
Future<void> initNotifications() async {
  // Don't initialize timezone here - it should be done in main()

  const AndroidInitializationSettings androidSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  await notificationsPlugin.initialize(
    InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    ),
    onDidReceiveNotificationResponse: (response) {
      print("✅ RECEIVED NOTIFICATION PAYLOAD: ${response.payload}");
      if (response.payload != null) {
        _handleNotificationTap(response.payload!);
      }
    },
  );

  // Create Android notification channels
  if (Platform.isAndroid) {
    await _createNotificationChannels();
  }
}

// Create notification channels for Android
Future<void> _createNotificationChannels() async {
  const AndroidNotificationChannel dailyDevotionalChannel = AndroidNotificationChannel(
    'daily_devotional',
    'Daily Devotional',
    description: 'Daily devotional notifications',
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
  );

  const AndroidNotificationChannel testChannel = AndroidNotificationChannel(
    'daily_devotional_test',
    'Daily Devotional Test',
    description: 'Test notifications for daily devotional',
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
  );

  const AndroidNotificationChannel testGeneralChannel = AndroidNotificationChannel(
    'test_channel',
    'Test Notifications',
    description: 'Channel for testing notifications',
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
  );

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(dailyDevotionalChannel);

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(testChannel);

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(testGeneralChannel);

  print("✅ Android notification channels created");
}

// Schedule daily notification using Workmanager only
Future<void> scheduleDailyNotification() async {
  try {
    print("🔔 Setting up daily notification with Workmanager...");
    
    // Calculate delay until next 7 AM
    final now = DateTime.now();
    DateTime next7AM = DateTime(now.year, now.month, now.day, 7, 0, 0);
    if (now.isAfter(next7AM)) {
      next7AM = next7AM.add(Duration(days: 1));
    }
    
    final delayUntilNext7AM = next7AM.difference(now);
    print("⏰ Next 7 AM: $next7AM (in ${delayUntilNext7AM.inHours}h ${delayUntilNext7AM.inMinutes % 60}m)");
    
    // Setup Workmanager with calculated delay
    await _setupWorkmanagerBackup(initialDelay: delayUntilNext7AM);
    
    print("✅ Daily notification scheduled successfully with Workmanager");
  } catch (e) {
    print("❌ Daily notification scheduling failed: $e");
    // Fallback with default 1-minute delay
    await _setupWorkmanagerBackup();
  }
}



// Setup Workmanager backup
Future<void> _setupWorkmanagerBackup({Duration? initialDelay}) async {
  try {
    // Cancel any existing backup task before registering a new one
    await Workmanager().cancelByUniqueName("daily_devotional_backup");
    await Workmanager().registerPeriodicTask(
      "daily_devotional_backup",
      "show_daily_devotional",
      frequency: const Duration(hours: 24),
      initialDelay: initialDelay ?? const Duration(minutes: 1),
      constraints: Constraints(
        networkType: NetworkType.notRequired,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
    print("✅ Workmanager backup scheduled");
  } catch (e) {
    print("❌ Failed to setup Workmanager backup: $e");
  }
}

// Show daily notification
Future<void> _showDailyDevotionalNotification() async {
  await notificationsPlugin.show(
    0,
    '📖 Your Daily Devotional',
    'Check out God\'s Word for you today! 🔥',
  const NotificationDetails(
    android: AndroidNotificationDetails(
    'daily_devotional',
    'Daily Devotional',
    importance: Importance.max,
    priority: Priority.high,
    channelDescription: 'Daily devotional notifications',
  ),
  iOS: DarwinNotificationDetails(),
  ),
  payload: NotificationType.dailyDevotional.name,
  );
}

// Simplified notification permission handling
Future<void> requestAllNotificationPermissions() async {
  try {
    await Permission.notification.request();
    print('✅ Notification permission requested');
  } catch (e) {
    print('❌ Error requesting notification permission: $e');
  }
}

// Check notification permission status
Future<bool> getNotificationPermissionsStatus() async {
  try {
    return await Permission.notification.isGranted;
  } catch (e) {
    print('❌ Error checking notification permission: $e');
    return false;
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");

// Handle notification taps
void _handleNotificationTap(String payload) {
  print("🔔 _handleNotificationTap Route ----------->> $payload");
  debugPrint("[DEBUG] _handleNotificationTap called with payload: $payload");
  NotificationType type;
  try {
    // Try to parse as JSON (for Firebase notifications)
    final dynamic decoded = json.decode(payload);
    if (decoded is Map && decoded.containsKey('type')) {
      final String? notifType = decoded['type'] as String?;
      type = NotificationType.values.firstWhere(
        (e) => e.name == notifType,
        orElse: () => NotificationType.firebaseMessage,
      );
    } else {
      // Fallback to enum name matching
      type = NotificationType.values.firstWhere(
        (e) => e.name == payload,
        orElse: () => NotificationType.firebaseMessage,
      );
    }
  } catch (e) {
    // Not JSON, fallback to enum name matching
    type = NotificationType.values.firstWhere(
      (e) => e.name == payload,
      orElse: () => NotificationType.firebaseMessage,
    );
  }
  print("✅ RECEIVED NOTIFICATION payload: $payload, type: $type");
  print("🧭 Navigator state: ${navigatorKey.currentState}");
  
  if (type == NotificationType.dailyDevotional) {
    print("📖 Navigating to devotional tab (index 1)");
    navigatorKey.currentState?.pushNamed(MyMainHomePage.routeName, arguments: 1);
  } else {
    print("🏠 Navigating to home tab (index 0)");
    navigatorKey.currentState?.pushNamed(MyMainHomePage.routeName, arguments: 0);
  }
  print("🚀 Navigation command sent");
}


/// ✅ Handle background FCM
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: \${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BindingBase.debugZoneErrorsAreFatal = true;

  // Initialize timezone FIRST before anything else
  tz.initializeTimeZones();

  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp(
    options: Platform.isIOS ? DefaultFirebaseOptions.currentPlatform : null,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setupFCM();

  // Initialize Workmanager
  Workmanager().initialize(callbackDispatcher);

  // Initialize notifications
  await initNotifications();

  // Initialize JustAudioBackground AFTER notifications
  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.lighthouse.yourdailylight',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationOngoing: true,
    );
  } catch (e) {
    print('❌ JustAudioBackground initialization failed: $e');
    // Continue without audio background service if it fails
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.primaryDark,
    statusBarBrightness: Brightness.light,
  ));

  final prefs = await SharedPreferences.getInstance();
  final seen = prefs.getBool("user_seen_onboarding_page") ?? false;

  // Simplified permission check - don't check permissions during startup
  Widget firstScreen = StartupPermissionGate();
  if (PlatformUtils.isAndroid) {
    firstScreen = seen ? MyMainHomePage() : OnboardingPage();
  } else {
    firstScreen = seen ? MyMainHomePage() : OnboardingPage();
  }

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
      child: MyApp(defaultHome: firstScreen, navKey: navigatorKey),
    ),
  );

  // ✅ DEFER permissions and scheduling AFTER runApp with delay
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    // Add delay to ensure UI is fully loaded
    await Future.delayed(Duration(seconds: 2));
    await _requestPermissions();
    // Schedule notifications after permissions are handled
    await scheduleDailyNotification();
  });
}

// Simplified permission handling
Future<void> _requestPermissions() async {
  await requestAllNotificationPermissions();
  
  // Log permission status for debugging
  final status = await getNotificationPermissionsStatus();
  print("📱 Notification permission granted: $status");
}

/*

/// ✅ Handle background FCM
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: \${message.messageId}");
}
*/



void mainOLD() async {
  WidgetsFlutterBinding.ensureInitialized();
  BindingBase.debugZoneErrorsAreFatal = true;


  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp(
    options: Platform.isIOS ? DefaultFirebaseOptions.currentPlatform : null,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setupFCM();

  Workmanager().initialize(callbackDispatcher);
  scheduleDailyNotification();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.lighthouse.yourdailylight',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
  );

  await initNotifications();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.primaryDark,
    statusBarBrightness: Brightness.light,
  ));

  final prefs = await SharedPreferences.getInstance();
  final seen = prefs.getBool("user_seen_onboarding_page") ?? false;
  final notificationStatus = await Permission.notification.status;

  Widget firstScreen = StartupPermissionGate();
  if (PlatformUtils.isAndroid) {
    firstScreen = !notificationStatus.isGranted
        ? StartupPermissionGate()
        : (seen ? MyMainHomePage() : OnboardingPage());
  } else {
    firstScreen = seen ? MyMainHomePage() : OnboardingPage();
  }

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
      child: MyApp(defaultHome: firstScreen, navKey: navigatorKey),
    ),
  );

  // ✅ DEFER permissions AFTER runApp
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _requestPermissions();
  });
}


/*// Permission handling
Future<void> _requestPermissions() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 31) {
      await Permission.scheduleExactAlarm.request();
    }
    if (androidInfo.version.sdkInt >= 33) {
      await Permission.notification.request();
    }
  }
}*/



/// 🔒 Allow invalid SSL (for dev API)
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

/// 🔔 Firebase Cloud Messaging setup
Future<void> setupFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("✅ User granted notification permission.");
    await messaging.subscribeToTopic("all_users");
    print("📩 Subscribed to 'all_users' topic");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📨 Foreground message: \${message.messageId}");
      if (message.notification != null) {
        print("🔔 Title: \${message.notification?.title}");
        print("📃 Body: \${message.notification?.body}");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 Notification clicked.");
    });
  } else {
    print("🚫 User denied notification permission.");
    await messaging.subscribeToTopic("all_users"); // fallback
  }
}
