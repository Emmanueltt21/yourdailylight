import 'dart:convert';
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fcm;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:yourdailylight/service/NotificationManager.dart';

// Using NotificationManager; no direct FlutterLocalNotificationsPlugin here




// Notification types
enum NotificationType {
  dailyDevotional,
  firebaseMessage,
}

// Initialize notifications
// initNotifications removed; NotificationManager handles initialization

// Create notification channels for Android
// _createNotificationChannels removed; NotificationManager creates silent channels

// Comprehensive cleanup of all existing notifications and alarms
// _cleanupAllNotifications removed; NotificationManager.cleanupAll handles this

// Schedule daily notification at exactly 7 AM
Future<void> scheduleDailyNotification() async {
  // Delegate scheduling to NotificationManager
  await notificationManager.cleanupAll();
  await notificationManager.scheduleDaily7AMSilent();
}




// Schedule with zonedSchedule for iOS and fallback
// Removed: _scheduleWithZonedNotification; use NotificationManager

// Show daily notification
// Removed: _showDailyDevotionalNotification; use NotificationManager

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

  // Alarm package removed; using only flutter_local_notifications

  // Initialize notifications via NotificationManager (creates silent channels and hooks tap)
  await notificationManager.init(onTap: (payload) => _handleNotificationTap(payload));

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
    await notificationManager.requestAllNotificationPermissions();
    // Schedule notifications after permissions are handled
    await notificationManager.scheduleDaily7AMSilent(payload: NotificationType.dailyDevotional.name);
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
    sound: false,
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
