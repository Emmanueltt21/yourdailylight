import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'NotificationManager.dart';
import '../screens/thechurch/my_main_home_page.dart';
import 'Firebase.dart';


class NotificationService {


  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    return await notificationManager.notificationsPlugin.pendingNotificationRequests();
  }

  Future<void> cancelTestNotifications() async {
    await notificationManager.notificationsPlugin.cancel(id: 9997);
  }

  Future<void> cancelNotification(int id) async {
    await notificationManager.notificationsPlugin.cancel(id: id);
  }

  Future<void> showTestDailyDevotional() async {
    await notificationManager.notificationsPlugin.show(
      id: 9997,
      title: '📖 Test Daily Devotional',
      body: 'This is a test of your daily devotional notification',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_devotional_silent',
          'Daily Devotional (Silent)',
          importance: Importance.max,
          priority: Priority.high,
          playSound: false,
          enableVibration: false,
        ),
        iOS: DarwinNotificationDetails(
          presentSound: false,
        ),
      ),
      payload: 'dailyDevotional',
    );
  }


}
