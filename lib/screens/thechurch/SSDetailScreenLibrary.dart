import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:yourdailylight/utils/my_colors.dart';

import '../../../main.dart';
import '../../models/Books.dart';
import '../../providers/NBDataProviders.dart';
import '../../widgets/widget_church.dart';
import '../screen_widget/AddToCartBottomSheet.dart';
import 'EbookMainPage.dart';

class SSDetailScreenLibrary extends StatefulWidget {
  final Books? newsDetails;

  SSDetailScreenLibrary({this.newsDetails});

  @override
  SSDetailScreenLibraryState createState() => SSDetailScreenLibraryState();
}

class SSDetailScreenLibraryState extends State<SSDetailScreenLibrary> {


  @override
  void initState() {
    super.initState();
    //init();
  }

  void init() async {
   // img.insert(0, widget.img.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        /*title: commonCachedNetworkImage(
          ApiUrl.NBProfileImage,
          height: 30,
          width: 30,
          color:  Colors.white,
          fit: BoxFit.cover,
        ),*/
        title: Text('${widget.newsDetails?.b_title}', style: primaryTextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
        actions: const [
         // Icon(Icons.favorite_border, color: context.iconColor, size: 20).paddingOnly(right: 16),
        ],
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // smooth scrolling
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                child: Column(
                  children: [
                    commonCachedNetworkImage(
                      '${widget.newsDetails?.thumbnail}',
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Book Title", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child: Text('${widget.newsDetails?.b_title}', textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle())),
                        Text('Available', textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(color: Colors.green)),
                      ],
                    ),
                    SizedBox(height: 16),
                   /* Text("Author", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 14)),
                    SizedBox(height: 8),
                    Text('${widget.newsDetails?.author}', textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
        */
                    SizedBox(height: 16, width: 16),
                    Text("Description", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                    SizedBox(height: 8),
                    HtmlWidget('${widget.newsDetails?.b_desc}'),
                ]
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(width: 8),
              Expanded(
                child: sSAppButton(
                  color: MyColors.accentDark,
                  context: context,
                  title: 'Read Now',
                  onPressed: () {
                    //EbookMainPage
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        EbookMainPage(widget.newsDetails?.b_title, widget.newsDetails?.downloadUrl)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
