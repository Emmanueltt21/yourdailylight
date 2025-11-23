import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/utils/my_colors.dart';

import '../../i18n/strings.g.dart';
import '../../models/Devotionals.dart';
import '../../models/NBModel.dart';
import '../../models/News.dart';
import '../../providers/AppStateManager.dart';
import '../../utils/ApiUrl.dart';
import '../../utils/langs.dart';
import '../../widgets/widget_church.dart';

class NBNewsDetailsScreen extends StatefulWidget {
  static String tag = '/NBNewsDetailsScreen';

  final News? newsDetails;

  NBNewsDetailsScreen({this.newsDetails});

  @override
  NBNewsDetailsScreenState createState() => NBNewsDetailsScreenState();
}

class NBNewsDetailsScreenState extends State<NBNewsDetailsScreen> {
  bool isFollowing = false;
  bool isBookmark = false;
  bool isLoading = true;
  bool isError = false;
  late AppStateManager appManager;
  DateTime selectedDate = DateTime.now();
  String _selecteddate = "";
  String mlang = "EN";  //default laguage
  String selectedLangOption = "English";
  News mDetails = News();
  List<Map<String, dynamic>> dropdownOptions = [
    {
      'text': 'English',
      'image': 'assets/images/united-kingdom.png',
    },
    {
      'text': 'French',
      'image': 'assets/images/france.png',
    },
    {
      'text': 'Dutch',
      'image': 'assets/images/germany.png',
    },
  ];

  @override
  void initState() {
    super.initState();
   // init();
  }

  init()  {
    mDetails = widget.newsDetails!;
    translateItems();
  }

  manageAppSessionLan(){
    appManager = Provider.of<AppStateManager>(context);
    String language = appLanguageData[AppLanguage.values[appManager.preferredLanguage]]!['name']!;
    String langSmallCode = appLanguageData[AppLanguage.values[appManager.preferredLanguage]]!['value']!;
    print("object language  ----->> $language");
    print("object langSmallCode  ----->> $langSmallCode");
    mlang = langSmallCode.toUpperCase();

  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<void> translateItems() async {
    print("translateItems ---->> ");
    try {

    setState(() {
      isLoading = true;
    });
    mDetails = widget.newsDetails!;

    if(mlang =="EN"){
      setState(() {
        isLoading = false;
        News news = News(
          title: mDetails.title,
          content: mDetails.content,
          category: mDetails.category,
          thumbnail: mDetails.thumbnail,
          mediaType: mDetails.mediaType,
          author: mDetails.author,
          date: mDetails.date,
          dmo: mDetails.dmo,
          uti: mDetails.uti,
          utimo: mDetails.utimo,
          views_count: mDetails.views_count,
        );
        setState(() {
          isLoading = false;
          mDetails  = news;
          print(mDetails);
        });
      });

    } else if(mlang =="DE"){
      setState(() {
        isLoading = false;
        News news = News(
          title: mDetails.german_title,
          content: mDetails.german_content,
          category: mDetails.category,
          thumbnail: mDetails.thumbnail,
          mediaType: mDetails.mediaType,
          author: mDetails.author,
          date: mDetails.date,
          dmo: mDetails.dmo,
          uti: mDetails.uti,
          utimo: mDetails.utimo,
          views_count: mDetails.views_count,
        );
        setState(() {
          isLoading = false;
          mDetails  = news;
          print(mDetails);
        });

      });
    } else if(mlang =="FR"){
      setState(() {
        isLoading = false;
        News news = News(
          title: mDetails.french_title,
          content: mDetails.french_content,
          category: mDetails.category,
          thumbnail: mDetails.thumbnail,
          mediaType: mDetails.mediaType,
          author: mDetails.author,
          date: mDetails.date,
          dmo: mDetails.dmo,
          uti: mDetails.uti,
          utimo: mDetails.utimo,
          views_count: mDetails.views_count,
        );
        setState(() {
          isLoading = false;
          mDetails  = news;
          print(mDetails);
        });

      });
    } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
          print(mDetails);
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
    manageAppSessionLan();
    init();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.accentDark,
        centerTitle: true,
        title: Text(t.details, style: TextStyle(color: MyColors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:  MyColors.white),
          onPressed: () {
            finish(context);
          },
        ),
        actions: [
         /* PopupMenuButton<String>(
              icon: Image.asset("assets/images/translate.png", scale: 2.5,),
              onSelected: (String? newValue) {
                if(newValue!=null){
                  if(newValue=="English"){
                    setState(() {
                      mlang = "EN";
                      selectedLangOption  = newValue;
                      translateItems();
                    });
                  } else if(newValue=="Dutch"){
                    setState(() {
                      mlang = "DE";
                      selectedLangOption  = newValue;
                      translateItems();
                    });
                  } else if(newValue=="French"){
                    setState(() {
                      mlang = "FR";
                      selectedLangOption  = newValue;
                      translateItems();
                    });
                  }
                }
              },
              itemBuilder: (BuildContext context) {
                return dropdownOptions.map((option) {
                  return PopupMenuItem<String>(
                    value: option['text'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          option['image'],
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(option['text']),
                      ],
                    ),
                  );
                }).toList();
              }
          ),*/
        ],
        elevation: 0,
       // backgroundColor: context.cardColor,
      ),
      body: isLoading ? Container(
        height: 600,
        child: const Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      ) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Text('${widget.newsDetails!.cat_id}', style: boldTextStyle(color: MyColors.accentDark)),
            Row(
              children: [
                Text('${mDetails.title}', style: boldTextStyle(size: 20)).expand(flex: 3),
                isBookmark
                    ? IconButton(
                        icon: Icon(Icons.bookmark),
                        onPressed: () {
                          setState(
                            () {
                              isBookmark = isBookmark;
                            },
                          );
                          toasty(context, t.removed_bookmark);
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () {
                          setState(
                            () {
                              isBookmark = isBookmark;
                            },
                          );
                          toasty(context, t.added_bookmark);
                        },
                      ),
              ],
            ),
            16.height,
            commonCacheImageWidget(
              mDetails.thumbnail,
              200,
              width: context.width(),
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            16.height,
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('${mDetails.author}', style: boldTextStyle()),
              subtitle: Text('${mDetails.dmo}', style: secondaryTextStyle()),
            //  subtitle: Text('${mDetails.date}', style: secondaryTextStyle()),
             // subtitle: Text('${mDetails.date}', style: secondaryTextStyle()),
              leading: CircleAvatar(backgroundImage: AssetImage(ApiUrl.NBProfileImage)),
              trailing: AppButton(
                elevation: 0,
                text: isFollowing ? t.likes : t.likes,
                onTap: () {
                  setState(
                    () {
                      isFollowing = !isFollowing;
                    },
                  );
                },
                color: isFollowing ? grey.withOpacity(0.2) : MyColors.accentDark,
                textColor: isFollowing ? grey : white,
              ).cornerRadiusWithClipRRect(30),
            ),
            16.height,
           // Text('${widget.newsDetails!.content}', style: primaryTextStyle(), textAlign: TextAlign.justify),
            HtmlWidget('${mDetails.content}',
             // webView: true,
            ),
            16.height,
        /*    nbAppButtonWidget(
              context,
              'Comment',
              () {
                NBCommentScreen(widget.newsDetails).launch(context);
              },
            ),*/
            16.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
