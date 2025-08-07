import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

// Test script to verify notification tap handling
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize notifications
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  
  await notificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print('✅ TEST: Notification tapped with payload: ${response.payload}');
      print('✅ TEST: This should navigate to DevotionHome (index 1)');
    },
  );
  
  // Create notification channel
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'daily_devotional_test',
    'Daily Devotional Test',
    description: 'Test channel for daily devotional notifications',
    importance: Importance.max,
  );
  
  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  
  // Show test notification
  await notificationsPlugin.show(
    9999,
    '📖 Test Daily Devotional',
    'Tap this notification to test navigation',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_devotional_test',
        'Daily Devotional Test',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
    payload: 'dailyDevotional', // This should match NotificationType.dailyDevotional.name
  );
  
  print('✅ TEST: Test notification sent. Please tap it to verify navigation.');
}