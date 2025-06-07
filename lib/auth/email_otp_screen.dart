import 'package:flutter/material.dart';

import '../i18n/strings.g.dart';
import '../service/AuthService.dart';
import '../utils/Alerts.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';



class EmailOtpScreen extends StatefulWidget {
  String email , password;
   EmailOtpScreen({super.key, required this.email, required this.password});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    iniComponent();
    super.initState();
  }

  void iniComponent() async {
print("Email Sent -------------->>");
    String? message = await _authService.signUp(
      widget.email,
      widget.password,
    );

    Alerts.show(context, t.success,  message ?? 'Signup failed');
  }


  Future<void> checkEmailVerification(BuildContext cnxt) async {
    bool isVerified = await AuthService().isEmailVerified();
    if (isVerified) {
      print('Email is verified.');
      Alerts.showSuccessRegAlertDialog(cnxt);
      // Navigate to main app screen or unlock features
    } else {
      print('Email not verified.');
      Alerts.show(context,  "Pending Verification ", "Email not verified \n Check your Mail box and click on the link to get verify");
      // Prompt the user to verify their email
    }
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: Colors.white,
      appBar:
      PreferredSize(preferredSize: Size.fromHeight(0), child: Container()),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          //height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
              ),
              Column(
                children: [
                  Text("Email Verification Sent",
                      style: TextStyles.title(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold)),
                  Container(height: 5),
                  Text("Open your mail, Click on the link to verify your Account",
                      style: TextStyles.subhead(context).copyWith()),
                ],
              ),
              Container(height: 25),
              Container(height: 5),
              Container(height: 50),


              Container(height: 20),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    checkEmailVerification(context);
                  },
                  child: Text(
                    "Check Verification",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _authService.resendVerificationEmail();
                  },
                  child: Text(
                    "Resend Link",
                    style: TextStyle(color: MyColors.primary),
                  ),
                ),
              ),
              Container(height: 25),

              Container(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

