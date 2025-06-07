import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../i18n/strings.g.dart';
import '../../utils/my_colors.dart';



class ChangePwd extends StatefulWidget {
  const ChangePwd({Key? key}) : super(key: key);

  @override
  State<ChangePwd> createState() => _ChangePwdState();
}

class _ChangePwdState extends State<ChangePwd> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cnPassword = TextEditingController();
  bool _passwordVisible = false;
  bool _cnPasswordVisible = false;
  // UserService _userService = UserService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.accent,
          centerTitle: true,
          title:  Text(t.changepwd,
              style: const TextStyle(fontSize: 20)),
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Colors.white,
          child: Stack(
              children: [
                //BackGroundLayer(name: AppConfigData.backG),
                Center(
                    child:Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, right: 18),
                                  child: Text('Enter Credentials to  Update Password! ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyColors.accent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ), //Create Account

                                20.height,
                                Card(
                                    elevation: 8,
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                                        child: Column(
                                            children: [
                                              24.height,

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: TextFormField(
                                                  obscureText: !_passwordVisible,
                                                  controller: oldPassword,
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _passwordVisible
                                                            ? Icons.visibility
                                                            : Icons.visibility_off,
                                                        color: Color(0xff828282),
                                                      ),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        /* setState(() {
                                                          _passwordVisible = !_passwordVisible;
                                                        });*/
                                                      },
                                                    ),

                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                      borderSide: new BorderSide(color: MyColors.accent),
                                                    ),
                                                    prefixIcon: Icon(Icons.lock),
                                                    labelText: 'Old Password',
                                                    labelStyle:TextStyle(
                                                        color: Colors.grey.shade800,
                                                        fontFamily: 'worksans',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 16) ,
                                                    hintText: 'Enter your secure old password',
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ), //password field

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: TextFormField(
                                                  obscureText: !_passwordVisible,
                                                  controller: _password,
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _passwordVisible
                                                            ? Icons.visibility
                                                            : Icons.visibility_off,
                                                        color: Color(0xff828282),
                                                      ),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        /*setState(() {
                                                          _passwordVisible = !_passwordVisible;
                                                        });*/
                                                      },
                                                    ),

                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                      borderSide: new BorderSide(color: MyColors.accent),
                                                    ),
                                                    prefixIcon: Icon(Icons.lock),
                                                    labelText: 'New Password',
                                                    labelStyle:TextStyle(
                                                        color: Colors.grey.shade800,
                                                        fontFamily: 'worksans',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 16) ,
                                                    hintText: 'Enter your secure password',
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ), //password field

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: TextFormField(
                                                  obscureText: !_cnPasswordVisible,
                                                  controller: _cnPassword,
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _cnPasswordVisible
                                                            ? Icons.visibility
                                                            : Icons.visibility_off,
                                                        color: Color(0xff828282),
                                                      ),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        /*setState(() {
                                                          _cnPasswordVisible = !_cnPasswordVisible;
                                                        });*/
                                                      },
                                                    ),

                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      borderSide: new BorderSide(color: MyColors.accent),
                                                    ),
                                                    prefixIcon: Icon(Icons.lock),
                                                    labelText: 'Confirm New Password',
                                                    labelStyle:TextStyle(
                                                        color: Colors.grey.shade800,
                                                        fontFamily: 'worksans',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 16) ,
                                                    hintText: 'Enter the confirm password',
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ), //password field

                                              24.height,
                                            ]
                                        )
                                    )
                                ),



                                24.height,

                                Container(
                                  width: MediaQuery.of(context).size.width/4 *4,
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () async {
                                          /* Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => LoginPage()));

*/
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: MyColors.accent,
                                                border:
                                                Border.all(color: Colors.white, width: 2)
                                            ),
                                            child: const Text('Validate',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300))
                                        )
                                    ),
                                  ),
                                ), //LOGIN BUTTON

                                SizedBox(height:50,), //space out

                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child:
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [


                                        Padding(
                                          padding: const EdgeInsets.all(0), //padding to prevent the edge of the button from touching the screen
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50)),
                                                backgroundColor: Colors.transparent,
                                                padding: EdgeInsets.all(0),
                                              ),
                                              child: const Text(
                                                'Back To Home',
                                                style: TextStyle(
                                                  color: MyColors.accent,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              )),
                                        ), //Register button
                                      ]
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ]),
        )
    );
  }


}
