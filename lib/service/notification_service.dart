import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'Firebase.dart';


class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    // 1️⃣ Initialize Timezones
    try {
      tz.initializeTimeZones();
      final String timeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZone));
      print("🌍 Timezone initialized: $timeZone");
    } catch (e) {
      print("❌ Timezone error: $e - Falling back to UTC");
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    // 2️⃣ Initialize Notifications
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );


    //scheduleDailyNotification();
    //scheduleTestNotification();

    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        print("📩 Notification tapped: ${response.payload}");
      },
    );


    // ✅ Create notification channel (Important!)
    const AndroidNotificationChannel dailyReminderChannel = AndroidNotificationChannel(
      'daily_reminder', // Channel ID
      //'daily_reminder', // Channel ID
      'Your Daily Light Notifications', // Channel name
      description: 'Your Daily Light Channel notifications',
      importance: Importance.high,
      playSound: true,
    );

    final AndroidNotificationChannel fcmChannel = AndroidNotificationChannel(
      'all_users_test',
      'FCM Notifications',
      description: 'Push notifications from backoffice admin',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(dailyReminderChannel);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(fcmChannel);

    _initialized = true;
  }

  // 3️⃣ Request Permission
  static Future<bool> _hasPermission() async {
    if (Platform.isAndroid) {
      final androidPlugin =
      _notificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      final result = await androidPlugin?.requestNotificationsPermission();
      return result ?? false;
    }
    return true; // iOS automatically grants permission
  }

  // 4️⃣ Create Notification Channel
  static Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //  'daily_reminder',
      'daily_reminder',
      'Daily Reminders',
      description: 'Channel for scheduled notifications',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    try {
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      print("🔔 Channel created: ${channel.id}");
    } catch (e) {
      print("❌ Channel error: $e");
    }
  }

  // 5️⃣ Schedule Daily Notification at a Fixed Time
  static Future<void> scheduleDailyNotificationOLD() async {
    await initialize();

    bool granted = await _hasPermission();
    if (!granted) {
      print("🚨 Notification permission denied!");
      return;
    }

    await createNotificationChannel();

    final tz.TZDateTime scheduledTime = _nextInstanceOfTime(7, 0); // 7:00 AM

    await _notificationsPlugin.zonedSchedule(
      0,
      '📖 Your Daily Devotional',
      'Check out God’s Word for you today!🔥',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
       //   'daily_reminder',
          'Daily Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          sound: 'default',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
     // uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'daily_reminder',
    );

    print("✅ Notification scheduled for 9:00 PM daily!");
  }

  static Future<void> scheduleDailyNotification() async {
    await initialize();

    bool granted = await _hasPermission();
    if (!granted) {
      print("🚨 Notification permission denied!");
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    bool _isNotificationEnabled = prefs.getBool('notifications_enabled') ?? true;

    if (!_isNotificationEnabled) {
      print("🚨 Notification permission denied!");
      return;
    }
    await createNotificationChannel();

    // Set scheduled time to 1:00 PM daily, considering timezone
    final tz.TZDateTime scheduledTime = _nextInstanceOfTime(7, 0); // 7:00 AM

    await _notificationsPlugin.zonedSchedule(
      0,
      '📖 Your Daily Devotional',
      'Check out God’s Word for you today!🔥',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
        //  'daily_reminder',
          'daily_reminder',
          'Daily Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          sound: 'default',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      //uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
     // payload: 'daily_reminder',
      payload: 'daily_reminder',
    );

    print("✅ Daily notification scheduled for 1:00 PM!");
  }

  // 6️⃣ Schedule a Test Notification (30 sec delay)
  static Future<void> scheduleTestNotification() async {
    try {
      await _notificationsPlugin.periodicallyShow(
        999,
        '📖 Your Daily Devotional',
        'Check out God’s Word for you today!🔥',
       // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30)),
        RepeatInterval.everyMinute, // Minimum is 1 minute for periodic
        const NotificationDetails(
          android: AndroidNotificationDetails(
           // 'daily_reminder',
            'daily_reminder',
            'Daily Reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            sound: 'default',
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        //uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      //  matchDateTimeComponents: DateTimeComponents.time,
        payload: 'test_payload',
      );

      print("⏰ Test notification scheduled in 30 seconds.");
    } catch (e) {
      print("❌ Test Notification Error: $e");
    }
  }

  // 7️⃣ Cancel All Notifications
  static Future<void> cancelNotifications() async {
    await _notificationsPlugin.cancelAll();
    print("🗑️ All notifications canceled.");
  }

  // 8️⃣ Get Pending Notifications
  static Future<List<PendingNotificationRequest>> getPendingNotifications() {
    return _notificationsPlugin.pendingNotificationRequests();
  }

  // Helper: Get Next Instance of Time (Daily)
  static tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
