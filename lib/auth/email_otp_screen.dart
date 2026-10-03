import 'package:flutter/material.dart';

import '../i18n/strings.g.dart';
import '../service/AuthService.dart';
import '../utils/Alerts.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';

class EmailOtpScreen extends StatefulWidget {
  final String email, password;
  const EmailOtpScreen({super.key, required this.email, required this.password});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    iniComponent();
    super.initState();
  }

  void iniComponent() async {
    print("Email Sent -------------->>");
    String? message = await _authService.signUp(
      widget.email,
      widget.password,
    );

    Alerts.show(context, t.success, message ?? 'Signup failed');
  }

  Future<void> checkEmailVerification(BuildContext cnxt) async {
    bool isVerified = await AuthService().isEmailVerified();
    if (isVerified) {
      print('Email is verified.');
      Alerts.showSuccessRegAlertDialog(cnxt);
    } else {
      print('Email not verified.');
      Alerts.show(context, "Pending Verification", "Email not verified \n Check your Mail box and click on the link to get verify");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mark_email_read_outlined,
                      size: 42,
                      color: MyColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Email Verification Sent",
                  textAlign: TextAlign.center,
                  style: TextStyles.title(context).copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Open your mailbox and click on the link sent to ${widget.email} to verify your account.",
                  textAlign: TextAlign.center,
                  style: TextStyles.subhead(context).copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 36),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      checkEmailVerification(context);
                    },
                    child: const Text(
                      "Check Verification",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      _authService.resendVerificationEmail();
                    },
                    child: Text(
                      "Resend Verification Link",
                      style: TextStyle(
                        color: MyColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
