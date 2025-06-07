import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/utils/my_colors.dart';

import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../utils/Alerts.dart';
import '../../utils/ApiUrl.dart';
import '../NoitemScreen.dart';

class AddPrayerRequest extends StatefulWidget {
  const AddPrayerRequest({Key? key}) : super(key: key);

  @override
  State<AddPrayerRequest> createState() => _AddPrayerRequestState();
}

class _AddPrayerRequestState extends State<AddPrayerRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isError = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String reqTitle ='', reqMessage ='';

  late AppStateManager appManager;
  bool isUserLogin = false;
  String mUserEmail = "";
  String mUserName = "";



  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Correct: Access Provider here
    //final appState = Provider.of<AppStateManager>(context, listen: false);
    // Perform any setup with appState if needed
    init();
  }

  void init() async {
    //check if user is currently login
    appManager = Provider.of<AppStateManager>(context);
    Userdata? userdata = appManager.userdata;
    if(userdata != null && userdata.email != ""){
      isUserLogin = true;
      mUserEmail = userdata.email!;
      mUserName = userdata.email!;
      print('user is logged in ');
    }else{
      isUserLogin = false;
    }

  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<void> sendPrayerRequest() async {
    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();

      print(" LINK SendPrayer Request --->  ${ApiUrl.ADD_PRAYER_REQUEST}");

      print(" SendPrayer Request userdata.name --->  ${mUserName}");
      print(" SendPrayer Request userdata.email --->  ${mUserEmail}");

      final response = await dio.post(
        ApiUrl.ADD_PRAYER_REQUEST,
        data: jsonEncode(
            {
          "data": {
            "author": mUserEmail,
            "title": reqTitle,
            "content": reqMessage,
            "email": mUserEmail
          }
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic resD = jsonDecode(response.data);
        Map<String, dynamic> res = json.decode(response.data);
        if (res["status"] == "nok") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          Alerts.show(context, t.success, res["message"]);
        }
        print(res);
        setState(() {
          isLoading = false;
          print(res);
        });
       // toast('Prayer ReQuest has been Send');
       // Navigator.pop(context);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
        });
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
      setState(() {
        isLoading = false;
        isError = true;
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    init();

    if (isLoading) {
      return Container(
        color: Colors.blue.shade100,
        height: 600,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      );
    } else if (isError) {
      return SizedBox(
        height: 600,
        child: Center(
          child: NoitemScreen(
              title: t.oops,
              message: t.dataloaderror,
              onClick: () {
                //loadItems();
                Navigator.pop(context);
              }),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.accent,
          centerTitle: true,
          title:  Text(t.new_prayer_req, style:  primaryTextStyle(color: Colors.white) ),
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                const Text('Enter a Request ',
                                  style: TextStyle(
                                      color: MyColors.accentDark,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400
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
                                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                                child: TextFormField(
                                                  controller: titleController,
                                                  keyboardType: TextInputType.name,
                                                  onSaved: (input) => titleController.text = input.toString(),
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                      borderSide: new BorderSide(color: MyColors.grey_60),
                                                    ),
                                                    prefixIcon: Icon(Icons.title),
                                                    labelText: 'title',
                                                    hintText: 'Enter Title of Request ',
                                                    labelStyle: primaryTextStyle(),
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ), // Usessword field
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                                child: TextFormField(
                                                  controller: messageController,
                                                  keyboardType: TextInputType.name,
                                                  onSaved: (input) => messageController.text = input.toString(),
                                                  maxLines: 12, minLines: 7,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                      borderSide: new BorderSide(color: MyColors.grey_60),
                                                    ),
                                                    labelText: 'Body',
                                                    hintText: 'Enter a Full Message  ',
                                                    labelStyle: primaryTextStyle(),
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ), // Usessword field
                                              /*16.height,
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                                child: TextField(
                                                  enabled: false,
                                                  keyboardType: TextInputType.name,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    enabled: false,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                      borderSide: new BorderSide(color: MyColors.grey_60),
                                                    ),
                                                    prefixIcon: Icon(Icons.image_rounded),
                                                    labelText: 'Upload Image',
                                                    labelStyle: primaryTextStyle(),
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(8),
                                                  ),
                                                ),
                                              ),*/

                                              24.height,
                                            ]
                                        )
                                    )
                                ),



                                SizedBox(height: 40,), //space out

                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () async {
                                          reqTitle = titleController.text.toString();
                                          reqMessage = messageController.text.toString();
                                         // Navigator.pop(context);
                                          if(reqTitle!=null || reqTitle.isNotEmpty){
                                            toast('Enter a Title ');
                                          }else if(reqMessage!=null || reqMessage.isNotEmpty){
                                            toast('Enter the  Request ');
                                          }
                                          sendPrayerRequest();
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: MyColors.accent,
                                                border:
                                                Border.all(color: Colors.white, width: 2)
                                            ),
                                            child:  Text('Send',
                                                textAlign: TextAlign.center,
                                                style:  primaryTextStyle(color: Colors.white) )
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
                                              child:  Text(
                                                'Back',
                                                style:  primaryTextStyle(),
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
}