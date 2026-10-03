import 'package:yourdailylight/auth/ForgotPasswordScreen.dart';
import 'package:yourdailylight/auth/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/AppStateManager.dart';
import '../i18n/strings.g.dart';
import '../service/AuthService.dart';
import '../utils/Alerts.dart';
import '../utils/TextStyles.dart';
import 'dart:convert';
import 'dart:async';
import '../utils/my_colors.dart';
import '../utils/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import '../models/Userdata.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'email_otp_screen.dart';

final GoogleSignIn googleSignIn = GoogleSignIn.instance;

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  LoginScreen();

  @override
  LoginScreenRouteState createState() => new LoginScreenRouteState();
}

class LoginScreenRouteState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  GoogleSignInAccount? _currentUser;

  verifyFormAndSubmit() {
    String _email = emailController.text.trim();
    String _password = passwordController.text;

    if (_email == "" || _password == "") {
      Alerts.show(context, t.error, t.emptyfielderrorhint);
    } else if (EmailValidator.validate(_email) == false) {
      Alerts.show(context, t.error, t.invalidemailerrorhint);
    } else {
      loginUser(_email, _password, "", "");
    }
  }

  Future<void> checkEmailVerification(BuildContext cnxt, Map<String, dynamic> res) async {
    final AuthService _authService = AuthService();
    bool isVerified = await _authService.isEmailVerified();
    if (isVerified) {
      print('Email is verified.');
      Provider.of<AppStateManager>(context, listen: false)
          .setUserData(Userdata.fromJson(res["user"]));

      Navigator.of(context).pop();
    } else {
      print('Email not verified.');
      Alerts.showToast(context, "Email not verified \n Check your Mail box and click on the link to get verify");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
          EmailOtpScreen(email: emailController.text.trim(), password: passwordController.text)));
    }
  }

  Future<void> loginUser(
      String? email, String password, String? name, String type) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      if (type.isEmpty) {
        final AuthService authService = AuthService();
        final userCredential =
            await authService.signInWithEmailAndPassword(email!, password);
        final firebaseUser = userCredential?.user;

        Provider.of<AppStateManager>(context, listen: false).setUserData(
          Userdata(
            name: firebaseUser?.displayName ?? email.split('@').first,
            email: firebaseUser?.email ?? email,
            avatar: "",
            coverPhoto: "",
            gender: "",
            dateOfBirth: "",
            phone: "",
            aboutMe: "",
            location: "",
            qualification: "",
            facebook: "",
            twitter: "",
            linkdln: "",
            activated: 0,
          ),
        );

        Navigator.of(context).pop();
        Navigator.of(context).pop();
        return;
      }

      var data = {
        "email": email,
        "password": password,
        "name": name,
        "type": type,
      };
      final response = await http.post(Uri.parse(ApiUrl.LOGIN),
          body: jsonEncode({"data": data}));
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        print(response.body);
        Map<String, dynamic> res = json.decode(response.body);
        if (res["status"] == "error") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          Provider.of<AppStateManager>(context, listen: false)
              .setUserData(Userdata.fromJson(res["user"]));
          Navigator.of(context).pop();
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      Alerts.show(
        context,
        t.error,
        e.message ?? "Failed to authenticate user",
      );
    } catch (exception) {
      Navigator.of(context).pop();
      Alerts.show(context, t.error, exception.toString());
      print(exception);
    }
  }

  Future<Null> loginWithFacebook() async {}

  Future<void> _updateLoginInfo() async {}

  Future<void> initPlatformState() async {}

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      initPlatformState();
    }

    unawaited(
      googleSignIn.initialize().then((_) {
        googleSignIn.authenticationEvents
            .listen(_handleAuthenticationEvent)
            .onError(_handleAuthenticationError);
        googleSignIn.attemptLightweightAuthentication();
      }),
    );
  }

  Future<void> _handleSignIn(GoogleSignInAccount user) async {
    setState(() {
      _currentUser = user;
    });
    print(_currentUser!.email);
    loginUser(_currentUser!.email, "", _currentUser!.displayName, t.google);
  }

  Future<void> _handleSignOut() async {
    setState(() {
      _currentUser = null;
    });
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    switch (event) {
      case GoogleSignInAuthenticationEventSignIn():
        _handleSignIn(event.user);
        break;
      case GoogleSignInAuthenticationEventSignOut():
        _handleSignOut();
        break;
    }
  }

  Future<void> _handleAuthenticationError(Object e) async {
    setState(() {
      _currentUser = null;
      print("Google Sign-In Error: $e");
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.light_mode_rounded,
                      size: 38,
                      color: MyColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.appname,
                  textAlign: TextAlign.center,
                  style: TextStyles.title(context).copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.signintocontinue,
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
                const SizedBox(height: 20),
                Text(
                  t.password,
                  style: TextStyles.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _isPasswordObscured,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    prefixIcon: Icon(Icons.lock_outline_rounded, color: MyColors.primary),
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      t.forgotpassword,
                      style: TextStyle(
                        color: MyColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
                      t.signin,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        t.signinforanaccount,
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
