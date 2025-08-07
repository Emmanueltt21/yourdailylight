import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class DevotionalAlarmService {
  static const int alarmId = 1;
/*
  /// Initialize Alarm + Notification
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Alarm.init();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    debugPrint("✅ Alarm and Notifications initialized.");
  }

  /// Schedule daily devotional reminder
  static Future<void> scheduleDailyReminder({int hour = 7, int minute = 0}) async {
    final now = DateTime.now();
    DateTime scheduledTime = DateTime(now.year, now.month, now.day, hour, minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: alarmId,
      dateTime: scheduledTime,
      assetAudioPath: 'assets/raw/alarm.mp3',
      loopAudio: false,
      vibrate: true,
      warningNotificationOnKill: true,
      androidFullScreenIntent: false,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 5),
        volumeEnforced: true,
      ),
      notificationSettings: const NotificationSettings(
        title: '📖 Your Daily Devotional',
        body: 'Check out God’s Word for you today! 🔥',
        stopButton: 'Stop the alarm',
        icon: 'notification_icon',
        iconColor: Color(0xff862778),
      ),
    );

    await Alarm.set(alarmSettings: alarmSettings);
    debugPrint("✅ Alarm scheduled for ${scheduledTime.hour}:${scheduledTime.minute}");
  }

  /// Cancel the reminder
  static Future<void> cancelDailyReminder() async {
    await Alarm.stop(alarmId);
    debugPrint("🛑 Alarm cancelled.");
  }

  /// Get scheduled alarm time if exists
  static Future<DateTime?> getScheduledAlarmTime() async {
    final alarms = await Alarm.getAlarms();
    AlarmSettings? alarm;
    try {
      alarm = alarms.firstWhere((a) => a.id == alarmId);
    } catch (e) {
      alarm = null;
    }
    return alarm?.dateTime;
  }

*//*  static Future<DateTime?> getScheduledAlarmTime() async {
    final alarms = await Alarm.getAlarms();
    final alarm = alarms.firstWhereOrNull((a) => a.id == alarmId);
    return alarm?.dateTime;
  }*//*

  /// Open Alarm Permission Settings on Android 12+
  static Future<void> openAlarmPermissionSettings() async {
    if (Platform.isAndroid) {
      const intent = AndroidIntent(
        action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
      );
      await intent.launch();
    }
  }*/
}
