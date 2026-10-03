import 'package:flutter/material.dart';
import 'package:yourdailylight/auth/email_otp_screen.dart';
import '../service/AuthService.dart';
import '../utils/Alerts.dart';
import 'dart:convert';
import 'dart:async';
import '../utils/my_colors.dart';
import '../utils/ApiUrl.dart';
import 'package:http/http.dart' as http;
import '../i18n/strings.g.dart';
import 'LoginScreen.dart';
import '../utils/TextStyles.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";
  RegisterScreen();

  @override
  RegisterScreenRouteState createState() => new RegisterScreenRouteState();
}

class RegisterScreenRouteState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isRepeatPasswordObscured = true;

  verifyFormAndSubmit() {
    String _name = nameController.text.trim();
    String _email = emailController.text.trim();
    String _password = passwordController.text;
    String _repeatPassword = repeatPasswordController.text;

    if (_name == "" || _email == "" || _password == "") {
      Alerts.show(context, t.error, t.emptyfielderrorhint);
    } else if (EmailValidator.validate(_email) == false) {
      Alerts.show(context, t.error, t.invalidemailerrorhint);
    } else if (_password != _repeatPassword) {
      Alerts.show(context, t.error, t.passwordsdontmatch);
    } else {
      registerUser(_email, _name, _password);
    }
  }

  Future<void> registerUser(String email, String name, String password) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      print('method --->> registerUser');
      print('URl --->> ${ApiUrl.REGISTER}');
      print('body  --->> ${"$email  $name  $password"}');
      final response = await http.post(Uri.parse(ApiUrl.REGISTER),
          body: jsonEncode({
            "data": {
              "email": email,
              "name": name,
              "password": password,
            }
          }));
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        print(response.body);
        Map<String, dynamic> res = json.decode(response.body);
        if (res["status"] == "error") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>
              EmailOtpScreen(email: email, password: password)));
        }
        print(res);
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
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
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_add_alt_1_rounded,
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
                  t.createaccount,
                  textAlign: TextAlign.center,
                  style: TextStyles.subhead(context).copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  t.fullname,
                  style: TextStyles.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "John Doe",
                    prefixIcon: Icon(Icons.person_outline_rounded, color: MyColors.primary),
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
                const SizedBox(height: 18),
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
                const SizedBox(height: 18),
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
                const SizedBox(height: 18),
                Text(
                  t.repeatpassword,
                  style: TextStyles.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: repeatPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: _isRepeatPasswordObscured,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    prefixIcon: Icon(Icons.lock_reset_rounded, color: MyColors.primary),
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
                        _isRepeatPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _isRepeatPasswordObscured = !_isRepeatPasswordObscured;
                        });
                      },
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
                      t.register,
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
                      "Already have an account? ",
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        t.alreadyhaveanaccount,
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
