import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:yourdailylight/screens/ecomshop/pay_webview.dart';

import '../../i18n/strings.g.dart';
import '../../utils/Alerts.dart';
import '../../utils/ApiUrl.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import 'StatusPage.dart';

 class PaymentPage extends StatefulWidget {
   String mAmount, userEmail, mBookIds;
    PaymentPage({required this.mAmount, required this.userEmail, required this.mBookIds});

   @override
   State<PaymentPage> createState() => _PaymentPageState();
 }

 class _PaymentPageState extends State<PaymentPage> {
   final phoneNumberController  = TextEditingController();
   bool isLoading = false;
   bool isError = false;
   String reqStatus ='', reqMessage ='';


   @override
   void dispose() {
     phoneNumberController.dispose();
   }

   Future<void> paymentRequest(String payType, String mPhoneD) async {
     setState(() {
       isLoading = true;
       print('Start Req');
     });

    /* Timer(Duration(seconds: 5), () async {
       print("Yeah, this line is printed after 5 seconds");
*/
       try {
         final dio = Dio();
         print(" LINK SendPrayer Request --->  ${ApiUrl.PAY_SUBSCRIPTION}");
         print(" LINK email --->  ${widget.userEmail}");
         print(" LINK amount --->  ${widget.mAmount}");
         print(" LINK book_ids --->  ${widget.mBookIds}");
         print(" LINK phoneNumber --->  ");

         final response = await dio.post(
           ApiUrl.PAY_SUBSCRIPTION,
           data: jsonEncode(
               {
                 "data":
                 {
                   "reason":"PAIEMENT",
                   "method": payType,
                   "email":widget.userEmail,
                   "name":"0",
                   "option":"PAIEMENT",
                   "amount": widget.mAmount,
                   "pack_code":"one_month_sub",
                   "ctry":"CM",
                   "town":"dla",
                   "uname":widget.userEmail,
                   "address":"dla",
                   "phone":mPhoneD,
                   "book_ids":widget.mBookIds
                 }

               }),
         );

         if (response.statusCode == 200) {
           // If the server did return a 200 OK response,
           // then parse the JSON.
           dynamic resX = jsonDecode(response.data);
           print("ResponseData --> ${resX}");
           //get resData
           //check if payment is ok
           //proceed to check status
           Map<String, dynamic> res = json.decode(response.data);
           String transID  = res["transaction_id"];
           String redirectUrl  = res["redirectUrl"];
           if (res["status"] == "error") {
             Alerts.show(context, t.error, res["message"]);
           } else if(res["status"] == "404"){
             print("Response Message -->> ${res["message"]}");
            Alerts.show(context, t.error, "Payment Processor Coming Soon");

           } else if(res["status"] == "1000"){
             if(payType =="card"){
               //open webview
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => PayWebView(mTitle: "Pay with Card", mUrl: "${redirectUrl}")),
               );

             } else if(payType =="paypal"){
               //open webview
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => PayWebView(mTitle: "Pay PAl", mUrl: "${redirectUrl}")),
               );

             }else{
              // check status OM, MOMO
               //check opt status
               String resCheckStatus = await oPtCheckStatus(transID);
               if(resCheckStatus == "01"){
                 toast('Payment Done Successfully ');
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => StatusPage()),
                 );
               }else{
                 Alerts.show(context, t.error, "${resCheckStatus}");
               }
             }
           } else {
             Alerts.show(context, t.error, res["message"]);
           }
           setState(() {
             isLoading = false;
             print(res);
           });

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

     //});


   }



   Future<String> oPtCheckStatus(String transId) async {
     String status = "toStart";
       try {
         final dio = Dio();
         print(" LINK  CHECK_STATUS --->  ${ApiUrl.CHECK_STATUS}");
         print(" LINK  transId --->  ${transId}");

         final response = await dio.post(
           ApiUrl.CHECK_STATUS,
           data: jsonEncode(
               {
                 "data":
                 {
                   "transaction_id":transId
                 }

               }),
         );

         if (response.statusCode == 200) {
           // If the server did return a 200 OK response,
           // then parse the JSON.
           dynamic resX = jsonDecode(response.data);
           print(resX);
           Map<String, dynamic> res = json.decode(response.data);
           String transID  = res["transaction_id"];
           if (res["status"] == "01") {
             status = "01";
           }else{
             status = res["message"];
           }
         } else {
           status = 'error';
         }
       } catch (exception) {
         // I get no exception here
         print(exception);
         status = 'exception';
       }

     return status;
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: MyColors.accentDark,
         title: const Text('Pay With '),
         centerTitle: true,
       ),
       body: isLoading? Center(
         child: CupertinoActivityIndicator(
           radius: 20,
         ),
       ) : Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: 16,),
               Card(elevation: 4,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                         title: Text('PayPal ',style: primaryTextStyle(size: 21),),
                       leading: Image.asset('assets/images/paypal_icon.png', height: 90, width: 90, fit: BoxFit.contain,),
                       onTap: (){
                         paymentRequest('paypal', "XXXX");
                       },
                     ),
                   )
               ),
               SizedBox(height: 8,),
               Card(elevation: 4,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                       leading: Image.asset('assets/images/card_pay.jpg', height: 90, width: 90, fit: BoxFit.contain, ),
                         title: Text('Card Payment ', style: primaryTextStyle(size: 21),),
                       onTap: (){
                         paymentRequest('card', "XXX");
                       },
                     ),
                   )
               ),
               //Mobile Money
               SizedBox(height: 8,),

               Card(elevation: 4,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ExpansionTile(
                         title: Text('MTN Mobile  Money ',style: primaryTextStyle(size: 21),),
                       leading: Image.asset('assets/images/mtn_momo.jpg', height: 90, width: 90, fit: BoxFit.contain,),
                       children: [
                         SizedBox(height: 16,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextFormField(
                             controller: phoneNumberController,
                             keyboardType: TextInputType.number,
                             decoration: const InputDecoration(
                               labelText: 'Enter Phone Number',
                               labelStyle: TextStyle(fontSize: 17),
                               helperStyle: TextStyle(fontSize: 22),
                               prefixText: "+237",
                               prefixStyle: TextStyle(fontSize: 22)
                             ),

                           ),
                         ),

                         SizedBox(height: 16,),
                         //Enter phone number
                         Container(
                           width: MediaQuery.of(context).size.width /3 *2,
                           child: sSAppButton(
                           color: MyColors.accentDark,
                           context: context,
                           title: 'Pay Now',
                           onPressed: () {
                             String mPhone = phoneNumberController.text.toString();
                             if(mPhone!=null && mPhone.isNotEmpty ){
                               mPhone = "+237" + mPhone;
                              paymentRequest('momo', mPhone);
                             }else{
                               //ssks
                               Alerts.show(context, t.error, "Please Enter your phone Number");
                             }

                           },
                         ),
                         ),
                         SizedBox(height: 16,),
                       ],
                     ),
                   )
               ),

               SizedBox(height: 8,),
               Card(elevation: 4,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ExpansionTile(
                         title: Text('Orange Money ',style: primaryTextStyle(size: 21),),
                       leading: Image.asset('assets/images/orangem.jpeg', height: 90, width: 90, fit: BoxFit.contain,),
                       children: [
                         SizedBox(height: 16,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextFormField(
                             controller: phoneNumberController,
                             keyboardType: TextInputType.number,
                             decoration: const InputDecoration(
                                 labelText: 'Enter Phone Number',
                                 labelStyle: TextStyle(fontSize: 17),
                                 helperStyle: TextStyle(fontSize: 22),
                                 prefixText: "+237",
                                 prefixStyle: TextStyle(fontSize: 22)
                             ),

                           ),
                         ),

                         SizedBox(height: 16,),
                         //Enter phone number
                         Container(
                           width: MediaQuery.of(context).size.width /3 *2,
                           child: sSAppButton(
                             color: MyColors.accentDark,
                             context: context,
                             title: 'Pay Now',
                             onPressed: () {
                               String mPhone = phoneNumberController.text.toString();
                               if(mPhone!=null && mPhone.isNotEmpty ){
                                 mPhone = "+237" + mPhone;
                                 paymentRequest('om', mPhone);
                               }else{
                                 //ssks
                                 Alerts.show(context, t.error, "Please Enter your phone Number");
                               }

                             },
                           ),
                         ),
                         SizedBox(height: 16,),
                       ],
                     ),
                   )
               ),
               SizedBox(height: 16,),
             ],
           ),
         ),
       ),

      /* bottomNavigationBar:  Padding(
         padding: EdgeInsets.all(16),
         child: Row(
           children: [
             SizedBox(width: 8),

             Expanded(
               child: sSAppButton(
                 color: MyColors.accentDark,
                 context: context,
                 title: 'Pay Now',
                 onPressed: () {
                   //To SelectPAymentMth
                  // om momo card or paypal
                   paymentRequest('card');

                 },
               ),
             ),
             SizedBox(width: 8),
           ],
         ),
       ),*/
     );
   }
 }
