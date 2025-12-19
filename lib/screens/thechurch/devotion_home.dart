import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourdailylight/providers/AppStateManager.dart';
import 'package:yourdailylight/utils/my_colors.dart';
import '../../utils/img.dart';
import '../../utils/ApiUrl.dart';
import '../../models/Devotionals.dart';
import '../../utils/TextStyles.dart';
import '../../utils/langs.dart';
import '../NoitemScreen.dart';
import 'package:intl/intl.dart';
import '../../i18n/strings.g.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;


class DevotionHome extends StatefulWidget {
  static const routeName = "/devotionhome";
  DevotionHome();

  @override
  State<DevotionHome> createState() => _DevotionHomeState();
}

class _DevotionHomeState extends State<DevotionHome> {
  late AppStateManager appManager;

  DateTime selectedDate = DateTime.now();
  String _selecteddate = "";
  String mlang = "EN";  //default laguage
  //String selectedLangOption = "English";
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



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
        print(_selecteddate);
      });
    } else {
      print("picked null" + picked.toString());
    }
  }

  @override
  void initState() {
    _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
    super.initState();
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
  Widget build(BuildContext context) {
    manageAppSessionLan();
    return Scaffold(
      appBar: AppBar(
        title: Text( t.devotionals, style: const TextStyle(color: Colors.white),),
        leading: const Icon(
          Icons.bookmark_added_sharp,
          color: Colors.white,
        ),
        actions: [


          /*DropdownButton<String>(
            items: <String>['EN', 'DE', 'FR'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.black),),
              );
            }).toList(),
            onChanged: (value) {
              if(value=="EN"){
                setState(() {
                  mlang = "EN";
                  _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              } else if(value=="DE"){
                setState(() {
                  mlang = "DE";
                  _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              } else if(value=="FR"){
                setState(() {
                  mlang = "FR";
                  _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              }
            },
          ),*/
          SizedBox(
            height: 38,
            width: 38,
            child: InkWell(
              highlightColor: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              onTap: () {
                setState(() {
                  selectedDate = selectedDate.subtract(new Duration(days: 1));
                  _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              },
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_left,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.calendar_today,
                    size: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Text(
                    DateFormat('d MMM').format(selectedDate),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 38,
            width: 38,
            child: InkWell(
              highlightColor: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              onTap: () {
                setState(() {
                  selectedDate = selectedDate.add(new Duration(days: 1));
                  _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              },
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right,
                ),
              ),
            ),
          ),

          /* PopupMenuButton<String>(
            icon: Image.asset("assets/images/translate.png", scale: 3,),
              onSelected: (String? newValue) {
                if(newValue!=null){
                  if(newValue=="English"){
                    setState(() {
                      mlang = "EN";
                      selectedLangOption  = newValue;
                      _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                    });
                  } else if(newValue=="Dutch"){
                    setState(() {
                      mlang = "DE";
                      selectedLangOption  = newValue;
                      _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
                    });
                  } else if(newValue=="French"){
                    setState(() {
                      mlang = "FR";
                      selectedLangOption  = newValue;
                      _selecteddate = DateFormat('yyyy-MM-dd').format(selectedDate);
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
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          child: DevotionalsPageBody(
            key: UniqueKey(),
            date: _selecteddate,
            dateTime: selectedDate,
            lang: mlang,
          ),
        ),
      ),
    );
  }
}

class DevotionalsPageBody extends StatefulWidget {
  const DevotionalsPageBody({Key? key, this.date, this.dateTime,  this.lang})
      : super(key: key);
  final String? date;
  final DateTime? dateTime;
  final String? lang;


  @override
  _BranchesPageBodyState createState() => _BranchesPageBodyState();
}

class _BranchesPageBodyState extends State<DevotionalsPageBody> {
  bool isLoading = true;
  bool isError = false;
  Devotionals? devotionals;


  Future<void> loadItems() async {
    print(widget.date);
    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();

      final response = await dio.post(
        ApiUrl.DEVOTIONALS,
        data: jsonEncode({
          "data": {"date": widget.date}
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic res = jsonDecode(response.data);
        print(res);
        setState(() {
          isLoading = false;
          devotionals = Devotionals.fromJson(res['devotional']);
          print(widget.date);
          print(devotionals);
        });
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
          print(devotionals);
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

  Future<void> loadItemsTranslated() async {
    print(widget.date);
    print("loadItemsTranslated ---->> ");

    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();

      final response = await dio.post(
        ApiUrl.DEVOTIONALS,
        data: jsonEncode({
          "data": {"date": widget.date}
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic res = jsonDecode(response.data);
        print(res);
        devotionals = Devotionals.fromJson(res['devotional']);
        print(widget.date);
        print(devotionals);
        translateItems();

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
          print(devotionals);
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

  Future<void> translateItems() async {
    try {

      if(widget.lang =="EN"){
        setState(() {
          isLoading = false;
          devotionals  = devotionals;
        });

      } else if(widget.lang =="DE"){
        setState(() {
          isLoading = false;
          Devotionals devT = Devotionals(
              title: devotionals?.german_title,
              content:  devotionals?.german_content,
              biblereading:  devotionals?.german_bible_reading,
              confession: devotionals?.german_confession,
              studies: devotionals?.german_studies,
              thumbnail: devotionals?.thumbnail,
              author: devotionals?.author
          );
          devotionals  = devT;

        });
      } else if(widget.lang =="FR"){
        setState(() {
          isLoading = false;
          print(' translated French ----->> ${devotionals?.french_content}');

          Devotionals devT = Devotionals(
              title: devotionals?.french_title,
              biblereading: devotionals?.french_bible_reading,
              content: devotionals?.french_content,
              studies: devotionals?.french_studies,
              confession: devotionals?.french_confession,
              thumbnail: devotionals?.thumbnail,
              author: devotionals?.author
          );
          devotionals  = devT;

        });
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
          print(devotionals);
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
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      var myAppLang = AppStateManager().getMyAppLaangue();

      if(widget.lang =="EN"){
        loadItems();
      }else if(widget.lang =="FR"){
        loadItemsTranslated();
      } else if(widget.lang =="DE"){
        loadItemsTranslated();
      }

    });
    super.initState();
  }

  String removeGtxTransDiv(String htmlContent) {
    debugPrint('DATA----->> $htmlContent');
    dom.Document document = html_parser.parse(htmlContent);
    dom.Element? divElement = document.querySelector('#gtx-trans');

    if (divElement != null) {
      divElement.remove();
    }

    return document.body!.outerHtml;
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 600,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      );
    } else if (isError || devotionals == null) {
      return SizedBox(
        height: 600,
        child: Center(
          child: NoitemScreen(
              title: t.oops,
              message: t.dataloaderror,
              onClick: () {
                loadItems();
              }),
        ),
      );
    } else
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(devotionals!.title?? '',
                textAlign: TextAlign.center,
                style: TextStyles.headline(context)
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
            Container(height: 5),
            Text(devotionals!.author?? '',
                textAlign: TextAlign.start,
                style: TextStyles.subhead(context)
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87)),
            Divider(height: 5),
            Text(DateFormat('EEE, MMM d, yyyy').format(widget.dateTime!),
                textAlign: TextAlign.justify,
                style: TextStyles.subhead(context).copyWith(fontSize: 16, color: Colors.black87)),
            Container(height: 20),
            Container(
              height: 200,
              //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: CachedNetworkImage(
                imageUrl:  ApiUrl.BASEURL+ 'uploads/thumbnails/'+ devotionals!.thumbnail!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black12, BlendMode.darken)),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CupertinoActivityIndicator()),
                errorWidget: (context, url, error) => Center(
                    child: Image.asset(
                      Img.get('devotionals.jpg'),
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      //color: Colors.black26,
                    )),
              ),
            ),
            Container(height: 20),
            HtmlWidget(
              devotionals!.biblereading??'',
              //webView: false,
              textStyle: TextStyles.medium(context).copyWith(fontSize: 17, color: Colors.black),
              onTapUrl: (url) {
                print("Clicked URL: $url");
                // Open the link in browser
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );

                return true; // IMPORTANT: must return true
              },
            ),
            Container(height: 20),
            HtmlWidget(
              removeGtxTransDiv(devotionals!.content??''),
              // webView: false,
              textStyle: TextStyles.medium(context).copyWith(fontSize: 20, color: Colors.black),
              onTapUrl: (url) {
                print("Clicked URL: $url");
                // Open the link in browser
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );

                return true; // IMPORTANT: must return true
              },
            ),
            Container(height: 20),
            HtmlWidget(
              removeGtxTransDiv(devotionals!.confession??''),
              //webView: false,
              textStyle: TextStyles.medium(context).copyWith(fontSize: 20, color: Colors.black),
              onTapUrl: (url) {
                print("Clicked URL: $url");
                // Open the link in browser
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );

                return true; // IMPORTANT: must return true
              },
            ),
            Container(height: 20),
            HtmlWidget(
              removeGtxTransDiv(devotionals!.studies??''),
              onTapUrl: (url) {
                print("Clicked URL: $url");
                // Open the link in browser
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );

                return true; // IMPORTANT: must return true
              },
              // webView: false,
              textStyle: TextStyles.medium(context).copyWith(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      );
  }
}


