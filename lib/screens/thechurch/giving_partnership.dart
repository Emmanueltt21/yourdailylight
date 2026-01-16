import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yourdailylight/utils/my_colors.dart';

import '../../auth/LoginScreen.dart';
import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../widgets/widget_church.dart';
import '../BrowserTabScreen.dart';
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
         title: Text(
           t.giveandpart,
           style: const TextStyle(color: Colors.white),
         ),
         centerTitle: true,
       ),

       body: SafeArea(
         child: SingleChildScrollView(
           physics: const BouncingScrollPhysics(), // smooth scrolling
           padding: const EdgeInsets.all(16.0),

           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               16.height,

               commonCacheImageWidget(
                 'assets/images/image_giftsv3.jpg',
                 200,
                 width: context.width(),
                 fit: BoxFit.cover,
               ).cornerRadiusWithClipRRect(16),

               16.height,

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   t.appDescriptionSupport,
                   style: primaryTextStyle(
                     color: Colors.blueGrey.shade700,
                   ),
                 ),
               ),

               8.height,

               rowContainer(
                 Icons.paypal,
                 t.giving_via_paypal,
                 t.click_to_give,
                     () {
                   openBrowserTab(
                     context,
                     t.giving_via_paypal,
                     ApiUrl.appPaypal_Url,
                   );
                 },
               ),

               rowContainer(
                 Icons.account_balance,
                 t.seebankdetails,
                 t.via_bank,
                     () {
                   bankBottomSheet();
                 },
               ),

               rowContainer(
                 Icons.mail,
                 t.additional_giving,
                 "${t.email}: ${ApiUrl.supportEmail}",
                     () {
                   Clipboard.setData(
                     ClipboardData(text: ApiUrl.supportEmail),
                   );

                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(
                       content: Text('Mail copied to clipboard'),
                     ),
                   );
                 },
               ),

               16.height,
             ],
           ),
         ),
       ),
     );
   }


   Future<void> openEmailApp() async {
     final Uri emailLaunchUri = Uri(
       scheme: 'mailto',
       path: '${ApiUrl.supportEmail}',
       query: Uri.encodeFull('subject=HelloYourDailylight&body=How can I support the Ministry? '),
     );

     if (await canLaunchUrl(emailLaunchUri)) {
       await launchUrl(emailLaunchUri);
     } else {
       throw 'Could not launch mail app';
     }
   }

   void openBrowserTab(BuildContext context, String title, String url) {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => BrowserTabScreen(title: title, url: url),
       ),
     );
   }

   Widget rowContainer (icon, String title, String subtitle, VoidCallback onTap){
     return GestureDetector(
       onTap: onTap,
       child: Container(
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
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(title, style: boldTextStyle(size: 18),),
                 Text(subtitle, style: primaryTextStyle(size: 14),)
               ],
             ),
           ],
         ),
       ),
     );
   }
   

    void bankBottomSheet() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                24.height,
                Text(
                  "Bank Transfer Details",
                  style: boldTextStyle(size: 20, color: MyColors.primary),
                ),
                16.height,
                _buildBankDetailRow("Account Name", "Lighthouse Global Missions"),
                16.height,
                _buildBankDetailRow("Bank", "Sparkasse"),
                16.height,
                _buildBankDetailRow("IBAN", "DE 2879 3501 0100 2233 8503", isCopyable: true),
                32.height,
              ],
            ),
          );
        },
      );
    }

    Widget _buildBankDetailRow(String label, String value, {bool isCopyable = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: secondaryTextStyle(size: 14)),
          4.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: boldTextStyle(size: 16, color: MyColors.primaryDark),
                ),
              ),
              if (isCopyable)
                IconButton(
                  icon: Icon(Icons.copy, size: 20, color: MyColors.primary),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: value));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('IBAN copied to clipboard')),
                    );
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
          const Divider(height: 24),
        ],
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
