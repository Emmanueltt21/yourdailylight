import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';
import '../i18n/strings.g.dart';
import '../widgets/widget_church.dart';

class AboutUsScreen extends StatelessWidget {
  static const String routeName = "/aboutus";

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
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
              SizedBox(height: 16),

              // Introduction
              Text(
                " Your Daily Light is a devotional with goal to bring you illumination through the word of God for a victorious and a fulfilling life in Christ. This devotional is a ministry by Lighthouse Global Missions, the umbrella organization through which we are fulfilling the call from the Lord to bring His illuminating word and transforming power to our world. You can learn more at ",
                style:  TextStyles.medium(context).copyWith(fontSize: 18, color: Colors.black87),
              ),
              _buildSectionLink("www.lighthouseglobalmissions.org.", context),
              SizedBox(height: 32),


              // Introduction
              Text(
                "In a fast-paced world filled with distractions and uncertainty, staying grounded in the Word of God is essential for anyone seeking a fulfilling and victorious life in Christ. Your Daily Light is more than just a devotional app—it's a spiritual companion designed to bring you daily inspiration, encouragement, and transformation through the Word of God. Whether you're on your way to work, relaxing at home, or seeking direction during challenging times, Your Daily Light delivers God's truth to you in a way that is both accessible and profound.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 1: Daily Devotionals
              _buildSectionTitle("Daily Devotionals Rooted in God's Word", context),
              SizedBox(height: 12),
              Text(
                "At the heart of Your Daily Light is the commitment to provide daily devotional messages that illuminate your spiritual path. Each day, you'll receive a fresh word from the Scriptures—short, yet powerful messages that speak directly to the realities of life. These devotions are crafted to be concise, clear, and impactful, offering spiritual insight in just a few minutes of your day. The simplicity and depth of each message ensure that believers at every stage of their faith journey can connect with God's truth in a meaningful way.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Whether you're just beginning your walk with Christ or you're a seasoned believer, the devotionals in Your Daily Light help you grow daily in the knowledge of the Word, drawing you closer to God and strengthening your faith.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 2: Text and Audio Formats
              _buildSectionTitle("Available in Text and Audio Formats", context),
              SizedBox(height: 12),
              Text(
                "We understand that people engage with content in different ways. That's why Your Daily Light offers devotionals in both text and audio formats. For those who prefer reading in quiet moments of reflection, the text format provides a smooth and easy-to-read interface. For those constantly on the move—during commutes, workouts, or daily chores—the audio format brings the Word of God alive through voice, allowing you to meditate on the Scriptures wherever you are.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "These audio devotionals are not just narrated—they are carefully recorded to maintain the meditative and prayerful tone necessary to fully experience the message. It's like having a pastor or spiritual mentor speak life into you every single day.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 3: Simplicity
              _buildSectionTitle("God's Word in Simplicity for Daily Living", context),
              SizedBox(height: 12),
              Text(
                "Your Daily Light is based on a simple but powerful philosophy: the Word of God should be understood and lived out, not just read. The devotionals are written in plain, relatable language that connects with real-life experiences, struggles, and victories. You won't find theological jargon or complicated commentaries here—just the pure Word of God, delivered with clarity and compassion.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Every message is designed to reveal biblical truths in a way that's easy to grasp and apply. Whether the topic is love, patience, faith, forgiveness, or purpose, you will find each devotional a stepping stone toward a life that reflects the character of Christ.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 4: Guidance and Transformation
              _buildSectionTitle("Guidance, Inspiration, and Transformation", context),
              SizedBox(height: 12),
              Text(
                "Life can sometimes feel like a maze—with its trials, decisions, and emotional ups and downs. In those moments, having a consistent spiritual guide can make all the difference. Your Daily Light offers more than just encouragement—it offers divine guidance and transformation.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Each devotional is a spark of divine light that helps you:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              _buildBulletPoint("Stay spiritually aligned with God's will", context),
              SizedBox(height: 8),
              _buildBulletPoint("Make decisions rooted in biblical wisdom", context),
              SizedBox(height: 8),
              _buildBulletPoint("Be reminded of God's promises", context),
              SizedBox(height: 8),
              _buildBulletPoint("Grow in spiritual discipline and understanding", context),
              SizedBox(height: 16),
              Text(
                "Whether you're seeking clarity about your next step in life, battling discouragement, or just need a reminder of God's love, Your Daily Light brings words in season that address your specific needs.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 5: Testimonies
              _buildSectionTitle("Global Testimonies to Uplift Your Faith", context),
              SizedBox(height: 12),
              Text(
                "Faith isn't just about what we believe—it's also about the stories we live and share. In addition to devotionals, Your Daily Light features a Testimonies section, where users from around the world share how God's Word has transformed their lives. These testimonies offer real-life evidence of the power of the gospel, encouraging you to trust God in every area of your life.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "You'll read or hear about people who have experienced healing, breakthrough, restoration, and spiritual growth—all through consistent engagement with God's Word. These testimonies serve not only as encouragement but also as a reminder that God is still at work today, doing great and mighty things in the lives of His people.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 6: Books and Resources
              _buildSectionTitle("Books and Resources from Photizo Publishers", context),
              SizedBox(height: 12),
              Text(
                "To further deepen your spiritual experience, the app includes a growing library of Christian books published by Photizo Publishers. These books cover a range of themes—devotional, doctrinal, inspirational, and practical Christian living—and are available right within the app.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Whether you want to embark on a deeper Bible study, learn how to pray more effectively, or gain a better understanding of who you are in Christ, you'll find resources to equip and edify you. These books are written by seasoned ministers and spiritual leaders who are passionate about raising disciples and spreading the message of Christ.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 7: App Features
              _buildSectionTitle("A Clean, Easy-to-Use Spiritual Tool", context),
              SizedBox(height: 12),
              Text(
                "The interface of Your Daily Light is designed to be clean, elegant, and easy to navigate. You won't be distracted by ads or clutter. Instead, you'll find a peaceful environment that reflects the serenity and sacredness of the Word of God. The app allows you to:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildBulletPoint("Bookmark your favorite devotionals", context),
              SizedBox(height: 8),
              _buildBulletPoint("Share daily messages with friends and family", context),
              SizedBox(height: 8),
              _buildBulletPoint("Submit prayer requests and testimonies", context),
              SizedBox(height: 8),
              _buildBulletPoint("Set reminders for your devotional time", context),
              SizedBox(height: 8),
              _buildBulletPoint("Listen offline and on the go", context),
              SizedBox(height: 16),
              Text(
                "Every aspect of the app is thoughtfully built to make your spiritual journey smoother, more intentional, and more joyful.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 8: Start and End Your Day
              _buildSectionTitle("Start and End Your Day with Light", context),
              SizedBox(height: 12),
              Text(
                "With Your Daily Light, you can begin your morning with Scripture that sets the tone for your day or wind down in the evening with a message that brings peace and reflection. The consistency of daily devotion builds a habit of intimacy with God and keeps your spirit anchored regardless of life's storms.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 9: Conclusion
              _buildSectionTitle("Conclusion", context),
              SizedBox(height: 12),
              Text(
                "Your Daily Light is more than an app—it's a lifeline to the heart of God. It's a daily invitation to receive wisdom, grow in grace, and walk in victory through the power of God's Word. With easy-to-understand devotionals, inspiring audio messages, real testimonies, and life-changing Christian books, this app equips you to live the fulfilling life that God has called you to.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "No matter where you are on your spiritual journey, let Your Daily Light be your companion for daily transformation.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Download today and start each day with divine light, clarity, and purpose.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.6,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLink(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyles.subhead(context).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
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