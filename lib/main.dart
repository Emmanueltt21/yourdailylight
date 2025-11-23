import 'dart:convert';
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fcm;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:nb_utils/nb_utils.dart' as PlatformUtils;
import 'package:alarm/alarm.dart';

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
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
FlutterLocalNotificationsPlugin();



// Alarm callback for Android
Future<void> alarmCallback() async {
  print("🔔 Alarm triggered at 7 AM - showing notification");
  await _showDailyDevotionalNotification();
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
    enableVibration: false,
    playSound: false,
  );

  /*
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
  );*/

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(dailyDevotionalChannel);

/*
  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(testChannel);

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(testGeneralChannel);
*/

  print("✅ Android notification channels created");
}

// Comprehensive cleanup of all existing notifications and alarms
Future<void> _cleanupAllNotifications() async {
  try {
    print("🧹 Cleaning up all existing notifications and alarms...");
    
    // Cancel all pending notifications (including any with different IDs)
    await notificationsPlugin.cancelAll();
    
    // Stop all alarms
    await Alarm.stopAll();
    
    // Also specifically cancel common notification IDs that might exist
    final commonIds = [0, 1, 9997, 999]; // Include test notification IDs
    for (final id in commonIds) {
      try {
        await notificationsPlugin.cancel(id);
        await Alarm.stop(id);
      } catch (e) {
        // Ignore errors for non-existent notifications/alarms
      }
    }
    
    print("✅ All existing notifications and alarms cleaned up");
  } catch (e) {
    print("⚠️ Error during cleanup (continuing anyway): $e");
  }
}

// Schedule daily notification at exactly 7 AM
Future<void> scheduleDailyNotification() async {
  try {
    print("🔔 Setting up daily notification for 7 AM...");
    
    // Check if notification is already scheduled today
    final prefs = await SharedPreferences.getInstance();
    final lastScheduledDate = prefs.getString('last_scheduled_date');
    final today = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD format
    
    if (lastScheduledDate == today) {
      print("✅ Daily notification already scheduled for today: $today");
      return;
    }
    
    // Comprehensive cleanup of ALL existing notifications and alarms
    await _cleanupAllNotifications();
    
    // Calculate next 7 AM
    final now = DateTime.now();
    DateTime next7AM = DateTime(now.year, now.month, now.day, 7, 0, 0);
    if (now.isAfter(next7AM)) {
      next7AM = next7AM.add(Duration(days: 1));
    }
    
    print("⏰ Next 7 AM: $next7AM");
    
    if (Platform.isAndroid) {
      try {
        await _scheduleWithAlarm(next7AM);
        // Save the scheduled date only if alarm scheduling succeeds
        await prefs.setString('last_scheduled_date', today);
        print("✅ Daily notification scheduled successfully for $today");
      } catch (e) {
        print("❌ Android alarm scheduling failed, notification will not be set: $e");
        // Do not save the scheduled date so it can be retried later
        return;
      }
    } else {
      await _scheduleWithZonedNotification(next7AM);
      // Save the scheduled date to prevent duplicates
      await prefs.setString('last_scheduled_date', today);
      print("✅ Daily notification scheduled successfully for $today");
    }
  } catch (e) {
    print("❌ Daily notification scheduling failed: $e");
  }
}



// Schedule with Alarm package for Android
Future<void> _scheduleWithAlarm(DateTime scheduledTime) async {
  try {
    // Cancel any existing alarms with the same ID
    await Alarm.stop(1);
    
    final alarmSettings = AlarmSettings(
       id: 1,
       dateTime: scheduledTime,
       assetAudioPath: 'assets/raw/alarm.mp3',
       loopAudio: false,
       vibrate: true,
       volumeSettings: VolumeSettings.fade(fadeDuration: Duration(seconds: 3)),
       notificationSettings: const NotificationSettings(
         title: '📖 Your Daily Devotional',
         body: 'Check out God\'s Word for you today! 🔥',
         stopButton: 'Stop',
         icon: 'notification_icon',
       ),
     );
    
    await Alarm.set(alarmSettings: alarmSettings);
    print("✅ Android alarm scheduled for $scheduledTime");
    
    // Set up listener to reschedule for next day when alarm triggers
    Alarm.ringStream.stream.listen((alarmSettings) {
      if (alarmSettings.id == 1) {
        print("🔔 Daily alarm triggered, rescheduling for tomorrow");
        _rescheduleNextDayAlarm();
      }
    });
  } catch (e) {
    print("❌ Failed to schedule Android alarm: $e");
    print("↪️ Falling back to zonedSchedule for daily notifications");
    await _scheduleWithZonedNotification(scheduledTime);
  }
}

