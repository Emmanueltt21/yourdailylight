import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import '../utils/Alerts.dart';
import '../utils/TextStyles.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import '../utils/my_colors.dart';
import '../utils/ApiUrl.dart';
import 'package:dio/dio.dart';
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
      
      Alerts.show(context, t.success, 
        "Password reset email sent successfully! Please check your inbox and follow the instructions to reset your password.");
      
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close progress dialog
      
      String errorMessage;
      
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found with this email address. Please check your email or create a new account.";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address format. Please enter a valid email.";
          break;
        case 'too-many-requests':
          errorMessage = "Too many password reset requests. Please wait a moment before trying again.";
          break;
        case 'network-request-failed':
          errorMessage = "Network error. Please check your internet connection and try again.";
          break;
        default:
          errorMessage = e.message ?? "An error occurred while sending the password reset email.";
      }
      
      print("Firebase Auth error: ${e.code} - ${e.message}");
      Alerts.show(context, t.error, errorMessage);
      
    } catch (e) {
      Navigator.of(context).pop(); // Close progress dialog
      
      print("Unexpected error: $e");
      Alerts.show(context, t.error, "An unexpected error occurred. Please try again.");
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar:
          PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 85),
            Container(height: 5),
            Text(t.appname,
                style: TextStyles.title(context).copyWith(
                    color: MyColors.primary, fontWeight: FontWeight.bold)),
            Container(height: 15),
            Text(t.enteremailaddresstoresetpassword,
                style: TextStyles.subhead(context).copyWith(
                  color: Colors.blueGrey[300],
                )),
            Container(height: 50),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey[400]!, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey[400]!, width: 2),
                ),
              ),
            ),
            Container(height: 25),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  t.resetpassword,
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: MyColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20)),
                ),
                onPressed: () {
                  verifyFormAndSubmit();
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                child: Text(
                  t.backtologin,
                  style: TextStyle(color: MyColors.primary),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
            ),
            Container(height: 20),
          ],
        ),
      ),
    );
  }
}
