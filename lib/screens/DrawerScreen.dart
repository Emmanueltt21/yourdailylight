import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';
import 'package:html/parser.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yourdailylight/screens/thechurch/giving_partnership.dart';
import 'package:yourdailylight/screens/thechurch/my_subscription.dart';
import 'package:yourdailylight/screens/thechurch/mylibrary.dart';
import 'package:yourdailylight/screens/thechurch/prayer_request.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/Userdata.dart';
import 'package:flutter/cupertino.dart';
import '../providers/AppStateManager.dart';
import '../screens/PlaylistsScreen.dart';
import '../screens/BookmarkScreen.dart';
import '../socials/UpdateUserProfile.dart';
import '../socials/SocialActivity.dart';
import '../utils/TextStyles.dart';
import '../utils/app_themes.dart';
import '../utils/img.dart';
import '../utils/langs.dart';
import '../utils/my_colors.dart';
import '../utils/ApiUrl.dart';
import '../auth/LoginScreen.dart';
import '../i18n/strings.g.dart';
import '../utils/utils.dart';
import 'BrowserTabScreen.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late AppStateManager appManager;
  //static const String storeBaseURL = 'https:play.google.com/';

  static const appStoreBaseUrl = 'https://www.apple.com/app-store/';
  double ratingValue = 0.0;


  Future<void> launchUrl(String url, {bool forceWebView = false}) async {
    await launch(url, forceWebView: forceWebView, enableJavaScript: true,universalLinksOnly:true).catchError((e) {
      log(e);
      toast('Invalid URL: $url');
    });
  }

  String storeBaseURL() {
    return isAndroid ? playStoreBaseURL : appStoreBaseUrl;
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteAccount(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }


  void showMessAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(
              message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount(BuildContext context) async {




    try {


      debugPrint("Deleting user .....>> ");

      appManager.unsetUserData();
      _handleSignOut();

      Provider.of<AppStateManager>(context, listen: false).unsetUserData;
      await googleSignIn.signOut();

      showMessAlert(context, 'Account deleted successfully');

      /*if (appManager.userdata != null) {
       // await user.delete();
        debugPrint("Deleting user .....>> ");
        appManager.unsetUserData;
          showMessAlert(context, 'Account deleted successfully');
        //Navigator.pushReplacementNamed(context, '/login');*/
    } catch (e) {
      debugPrint("Failed Deleting user .....>> ");
      showMessAlert(context, 'Failed to delete account: $e');
    }
    /*}else{
      debugPrint("Failed Deleting user .....>> ");
      showMessAlert(context, 'Account has been deleted : ');
    }*/
  }



  void rateAppNow(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            elevation: 5,
            insetPadding: const EdgeInsets.all(30),
            insetAnimationCurve: Curves.easeInExpo,
            insetAnimationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingBar(
                    initialRating: 0.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 45,
                    glowColor: Colors.orange,
                    unratedColor: Colors.grey,
                    glow: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      half:
                      const Icon(Icons.star_half, color: Colors.orange),
                      empty:  Icon(Icons.star_border,
                          color: Colors.grey.shade300),
                    ),
                    onRatingUpdate: (double value) {
                      debugPrint("rating=> $value");
                      ratingValue = value;
                    },
                  ),
                  Text(
                    "Enjoy Using ${ApiUrl.appName}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                        fontStyle: FontStyle.normal
                    ),
                  ),
                  const  Text(
                    "Tap a star rate it on the App Store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontStyle: FontStyle.normal
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (ratingValue == 0.0) {
                            Utils().showToast(
                                "Please Enter Your Rating");
                          } else {
                            // App Rating Api Call After Button Click
                            debugPrint("Clicked on rateApp");
                            await Utils.redirectToStore();
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient:   LinearGradient(
                                colors: [ MyColors.primary,
                                  MyColors.accent,],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const  Text(
                            "submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontStyle: FontStyle.normal
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 120,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }


  Future<void> showLogoutAlert() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(t.logoutfromapp),
              content: Text(t.logoutfromapphint),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    appManager.unsetUserData();
                    _handleSignOut();
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  Future<void> _handleSignOut() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      print(error);
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

  openBrowserTabOld(String title, String url) async {
    /*await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        toolbarColor: MyColors.primary,
        secondaryToolbarColor: MyColors.primary,
        navigationBarColor: MyColors.primary,
        addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: MyColors.primary,
        preferredControlTintColor: MyColors.primary,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    appManager = Provider.of<AppStateManager>(context);
    Userdata? userdata = appManager.userdata;
    bool themeSwitch = appManager.themeData == appThemeData[AppTheme.Dark];
    String language = appLanguageData[
        AppLanguage.values[appManager.preferredLanguage]]!['name']!;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  (userdata != null && userdata.coverPhoto != "")
                      ? Container(
                          width: double.infinity,
                          height: 160,
                          //color: MyColors.primary,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(userdata.coverPhoto!),
                                fit: BoxFit.fill),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 160,
                          color: MyColors.primary,
                        ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    color: (userdata != null && userdata.coverPhoto != "")
                        ? Colors.black54
                        : MyColors.primary,
                    child: Column(
                      children: <Widget>[
                        (userdata != null && userdata.avatar != "")
                            ? Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(userdata.avatar!),
                                      fit: BoxFit.fill),
                                ),
                              )
                            : CircleAvatar(
                                radius: 20,
                                backgroundColor: MyColors.primary,
                                child: Icon(
                                  Icons.account_circle,
                                  //color: Colors.white,
                                  size: 40,
                                ),
                              ),
                        Container(height: 10),
                        Text(userdata == null ? t.guestuser : userdata.name!,
                            style:
                                TextStyles.title(context).copyWith(fontSize: 17)),
                        Container(height: 3),
                        Container(
                          height: 12,
                        ),
                        Container(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                            child: Text(
                              userdata != null ? t.logout : t.login,
                              style: TextStyle(color: MyColors.primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              if (userdata != null) {
                                showLogoutAlert();
                              } else {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(height: 15),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   /* Container(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PlaylistsScreen.routeName);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.playlist_play,
                                size: 20.0, color: Colors.red[500]),
                            Container(width: 10),
                            Text(t.myplaylists,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[400]),
                          ],
                        ),
                      ),
                    ),*/
                    Container(height: 15),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyLibrary()));
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            const  Icon(Icons.newspaper, size: 20.0, color: MyColors.accentDark),
                            Container(width: 10),
                          Text(t.mylibrary,
                           // Text('My Library',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 15),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerRequest()));
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.mail,
                                size: 20.0, color: MyColors.accentDark),
                           // Container(width: 10),
                            Text(t.prayer_request,
                           // Text('Prayer Request or Testimony',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 14,
                                )).expand(),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                   // Container(height: 15),
                  /*  InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MySubscription()));
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.rate_review,
                                size: 20.0, color: MyColors.accentDark),
                            Container(width: 10),
                            Text(t.mySubscription,
                           // Text('My Subscription',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),*/
                    Container(height: 15),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GivingPartnerShip()));
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.card_giftcard,
                                size: 20.0, color: MyColors.accentDark),
                            Container(width: 10),
                           Text(t.giveandpart,
                           // Text('Giving and PartnerShip',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    /*Container(height: 15),
                    InkWell(
                      onTap: () {
                        if (userdata == null) {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        } else if (userdata.activated == 1) {
                          showDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: new Text(t.updateprofile),
                              content: new Text(t.updateprofilehint),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: new Text(t.cancel),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushNamed(
                                        context, UpdateUserProfile.routeName);
                                  },
                                  child: new Text(t.ok),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.pushNamed(context, SocialActivity.routeName);
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.group, size: 20.0, color: Colors.red[500]),
                            Container(width: 10),
                            SizedBox(
                              width: 180,
                              child: Text(t.gosocial,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyles.subhead(context).copyWith(
                                    fontSize: 15,
                                  )),
                            ),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[400]),
                          ],
                        ),
                      ),
                    ),*/
                    Container(height: 15),
                    Divider(height: 1, color: Colors.grey),
                    Container(height: 8),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: SizedBox(
                                    width: 180, child: Text(t.chooseapplanguage)),
                                content: Container(
                                  height: 250.0,
                                  width: 400.0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: appLanguageData.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      var selected = appLanguageData[AppLanguage
                                              .values[index]]!['name'] ==
                                          language;
                                      return ListTile(
                                        trailing: selected
                                            ? Icon(Icons.check)
                                            : Container(
                                                height: 0,
                                                width: 0,
                                              ),
                                        title: Text(
                                          appLanguageData[AppLanguage
                                              .values[index]]!['name']!,
                                        ),
                                        onTap: () {

                                          appManager.setAppLanguage(index);
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.language, size: 20.0),
                            Container(width: 10),
                            Text(t.selectlanguage,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Text(
                              language,
                              style: TextStyles.subhead(context).copyWith(
                                  color: MyColors.primary, fontSize: 13),
                            ),
                            Container(width: 10)
                          ],
                        ),
                      ),
                    ),
                    Container(height: 8),
                    InkWell(
                      onTap: () async {
                        await Utils.shareApp(Platform.isIOS
                            ? ApiUrl.iosAppShareUrlDesc
                            : ApiUrl.androidAppShareUrlDesc);
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.share,
                                size: 20.0, ),
                            Container(width: 10),
                            Text(t.share,
                            //Text('Share',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),

                    Container(height: 8),
                    InkWell(
                      onTap: () async {
                        if(appManager.userdata!=null){
                          _showDeleteAccountDialog(context);
                        }else{
                          showMessAlert(context, "Account has already been deleted  ");
                        }
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete,
                                size: 20.0, ),
                            Container(width: 10),
                            Text(t.delete_account,
                            //Text('Share',
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    /*InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.color_lens, size: 20.0),
                            Container(width: 10),
                            Text(t.nightmode,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Switch(
                              value: themeSwitch,
                              onChanged: (value) {
                                appManager.setTheme(
                                    value ? AppTheme.Dark : AppTheme.White);
                              },
                              activeColor: MyColors.primary,
                              inactiveThumbColor: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),*/
                    Container(height: 0),
                   /* Visibility(
                      visible: false,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.video_library, size: 20.0),
                              Container(width: 10),
                              SizedBox(
                                width: 180,
                                child: Text(t.autoplayvideos,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.subhead(context).copyWith(
                                      fontSize: 15,
                                    )),
                              ),
                              Spacer(),
                              Switch(
                                value: appManager.autoPlayVideos,
                                onChanged: (value) {
                                  appManager.setAutoPlayVideos(value);
                                },
                                activeColor: MyColors.primary,
                                inactiveThumbColor: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),*/
                    Container(height: 20),
                    Divider(height: 1, color: Colors.grey),
                    Container(height: 20),
                    InkWell(
                      onTap: () async {
                        rateAppNow(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.rate_review,
                                size: 20.0, color: Colors.grey[500]),
                            Container(width: 10),
                            Text(t.rate,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(context, t.about, ApiUrl.ABOUT);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.info, size: 20.0, color: Colors.grey[500]),
                            Container(width: 10),
                            Text(t.about,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(context, t.terms, ApiUrl.TERMS);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.chrome_reader_mode,
                                size: 20.0, color: Colors.grey[500]),
                            Container(width: 10),
                            Text(t.terms,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(context, t.privacy, ApiUrl.PRIVACY);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.label_important,
                                size: 20.0, color: Colors.grey[500]),
                            Container(width: 10),
                            Text(t.privacy,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(height: 20),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: Text(
                    t.follow_us,
                    style: TextStyles.headline(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: "serif",
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
                //color: Colors.white,
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          //openBrowserTab(homeProvider!.data['facebook_page'] as String);
                          openBrowserTab(context, t.facebook, ApiUrl.appFacebookLink);
                        },
                        child: Container(
                          child: Image.asset(Img.get('img_social_facebook.png')),
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Container(width: 10),
                      InkWell(
                        onTap: () {
                          //openBrowserTab(homeProvider!.data['youtube_page'] as String);
                          openBrowserTab(context, t.facebook, ApiUrl.appFacebookLink);
                        },
                        child: Container(
                          child: Image.asset(Img.get('img_social_youtube.png')),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    //  Container(width: 10),
                      /*InkWell(
                        onTap: () {
                         // openBrowserTab(homeProvider!.data['twitter_page'] as String);
                        },
                        child: Container(
                          child: Image.asset(Img.get('img_social_twitter.png')),
                          width: 40,
                          height: 40,
                        ),
                      ),*/
                      Container(width: 10),
                      InkWell(
                        onTap: () {
                         // openBrowserTab(homeProvider!.data['instagram_page'] as String);
                          openBrowserTab(context, t.facebook, ApiUrl.appInstagramLink);
                        },
                        child: Container(
                          child: Image.asset(Img.get('img_social_instagram.png')),
                          width: 40,
                          height: 40,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Text('Powered by IWOMI Technology',
                      style: TextStyles.subhead(context).copyWith(
                        fontSize: 12,
                      )),
                ],
              ),

              Container(height: 15),
              Container(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
