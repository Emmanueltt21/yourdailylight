import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../providers/DevotionalAlarmService.dart';


class PermissionDialog extends StatefulWidget {
  const PermissionDialog({Key? key}) : super(key: key);

  @override
  State<PermissionDialog> createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionDialog> with WidgetsBindingObserver {
  DateTime? _alarmTime;
  bool _notificationsGranted = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
   //  _loadPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Refresh state after returning from settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
    //  _loadPermissions();
    }
  }

/*
  Future<void> _loadPermissions() async {
    final alarm = await DevotionalAlarmService.getScheduledAlarmTime();
    final notifStatus = await Permission.notification.status;
    setState(() {
      _alarmTime = alarm;
      _notificationsGranted = notifStatus.isGranted;
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    final isAlarmSet = _alarmTime != null;
    final isNotificationsOk = _notificationsGranted;

    return AlertDialog(
      title: const Text('Permissions Status'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔔 Notification
          Row(
            children: [
              Icon(
                isNotificationsOk ? Icons.check_circle : Icons.error,
                color: isNotificationsOk ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(isNotificationsOk
                    ? '✅ Notifications are enabled.'
                    : '🚫 Notifications are disabled.'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ⏰ Alarm
          Row(
            children: [
              Icon(
                isAlarmSet ? Icons.check_circle : Icons.warning_amber,
                color: isAlarmSet ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: isAlarmSet
                    ? Text('✅ Alarm is set for '
                    '${_alarmTime!.hour.toString().padLeft(2, '0')}:'
                    '${_alarmTime!.minute.toString().padLeft(2, '0')}')
                    : const Text('⏰ Alarm is not set.'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 🔘 Buttons
          if (!isNotificationsOk)
            ElevatedButton(
              onPressed: () async {
                await openAppSettings();
              },
              child: const Text('Open Notification Settings'),
            ),

          if (!isAlarmSet)
            ElevatedButton(
              onPressed: () async {
              //  await DevotionalAlarmService.openAlarmPermissionSettings();
              },
              child: const Text('Open Alarm Permission Settings'),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
