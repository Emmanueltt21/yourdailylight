import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:yourdailylight/screens/thechurch/paypal_webview_screen.dart';

import '../../i18n/strings.g.dart';
import '../../models/NBModel.dart';
import '../../providers/NBDataProviders.dart';
import '../../utils/ApiUrl.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import '../NoitemScreen.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({Key? key}) : super(key: key);

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  List<NBMembershipPlanItemModel> membershipPlanList = nbGetMembershipPlanItems();
  int selectedIndex = 0;
  bool isLoading = false;
  bool isError = false;
  String mAmount = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
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
      return Container(
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
        title:  Text(' My Subscription ', style:  primaryTextStyle(color: Colors.white) ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            16.height,
            Text('Choose your plan', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'By becoming a member you can read on any\n device.read with no ads.and offline.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ),
            16.height,
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: membershipPlanList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor:  Colors.white54,
                    border: Border.all(color:  index == selectedIndex ? MyColors.accent : MyColors.grey_20, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: MyColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check, color: index == selectedIndex ? white : grey.withOpacity(0.2)),
                      ),
                      16.height,
                      Text('${membershipPlanList[index].timePeriod}', style: boldTextStyle(size: 20)),
                      8.height,
                      Text('${membershipPlanList[index].price}', style: boldTextStyle()),
                      16.height,
                      Text('${membershipPlanList[index].text}', style: secondaryTextStyle()),
                    ],
                  ),
                ).onTap(
                      () {
                    setState(
                          () {
                        selectedIndex = index;
                      },
                    );
                  },
                );
              },
            ),
            16.height,
            nbAppButtonWidget(
              context,
              'Select Plan',
                  () async {
                    //finish(context);
                    mAmount = membershipPlanList[selectedIndex].amount;
                    print('Amount  ---->> $mAmount');
                    if (mAmount.isEmpty) {
                      toastLong("Amount Cannot be  empty");
                    }else if ( mAmount.toInt() != 0) {
                      toastLong("Amount Cannot be Zero ");
                    } else{

                      /// call Service to make Get PayPal Link for subscription
                      /// Go to  paypal_webview_screen.dart
                      ///
                      await requestPayPal(mAmount);
                  }
              },
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),

    );
  }
  }

  Future<void> requestPayPal(String amount) async {
setState(() {
  isLoading = true;
});
    try {

      final dio = Dio();
      print('PAyPaL Link ---->> ${ApiUrl.GETPaymentPayPal}');
      print('Amount  ---->> $amount');
      final response = await dio.post(
        ApiUrl.GETPaymentPayPal,
        data: jsonEncode({
          "data": {
            "user_id" : "2",
            "order_id" : "1",
            "amount" : amount,
            "optype": "subscription"
          }
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic res = jsonDecode(response.data);
         print('Data res ---->> ${res}');
         Map<String, dynamic> mMap = res;
         String baseURl  = mMap['data'];
         String order_id  = mMap['order_id'];
        baseURl = ApiUrl.BASEURL + baseURl;

        print('baseURl  ---->> ${baseURl}');
        setState(() {
          isLoading = false;
        });

        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => PaypalWebView(
                  url: baseURl,
                  from: "order",
                  orderId: order_id,
                  addNote: "Payment ",
                )));

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
        });

      }
    } catch (exception) {
      setState(() {
        isLoading = false;
      });
      // I get no exception here
      print(exception);

    }
  }



}
