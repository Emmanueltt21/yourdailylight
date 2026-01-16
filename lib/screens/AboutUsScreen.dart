import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';
import '../i18n/strings.g.dart';
import '../widgets/widget_church.dart';
import 'BrowserTabScreen.dart';

class AboutUsScreen extends StatelessWidget {
  static const String routeName = "/aboutus";

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.about,
          style: TextStyles.title(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: MyColors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Your Daily Light",
                style: TextStyles.headline(context).copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Devotional App for Daily Illumination and Spiritual Growth",
                style: TextStyles.subhead(context).copyWith(
                  fontSize: 16,
                  color: MyColors.grey_60,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 24),

              commonCacheImageWidget(
                'assets/images/about_us_image.jpg',
                200,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(16),
              SizedBox(height: 36),
              // Introduction
              Text(t.aboutcontent_para_1,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ), // Introduction
              SizedBox(height: 8),
              Text(t.aboutcontent_para_2,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(t.aboutcontent_para_3,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(t.aboutcontent_para_4,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(t.aboutcontent_para_5,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(t.aboutcontent_para_6a,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              _buildSectionLink(ApiUrl.lighthouseWebAddress!, context),
              Text(t.aboutcontent_para_6b,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              _buildSectionLink(ApiUrl.lighthouseMissionAdd!, context),
              SizedBox(height: 8),
              Text(t.aboutcontent_para_7a,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              _buildSectionLink(ApiUrl.missionNewsletter!, context),
              Text(t.aboutcontent_para_7b,
                style:  TextStyles.medium(context).copyWith(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLink(String title, BuildContext context) {
    return GestureDetector(
      onTap: (){
        openBrowserTab(
          context,
          t.appname,
         title,
        );
      },
      child: Text(
        title,
        style: TextStyles.subhead(context).copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyles.subhead(context).copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
      ),
    );
  }

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, right: 12),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: MyColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyles.medium(context).copyWith(
              fontSize: 16,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}