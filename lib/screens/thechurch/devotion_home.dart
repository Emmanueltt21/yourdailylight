import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;

import 'package:yourdailylight/providers/AppStateManager.dart';
import '../../utils/img.dart';
import '../../utils/ApiUrl.dart';
import '../../models/Devotionals.dart';
import '../../utils/TextStyles.dart';
import '../../utils/langs.dart';
import '../../utils/utils.dart';
import '../NoitemScreen.dart';
import '../../i18n/strings.g.dart';

class DevotionHome extends StatefulWidget {
  static const routeName = "/devotionhome";

  const DevotionHome({Key? key}) : super(key: key);

  @override
  State<DevotionHome> createState() => _DevotionHomeState();
}

class _DevotionHomeState extends State<DevotionHome> {
  DateTime _selectedDate = DateTime.now();
  String _mLang = "EN";

  String get _formattedDate => DateFormat('yyyy-MM-dd').format(_selectedDate);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _manageAppSessionLan() {
    final appManager = Provider.of<AppStateManager>(context, listen: false);
    final langSmallCode = appLanguageData[AppLanguage.values[appManager.preferredLanguage]]!['value']!;
    _mLang = langSmallCode.toUpperCase();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _manageAppSessionLan();
  }

  void _shiftDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.devotionals, style: const TextStyle(color: Colors.white)),
       // leading: const Icon(Icons.bookmark_added_sharp, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => _shiftDate(-1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.calendar_today, size: 18),
                ),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Text(
                    DateFormat('d MMM').format(_selectedDate),
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
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () => _shiftDate(1),
          ),
          Builder(
            builder: (BuildContext iconContext) {
              return IconButton(
                icon: const Icon(Icons.share, size: 28),
                onPressed: () async {
                  // Share devotional title and link
                  final String shareText = "Your Daily Light: Today's Devotional\n${ApiUrl.DailyDevotionalLink}";
                  await Utils.shareApp(shareText, context: iconContext);
                },
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          child: DevotionalsPageBody(
            key: ValueKey("$_formattedDate-$_mLang"), // Forces rebuild on date/lang change
            date: _formattedDate,
            dateTime: _selectedDate,
            lang: _mLang,
          ),
        ),
      ),
    );
  }
}

class DevotionalsPageBody extends StatefulWidget {
  final String date;
  final DateTime dateTime;
  final String lang;

  const DevotionalsPageBody({
    Key? key,
    required this.date,
    required this.dateTime,
    required this.lang,
  }) : super(key: key);

  @override
  _DevotionalsPageBodyState createState() => _DevotionalsPageBodyState();
}

class _DevotionalsPageBodyState extends State<DevotionalsPageBody> {
  bool isLoading = true;
  bool isError = false;
  Devotionals? devotionals;

  @override
  void initState() {
    super.initState();
    _fetchDevotional();
  }

