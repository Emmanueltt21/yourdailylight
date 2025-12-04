import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:alarm/alarm.dart';

typedef NotificationTapHandler = void Function(String payload);

class NotificationManager {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init({NotificationTapHandler? onTap}) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await notificationsPlugin.initialize(
      InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload != null && onTap != null) {
          onTap(payload);
        }
      },
    );

    if (Platform.isAndroid) {
      await _ensureSilentAndroidChannels();
    }
  }

  Future<void> _ensureSilentAndroidChannels() async {
    final androidPlugin = notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    // Attempt to delete previously-created noisy channels if they exist
    try {
      await androidPlugin?.deleteNotificationChannel('daily_devotional');
    } catch (_) {}
    try {
      await androidPlugin?.deleteNotificationChannel('churchapp');
    } catch (_) {}

    const AndroidNotificationChannel dailyDevotionalSilent = AndroidNotificationChannel(
      'daily_devotional_silent',
      'Daily Devotional (Silent)',
      description: 'Daily devotional notifications without sound or vibration',
      importance: Importance.max,
      enableVibration: false,
      playSound: false,
    );

    const AndroidNotificationChannel churchappSilent = AndroidNotificationChannel(
      'churchapp_silent',
      'App Notifications (Silent)',
      description: 'General app notifications without sound or vibration',
      importance: Importance.max,
      enableVibration: false,
      playSound: false,
    );

    await androidPlugin?.createNotificationChannel(dailyDevotionalSilent);
    await androidPlugin?.createNotificationChannel(churchappSilent);
  }

  Future<void> requestAllNotificationPermissions() async {
    try {
      await Permission.notification.request();
    } catch (_) {}
  }

  Future<bool> getNotificationPermissionsStatus() async {
    try {
      return await Permission.notification.isGranted;
    } catch (_) {
      return false;
    }
  }

  Future<void> cleanupAll() async {
    try {
      await notificationsPlugin.cancelAll();
      try {
        // Initialize and stop alarms to ensure no lingering vibrations
        await Alarm.init();
        await Alarm.stopAll();
      } catch (_) {}
    } catch (_) {}
  }

  Future<void> scheduleDaily7AMSilent({String payload = 'dailyDevotional'}) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final lastScheduledDate = prefs.getString('last_scheduled_date');
    if (lastScheduledDate == today) {
      return;
    }

    await cleanupAll();

    final now = DateTime.now();
    DateTime next7AM = DateTime(now.year, now.month, now.day, 7, 0, 0);
    if (now.isAfter(next7AM)) {
      next7AM = next7AM.add(Duration(days: 1));
    }

    final tzScheduledTime = tz.TZDateTime.from(next7AM, tz.local);

    await notificationsPlugin.zonedSchedule(
      1,
      '📖 Your Daily Devotional',
      'Check out God\'s Word for you today! 🔥',
      tzScheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_devotional_silent',
          'Daily Devotional (Silent)',
          importance: Importance.max,
          priority: Priority.high,
          channelDescription: 'Daily devotional notifications without sound or vibration',
          playSound: false,
          enableVibration: false,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: false,
        ),
      ),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await prefs.setString('last_scheduled_date', today);
  }

  Future<void> showDailyDevotionalSilent({String payload = 'dailyDevotional'}) async {
    await notificationsPlugin.show(
      0,
      '📖 Your Daily Devotional',
      'Check out God\'s Word for you today! 🔥',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_devotional_silent',
          'Daily Devotional (Silent)',
          importance: Importance.max,
          priority: Priority.high,
          channelDescription: 'Daily devotional notifications without sound or vibration',
          playSound: false,
          enableVibration: false,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: false,
        ),
      ),
      payload: payload,
    );
  }
}

// Export a shared instance for easy access across the app
final NotificationManager notificationManager = NotificationManager();