// Reschedule alarm for next day (Android)
Future<void> _rescheduleNextDayAlarm() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final today = now.toIso8601String().split('T')[0];
    
    // Clear today's scheduled date so scheduleDailyNotification can run tomorrow
    await prefs.remove('last_scheduled_date');
    
    // Schedule for tomorrow at 7 AM
    final tomorrow = now.add(Duration(days: 1));
    final next7AM = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 7, 0, 0);
    await _scheduleWithAlarm(next7AM);
    
    // Only set the scheduled date after successful scheduling
    await prefs.setString('last_scheduled_date', today);
    
    print("✅ Rescheduled alarm for next day: $next7AM");
  } catch (e) {
    print("❌ Failed to reschedule alarm: $e");
  }
}

// Schedule with zonedSchedule for iOS and fallback
Future<void> _scheduleWithZonedNotification(DateTime scheduledTime) async {
  try {
    // Cancel any existing notifications with the same ID
    await notificationsPlugin.cancel(1);
    
    // Convert to timezone-aware datetime
    final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);
    
    await notificationsPlugin.zonedSchedule(
       1,
       '📖 Your Daily Devotional',
       'Check out God\'s Word for you today! 🔥',
       tzScheduledTime,
       const NotificationDetails(
         android: AndroidNotificationDetails(
           'daily_devotional',
           'Daily Devotional',
           importance: Importance.max,
           priority: Priority.high,
           channelDescription: 'Daily devotional notifications',
         ),
         iOS: DarwinNotificationDetails(
           presentAlert: true,
           presentBadge: true,
           presentSound: false,
         ),
       ),
       payload: NotificationType.dailyDevotional.name,
       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
       matchDateTimeComponents: DateTimeComponents.time, // Repeat daily at same time
     );
    
    print("✅ Zoned notification scheduled for $scheduledTime (repeats daily)");
  } catch (e) {
    print("❌ Failed to schedule zoned notification: $e");
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
Future<void> _firebaseMessagingBackgroundHandler(fcm.RemoteMessage message) async {
  print("Handling a background message: \${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BindingBase.debugZoneErrorsAreFatal = true;

  // Initialize timezone FIRST before anything else
  tz.initializeTimeZones();
  // Set device local timezone for accurate scheduling
  try {
    final dynamic timeZoneName = await FlutterTimezone.getLocalTimezone();
    final String tzNameString = timeZoneName.toString();
    tz.setLocalLocation(tz.getLocation(tzNameString));
    print('✅ Timezone set to ' + tzNameString);
  } catch (e) {
    print('⚠️ Failed to set local timezone, defaulting to UTC: ' + e.toString());
  }

  HttpOverrides.global = MyHttpOverrides();

  // Check if Firebase is already initialized to prevent duplicate app error
  try {
    await Firebase.initializeApp(
      options: Platform.isIOS ? DefaultFirebaseOptions.currentPlatform : null,
    );
  } catch (e) {
    if (e.toString().contains('duplicate-app')) {
      print('Firebase already initialized, skipping...');
    } else {
      rethrow;
    }
  }
  fcm.FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setupFCM();

  // Initialize Alarm for Android
  if (Platform.isAndroid) {
    await Alarm.init();
  }

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
      //  ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => BookmarksModel()),
        ChangeNotifierProvider(create: (_) => PlaylistsModel()),
        ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
       //  ChangeNotifierProvider(create: (_) => DownloadsModel()),
      //  ChangeNotifierProvider(create: (_) => HymnsBookmarksModel()),
      //  ChangeNotifierProvider(create: (_) => NotesProvider()),
      //  ChangeNotifierProvider(create: (_) => BibleModel()),
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
  fcm.FirebaseMessaging messaging = fcm.FirebaseMessaging.instance;

  fcm.NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == fcm.AuthorizationStatus.authorized) {
    print("✅ User granted notification permission.");
    await messaging.subscribeToTopic("all_users");
    print("📩 Subscribed to 'all_users' topic");

    fcm.FirebaseMessaging.onMessage.listen((fcm.RemoteMessage message) {
      print("📨 Foreground message: \${message.messageId}");
      if (message.notification != null) {
        print("🔔 Title: \${message.notification?.title}");
        print("📃 Body: \${message.notification?.body}");
      }
    });

    fcm.FirebaseMessaging.onMessageOpenedApp.listen((fcm.RemoteMessage message) {
      print("📲 Notification clicked.");
    });
  } else {
    print("🚫 User denied notification permission.");
    await messaging.subscribeToTopic("all_users"); // fallback
  }
}
