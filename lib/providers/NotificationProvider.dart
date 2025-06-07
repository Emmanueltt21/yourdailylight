import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/notification_service.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isNotificationEnabled = true;

  bool get isNotificationEnabled => _isNotificationEnabled;

  NotificationProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isNotificationEnabled = prefs.getBool('notifications_enabled') ?? true;
    notifyListeners();
  }

  Future<void> toggleNotifications(bool value) async {
    _isNotificationEnabled = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);

    if (value) {
      await NotificationService.scheduleDailyNotification();
    } else {
      await NotificationService.cancelNotifications();
    }
  }
}