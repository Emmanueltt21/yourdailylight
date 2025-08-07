import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../main.dart';
import '../screens/thechurch/my_main_home_page.dart';
import 'Firebase.dart';


class NotificationService {


  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    return await notificationsPlugin.pendingNotificationRequests();
  }

  Future<void> cancelTestNotifications() async {
    await notificationsPlugin.cancel(9997);
  }

  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  Future<void> showTestDailyDevotional() async {
    await notificationsPlugin.show(
      9997, // Use unique ID for test notifications
      '📖 Test Daily Devotional',
      'This is a test of your daily devotional notification',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_devotional_test',
          'Daily Devotional',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: NotificationType.dailyDevotional.name,
    );
  }


}