  Future<void> _fetchDevotional() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ));

      final payload = {
        "data": {"date": widget.date}
      };

      final response = await dio.post(ApiUrl.DEVOTIONALS, data: jsonEncode(payload));

      if (response.statusCode == 200) {
        final res = response.data is String ? jsonDecode(response.data) : response.data;

        if (res['devotional'] != null) {
          Devotionals rawDevotional = Devotionals.fromJson(res['devotional']);
          Devotionals processed = _processForLanguageAndClean(rawDevotional, widget.lang);

          if (!mounted) return;
          setState(() {
            devotionals = processed;
            isLoading = false;
          });
        } else {
          throw Exception("Devotional data is null");
        }
      } else {
        throw Exception("Invalid status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Devotional Fetch Error: $e");
      if (!mounted) return;
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  /// Handles both translation selection and HTML cleanup once during fetch
  Devotionals _processForLanguageAndClean(Devotionals data, String lang) {
    String? chosenTitle;
    String? chosenContent;
    String? chosenBibleReading;
    String? chosenConfession;
    String? chosenStudies;

    switch (lang) {
      case "DE":
        chosenTitle = data.german_title;
        chosenContent = data.german_content;
        chosenBibleReading = data.german_bible_reading;
        chosenConfession = data.german_confession;
        chosenStudies = data.german_studies;
        break;
      case "FR":
        chosenTitle = data.french_title;
        chosenContent = data.french_content;
        chosenBibleReading = data.french_bible_reading;
        chosenConfession = data.french_confession;
        chosenStudies = data.french_studies;
        break;
      case "IT":
        chosenTitle = data.italian_title;
        chosenContent = data.italian_content;
        chosenBibleReading = data.italian_bible_reading;
        chosenConfession = data.italian_confession;
        chosenStudies = data.italian_studies;
        break;
      case "ES":
        chosenTitle = data.spanish_title;
        chosenContent = data.spanish_content;
        chosenBibleReading = data.spanish_bible_reading;
        chosenConfession = data.spanish_confession;
        chosenStudies = data.spanish_studies;
        break;
      case "HI":
        chosenTitle = data.hindi_title;
        chosenContent = data.hindi_content;
        chosenBibleReading = data.hindi_bible_reading;
        chosenConfession = data.hindi_confession;
        chosenStudies = data.hindi_studies;
        break;
      case "RU":
        chosenTitle = data.russian_title;
        chosenContent = data.russian_content;
        chosenBibleReading = data.russian_bible_reading;
        chosenConfession = data.russian_confession;
        chosenStudies = data.russian_studies;
        break;
      case "PT":
        chosenTitle = data.portuguese_title;
        chosenContent = data.portuguese_content;
        chosenBibleReading = data.portuguese_bible_reading;
        chosenConfession = data.portuguese_confession;
        chosenStudies = data.portuguese_studies;
        break;
      case "ZH":
        chosenTitle = data.mandarin_title;
        chosenContent = data.mandarin_content;
        chosenBibleReading = data.mandarin_bible_reading;
        chosenConfession = data.mandarin_confession;
        chosenStudies = data.mandarin_studies;
        break;
      default: // EN
        chosenTitle = data.title;
        chosenContent = data.content;
        chosenBibleReading = data.biblereading;
        chosenConfession = data.confession;
        chosenStudies = data.studies;
    }

    final effectiveTitle = (chosenTitle != null && chosenTitle.trim().isNotEmpty)
        ? chosenTitle
        : data.title;
    final effectiveContent = (chosenContent != null && chosenContent.trim().isNotEmpty)
        ? chosenContent
        : data.content;
    final effectiveBibleReading = (chosenBibleReading != null && chosenBibleReading.trim().isNotEmpty)
        ? chosenBibleReading
        : data.biblereading;
    final effectiveConfession = (chosenConfession != null && chosenConfession.trim().isNotEmpty)
        ? chosenConfession
        : data.confession;
    final effectiveStudies = (chosenStudies != null && chosenStudies.trim().isNotEmpty)
        ? chosenStudies
        : data.studies;

    return Devotionals(
      title: effectiveTitle,
      author: data.author,
      thumbnail: data.thumbnail,
      biblereading: _cleanHtml(effectiveBibleReading),
      content: _cleanHtml(effectiveContent),
      confession: _cleanHtml(effectiveConfession),
      studies: _cleanHtml(effectiveStudies),
    );
  }

  String? _cleanHtml(String? htmlContent) {
    if (htmlContent == null || htmlContent.isEmpty) return htmlContent;
    try {
      dom.Document document = html_parser.parse(htmlContent);
      document.querySelector('#gtx-trans')?.remove();
      return document.body?.outerHtml ?? htmlContent;
    } catch (e) {
      debugPrint("HTML Parse Error: $e");
      return htmlContent;
    }
  }

  Future<void> _safeLaunchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  Widget _buildHtmlSection(String? content, {double fontSize = 20}) {
    if (content == null || content.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: HtmlWidget(
        content,
        textStyle: TextStyles.medium(context).copyWith(fontSize: fontSize, color: Colors.black),
        onTapUrl: (url) {
          _safeLaunchUrl(url);
          return true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 600,
        child: Center(child: CupertinoActivityIndicator(radius: 20)),
      );
    }

    if (isError || devotionals == null) {
      return SizedBox(
        height: 600,
        child: Center(
          child: NoitemScreen(
            title: t.oops,
            message: t.dataloaderror,
            onClick: _fetchDevotional,
          ),
        ),
      );
    }

    // Ensure URL formatting doesn't double-slash or break
    final String imageUrl = "${ApiUrl.BASEURL.replaceAll(RegExp(r'/$'), '')}/uploads/thumbnails/${devotionals!.thumbnail ?? ''}";

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            devotionals!.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyles.headline(context).copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            devotionals!.author ?? '',
            textAlign: TextAlign.start,
            style: TextStyles.subhead(context).copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87),
          ),
          const Divider(height: 5),
          Text(
            DateFormat('EEE, MMM d, yyyy').format(widget.dateTime),
            textAlign: TextAlign.justify,
            style: TextStyles.subhead(context).copyWith(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                Img.get('devotionals.jpg'),
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildHtmlSection(devotionals!.biblereading, fontSize: 17),
          _buildHtmlSection(devotionals!.content),
          _buildHtmlSection(devotionals!.confession),
          _buildHtmlSection(devotionals!.studies),
        ],
      ),
    );
  }
}