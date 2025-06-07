import 'package:yourdailylight/auth/ForgotPasswordScreen.dart';
import 'package:yourdailylight/auth/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'dart:io';

import 'email_otp_screen.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  LoginScreen();

  @override
  LoginScreenRouteState createState() => new LoginScreenRouteState();
}

class LoginScreenRouteState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //final fb = FacebookLogin();
  GoogleSignInAccount? _currentUser;

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

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
   //  bool isVerified = await AuthService().isEmailVerified();
    final AuthService _authService = AuthService();
    bool isVerified = await _authService.isEmailVerified();
    if (isVerified) {
      print('Email is verified.');
      //Alerts.showSuccessRegAlertDialog(cnxt);
      // Navigate to main app screen or unlock features
      Provider.of<AppStateManager>(context, listen: false)
          .setUserData(Userdata.fromJson(res["user"]));

      Navigator.of(context).pop();

    } else {
      print('Email not verified.');
      Alerts.showToast(context,   "Email not verified \n Check your Mail box and click on the link to get verify");
      // Prompt the user to verify their email
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
          EmailOtpScreen(email: emailController.text.trim(), password: passwordController.text)));
    }
  }




  Future<void> loginUser(
      String? email, String password, String? name, String type) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      var data = {
        "email": email,
        "password": password,
        "name": name,
        "type": type,
      };
      final response = await http.post(Uri.parse(ApiUrl.LOGIN),
          body: jsonEncode({"data": data}));
      if (response.statusCode == 200) {
        // Navigator.pop(context);
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Navigator.of(context).pop();
        print(response.body);
        Map<String, dynamic> res = json.decode(response.body);
        if (res["status"] == "error") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          print(res["user"]);
          //Alerts.show(context, Strings.success, res["message"]);
          Provider.of<AppStateManager>(context, listen: false)
              .setUserData(Userdata.fromJson(res["user"]));
         //checkEmailVerification(context ,res);
          Navigator.of(context).pop();
        }
        //print(res);
      }
    } catch (exception) {
      Navigator.of(context).pop();
      Alerts.show(context, t.error, exception.toString());
      // Navigator.pop(context);
      // I get no exception here
      print(exception);
    }
  }



  Future<Null> loginWithFacebook() async {
    /*final FacebookLoginResult result =
        await facebookSignIn.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        var graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${accessToken.token}'));
        Map<String, dynamic> profile = json.decode(graphResponse.body);
        print(profile);
        loginUser(profile['email'], "", profile['name'], t.facebook);
        break;
      case FacebookLoginStatus.cancelledByUser:
        Toast.show('Login cancelled by the user.', context);
        break;
      case FacebookLoginStatus.error:
        Toast.show(t.facebookloginerror + ': ${result.errorMessage}', context);
        break;
    }*/
/*
    await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    await _updateLoginInfo();*/
  }

  Future<void> _updateLoginInfo() async {
   /* final token = await fb.accessToken;
    FacebookUserProfile? profile;

    if (token != null) {
      profile = await fb.getUserProfile();
      if (token.permissions.contains(FacebookPermission.email.name)) {
        String? email = await fb.getUserEmail();
        loginUser(email, "", profile!.name, t.facebook);
      } else {
        Alerts.showToast(
          context,
          t.facebookloginerror + ': Failed to get email permissions',
        );
      }
    } else {
      Alerts.showToast(
        context,
        t.facebookloginerror + ': Failed to get user details',
      );
    }*/
  }

  Future<void> initPlatformState() async {
  /*  SignInApple.handleAppleSignInCallBack(
        onCompleteWithSignIn: (AppleIdUser user) async {
      print("flutter receiveCode: \n");
      print(user.authorizationCode);
      print("flutter receiveToken \n");
      print(user.identifyToken);

      if (user.mail != null || user.mail != "") {
        loginUser(user.mail ?? "Apple User", "", user.name ?? "", "Apple");
      }
    }, onCompleteWithError: (AppleSignInErrorCode code) async {
      var errorMsg = "unknown";
      switch (code) {
        case AppleSignInErrorCode.canceled:
          errorMsg = "user canceled request";
          break;
        case AppleSignInErrorCode.failed:
          errorMsg = "request fail";
          break;
        case AppleSignInErrorCode.invalidResponse:
          errorMsg = "request invalid response";
          break;
        case AppleSignInErrorCode.notHandled:
          errorMsg = "request not handled";
          break;
        case AppleSignInErrorCode.unknown:
          errorMsg = "request fail unknown";
          break;
      }
      print(errorMsg);
    });*/
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      //check for ios if developing for both android & ios
      initPlatformState();
    }

    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        // _handleGetContact();
        print(_currentUser!.email);
        loginUser(_currentUser!.email, "", _currentUser!.displayName, t.google);
      }
    });
    googleSignIn.signInSilently();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: Colors.white,
      appBar:
          PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
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
                  Text(t.appname,
                      style: TextStyles.title(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold)),
                  Container(height: 5),
                  Text(t.signintocontinue,
                      style: TextStyles.subhead(context).copyWith()),
                ],
              ),
              Container(height: 25),
              Container(height: 5),
              Container(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.emailaddress,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.password,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
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
              Container(height: 8),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    t.forgotpassword,
                    style: TextStyle(color: MyColors.primary, fontSize: 15),
                  ),
                ),
              ),
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
                    verifyFormAndSubmit();
                  },
                  child: Text(
                    t.signin,
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
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName);
                  },
                  child: Text(
                    t.signinforanaccount,
                    style: TextStyle(color: MyColors.primary),
                  ),
                ),
              ),
              Container(height: 25),
              /*Center(
                child: Text(
                  t.orloginwith,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(height: 15),
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(
                        LineAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 20,
                      ), //`Icon` to display
                      label: Text(
                        t.facebook,
                        style: TextStyle(color: Colors.white),
                      ), //`Text` to display
                      onPressed: () {
                        loginWithFacebook();
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[400],
                      ),
                      icon: Icon(
                        LineAwesomeIcons.google_plus,
                        color: Colors.white,
                        size: 20,
                      ), //`Icon` to display
                      label: Text(
                        t.google,
                        style: TextStyle(color: Colors.white),
                      ), //`Text` to display
                      onPressed: () {
                        _handleSignIn();
                      },
                    ),
                  ),
                  Visibility(
                    visible: Platform.isIOS ? true : false,
                    child: Container(
                      width: double.infinity,
                      child: AppleSignInSystemButton(
                        width: 250,
                        height: 50,
                        buttonStyle: AppleSignInSystemButtonStyle.black,
                      ),
                    ),
                  ),
                ],
              ),*/
              Container(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
