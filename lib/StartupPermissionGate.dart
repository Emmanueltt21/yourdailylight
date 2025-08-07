import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourdailylight/screens/OnboardingPage.dart';
import 'package:yourdailylight/screens/thechurch/my_main_home_page.dart';
import 'package:yourdailylight/service/notification_service.dart';
import 'package:yourdailylight/utils/my_colors.dart';
import 'package:nb_utils/nb_utils.dart';

class StartupPermissionGate extends StatefulWidget {
  const StartupPermissionGate({super.key});

  @override
  State<StartupPermissionGate> createState() => _StartupPermissionGateState();
}

class _StartupPermissionGateState extends State<StartupPermissionGate> {
  bool _checking = true;
  bool _notificationGranted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPermissionWatcher();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startPermissionWatcher() async {
    print("_startPermissionWatcher ------------->>");
    await checkPermissions();

    _timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      await checkPermissions();

      if (_notificationGranted) {
        _timer?.cancel();

      //  await NotificationService.scheduleDailyNotification();

        final prefs = await SharedPreferences.getInstance();
        final seen = prefs.getBool("user_seen_onboarding_page") ?? false;

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => seen ? MyMainHomePage() : OnboardingPage(),
        ));
      }
    });
  }



  Future<void> checkPermissions() async {
    final notificationStatus = await Permission.notification.status;
    setState(() {
      _notificationGranted = notificationStatus.isGranted;
      _checking = false;
    });
  }

  Future<void> requestNotificationPermission() async {
    await Permission.notification.request();
    checkPermissions();
  }

  Widget _buildPermissionRow({
    required String label,
    required bool granted,
    required VoidCallback onAction,
  }) {
    return Row(
      children: [
        Icon(
          granted ? Icons.check_circle : Icons.cancel,
          color: granted ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: primaryTextStyle())),
        if (!granted)
          TextButton(
            onPressed: onAction,
            child: const Text("Enable"),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return Scaffold(
        backgroundColor: MyColors.primaryDark,
        body: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: MyColors.primaryDark,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications_active, size: 48, color: MyColors.primaryDark),
                  const SizedBox(height: 20),
                  Text('Permissions Required', style: boldTextStyle(size: 20)),
                  const SizedBox(height: 10),
                  Text(
                    'We need notification permission to send daily devotional alerts.',
                    style: secondaryTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  _buildPermissionRow(
                    label: "Notification Permission",
                    granted: _notificationGranted,
                    onAction: requestNotificationPermission,
                  ),
                  const SizedBox(height: 10),
                  if (!_notificationGranted)
                    Column(
                      children: [
                        Text(
                          "Please enable notifications to proceed.",
                          style: secondaryTextStyle(size: 12),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final seen = prefs.getBool("user_seen_onboarding_page") ?? false;

                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (_) => seen ? MyMainHomePage() : OnboardingPage(),
                            ));
                          },
                          child: const Text("Skip", style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
