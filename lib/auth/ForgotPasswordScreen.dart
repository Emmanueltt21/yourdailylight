import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import '../utils/Alerts.dart';
import '../utils/TextStyles.dart';
import 'dart:async';
import '../utils/my_colors.dart';
import 'package:email_validator/email_validator.dart';
import '../i18n/strings.g.dart';
import '../service/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/forgotpassword";
  ForgotPasswordScreen();

  @override
  ForgotPasswordScreenRouteState createState() =>
      new ForgotPasswordScreenRouteState();
}

class ForgotPasswordScreenRouteState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  verifyFormAndSubmit() {
    String _email = emailController.text.trim();

    if (_email == "") {
      Alerts.show(context, t.error, t.emptyfielderrorhint);
    } else if (EmailValidator.validate(_email) == false) {
      Alerts.show(context, t.error, t.invalidemailerrorhint);
    } else {
      registerUser(_email);
    }
  }

  Future<void> registerUser(String email) async {
    print("Sending Firebase password reset email to: $email");

    Alerts.showProgressDialog(context, t.processingpleasewait);

    try {
      final AuthService authService = AuthService();
      await authService.sendPasswordResetEmail(email);

      Navigator.of(context).pop(); // Close progress dialog
      Alerts.show(
        context,
        t.success,
        "Password reset email sent successfully! Please check your inbox and spam folder.",
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close progress dialog

      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found with this email address.";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address format.";
          break;
        case 'too-many-requests':
          errorMessage = "Too many requests. Please try again later.";
          break;
        case 'network-request-failed':
          errorMessage = "Network error. Please check your internet connection.";
          break;
        default:
          errorMessage = e.message ?? "Password reset failed.";
      }
      Alerts.show(context, t.error, errorMessage);
    } catch (e) {
      Navigator.of(context).pop(); // Close progress dialog

      print("Unexpected error: $e");
      Alerts.show(context, t.error, "An unexpected error occurred. Please try again.");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
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
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 38,
                      color: MyColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  t.appname,
                  textAlign: TextAlign.center,
                  style: TextStyles.title(context).copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t.enteremailaddresstoresetpassword,
                  textAlign: TextAlign.center,
                  style: TextStyles.subhead(context).copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 36),
                Text(
                  t.emailaddress,
                  style: TextStyles.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "example@domain.com",
                    prefixIcon: Icon(Icons.email_outlined, color: MyColors.primary),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    filled: true,
                    fillColor: isDark ? Colors.grey[900] : Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: MyColors.primary, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
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
                      verifyFormAndSubmit();
                    },
                    child: Text(
                      t.resetpassword,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      t.backtologin,
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
