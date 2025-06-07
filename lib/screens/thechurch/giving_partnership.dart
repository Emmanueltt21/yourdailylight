import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yourdailylight/utils/my_colors.dart';

import '../../auth/LoginScreen.dart';
import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../SearchScreen.dart';
 class GivingPartnerShip extends StatefulWidget {
   const GivingPartnerShip({Key? key}) : super(key: key);

   @override
   State<GivingPartnerShip> createState() => _GivingPartnerShipState();
 }

 class _GivingPartnerShipState extends State<GivingPartnerShip> {
   late AppStateManager appManager;
   bool isUserLogin = false;
   String mUserEmail = "";


   @override
   void initState() {
     // TODO: implement initState
     init();
     super.initState();
   }
   void init() async {
     //check if user is currently login
     appManager = Provider.of<AppStateManager>(context);
     Userdata? userdata = appManager.userdata;
     if(userdata != null && userdata.email != ""){
       isUserLogin = true;
       mUserEmail = userdata.email!;
       print('user is logged in ');
     }else{
       isUserLogin = false;
     }

   }

   @override
   void setState(fn) {
     if (mounted) super.setState(fn);
   }


   @override
   Widget build(BuildContext context) {
     init();
     return Scaffold(
       appBar: AppBar(
         title:  Text(t.giveandpart),
         centerTitle: true,
       ),
       body: isUserLogin ? SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               rowContainer(Icons.wallet, "MTN Mobile Money ", "Name: Your Daily Light"),
               rowContainer(Icons.wallet, "Orange Mobile Money ", "Name: Your Daily Light"),
             //  rowContainer(Icons.paypal, " pastorsimon@lgmissions.org ", "Motive: Your Daily Light  "),
              // Text('Giving and partnership view '),
              /* Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: ListTile(
                   leading: Icon(Icons.payment),
                   title: const Text('Donate with PayPal or Card ',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                   trailing: Icon(Icons.arrow_forward_ios),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => PayPAlDonation()));
                     //Navigator.pushNamed(context, PayPAlDonation.routeName);
                   },
                 ),
               )*/


             ],
           ),
         ),
       ) : Center(
         child: GestureDetector(
           onTap: (){
             Navigator.pushNamed(
                 context, LoginScreen.routeName);
           },
             child: Text('Login to View Request', style: TextStyle(fontSize: 18),)),
       ),
     );
   }

   Widget rowContainer (icon, String title, String subtitle){
     return Container(
       padding: EdgeInsets.all(16),
       margin: const EdgeInsets.only(bottom: 8),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(0),
         border: Border.all(
           width: 1.2,
           color: Colors.grey.shade400,
         ),
       ),
       child: Row(
         children: [
           Icon(icon, size: 40,color: MyColors.primaryDark,),
           SizedBox(width: 8,),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text(title, style: boldTextStyle(size: 18),),
               Text(subtitle, style: primaryTextStyle(size: 14),)
             ],
           ),
         ],
       ),
     );
   }
   
 }




 class PayPAlDonation extends StatefulWidget {
   static String routeName = "/payPAlDonation";


   @override
   State<PayPAlDonation> createState() => _PayPAlDonationState();

 }

 class _PayPAlDonationState extends State<PayPAlDonation> {
   bool isLoading = true;

   late WebViewController webView;

   Future<bool> _onBack() async {
     var value = await webView.canGoBack();

     if (value) {
       await webView.goBack();
       return false;
     } else {
       return true;
     }
   }

   @override
   Widget build(BuildContext context) {
     return WillPopScope(
       onWillPop: () => _onBack(),
       child: Scaffold(
         appBar: AppBar(
           title: const Text('Donate'),
           centerTitle: true,
         ),
         body: SafeArea(
           child: Stack(
             children: [
             /*  WebView(
                // initialUrl: 'https://www.codewithflutter.com',
                 initialUrl: '${ApiUrl.donationPage}',
                // javascriptMode: JavascriptMode.unrestricted,
                 onPageStarted: (url) {
                   setState(() {
                     isLoading = true;
                   });
                 },
                 onPageFinished: (status) {
                   setState(() {
                     isLoading = false;
                   });
                 },
                 onWebViewCreated: (WebViewController controller) {
                   webView = controller;
                 },
               ),*/
               isLoading
                   ? Center(
                   child: Container(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 50.0, vertical: 20.0),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(25.0)),
                     child: CircularProgressIndicator(),
                   ))
                   : Stack(),
             ],
           ),
         ),
       ),
     );
   }


   Future openLinkWithCustomTab(BuildContext context, String url) async {
     try{
       /*await FlutterWebBrowser.openWebPage(
         url: url,
         customTabsOptions: const CustomTabsOptions(
           instantAppsEnabled: true,
           showTitle: true,
           urlBarHidingEnabled: true,
         ),
         safariVCOptions: const SafariViewControllerOptions(
           barCollapsingEnabled: true,
           dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
           modalPresentationCapturesStatusBarAppearance: true,
         ),
       );*/
     }catch(e){
       showAlert(context, 'Cant launch the url');
       debugPrint(e.toString());
     }
   }


   void showAlert(BuildContext context, String title){
     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (context) {
           return AlertDialog(
             content: Flex(
               direction: Axis.horizontal,
               children: <Widget>[
                 CupertinoActivityIndicator(),
                 Padding(
                   padding: EdgeInsets.only(left: 15),
                 ),
                 Flexible(
                     flex: 8,
                     child: Text(
                       title,
                       style: TextStyle(
                           fontSize: 16, fontWeight: FontWeight.bold),
                     )),
               ],
             ),
           );
         });
   }


 }
