import 'package:flutter/material.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';
import '../i18n/strings.g.dart';

class AppTermsScreen extends StatelessWidget {
  static const String routeName = "/appterms";

  const AppTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
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
                "Privacy Policy",
                style: TextStyles.headline(context).copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Effective Date: 10 May 2025",
                style: TextStyles.subhead(context).copyWith(
                  fontSize: 14,
                  color: MyColors.grey_60,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 24),
              
              // Introduction
              Text(
                "Your privacy is important to us. This Privacy Policy describes how Your Daily Light (\"we\", \"our\", or \"us\") collects, uses, and protects your information when you use our devotional study app, available on mobile devices.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 1
              _buildSectionTitle("1. Information We Collect", context),
              SizedBox(height: 12),
              Text(
                "We collect minimal information to provide and improve your experience with the app. This includes:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              
              _buildSubsectionTitle("a. Information You Provide", context),
              SizedBox(height: 8),
              _buildBulletPoint("User Input: When submitting a prayer request, testimony, or message, you may voluntarily provide personal details such as your name, email address, or prayer content.", context),
              SizedBox(height: 8),
              _buildBulletPoint("Feedback: If you contact us directly (e.g., via email or the app), we collect the information you provide.", context),
              SizedBox(height: 16),

              _buildSubsectionTitle("b. Automatically Collected Information", context),
              SizedBox(height: 8),
              _buildBulletPoint("Device Information: We may collect information such as device type, operating system, and app version for analytics and support.", context),
              SizedBox(height: 8),
              _buildBulletPoint("Usage Data: We collect anonymous usage statistics (e.g., how often the app is used, which features are accessed) through analytics services to help improve the app.", context),
              SizedBox(height: 32),

              // Section 2
              _buildSectionTitle("2. How We Use Your Information", context),
              SizedBox(height: 12),
              Text(
                "We use your information for the following purposes:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildBulletPoint("To provide and maintain the app's functionality", context),
              SizedBox(height: 8),
              _buildBulletPoint("To respond to your requests, feedback, or inquiries", context),
              SizedBox(height: 8),
              _buildBulletPoint("To improve the user experience and add new features", context),
              SizedBox(height: 8),
              _buildBulletPoint("To send inspirational messages or notifications (if you opt in)", context),
              SizedBox(height: 8),
              _buildBulletPoint("To comply with legal obligations", context),
              SizedBox(height: 32),

              // Section 3
              _buildSectionTitle("3. Data Sharing and Disclosure", context),
              SizedBox(height: 12),
              Text(
                "We do not sell, rent, or share your personal information with third parties for marketing purposes.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "We may share data:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildBulletPoint("With service providers who help us operate the app (e.g., analytics or cloud storage providers)", context),
              SizedBox(height: 8),
              _buildBulletPoint("If required by law or in response to valid legal processes", context),
              SizedBox(height: 8),
              _buildBulletPoint("To protect the rights, safety, or security of our users or the public", context),
              SizedBox(height: 32),

              // Section 4
              _buildSectionTitle("4. Your Choices", context),
              SizedBox(height: 16),
              _buildBulletPoint("You can opt out of push notifications at any time via your device settings.", context),
              SizedBox(height: 8),
              _buildBulletPoint("You may choose not to submit personal information (e.g., prayer requests), but certain features may not be available.", context),
              SizedBox(height: 8),
              _buildBulletPoint("You may request to delete your data by contacting us at: support@yourdailylight.org", context),
              SizedBox(height: 32),

              // Section 5
              _buildSectionTitle("5. Data Security", context),
              SizedBox(height: 12),
              Text(
                "We take reasonable steps to protect your data from unauthorized access, disclosure, or misuse. However, no method of transmission over the internet is completely secure.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 6
              _buildSectionTitle("6. Children's Privacy", context),
              SizedBox(height: 12),
              Text(
                "Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children. If you believe a child has provided us with personal data, please contact us to remove it.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 7
              _buildSectionTitle("7. Changes to This Policy", context),
              SizedBox(height: 12),
              Text(
                "We may update this Privacy Policy from time to time. When we do, we will notify users by updating the date at the top of this policy and, if appropriate, within the app.",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),

              // Section 8
              _buildSectionTitle("8. Contact Us", context),
              SizedBox(height: 12),
              Text(
                "If you have any questions or concerns about this Privacy Policy or our practices, you can contact us at:",
                style: TextStyles.medium(context).copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              _buildContactInfo("Email: support@yourdailylight.org", context),
              SizedBox(height: 8),
              _buildContactInfo("Website: https://yourdailylight.org", context),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyles.headline(context).copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
      ),
    );
  }

  Widget _buildSubsectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyles.subhead(context).copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: MyColors.primaryDark,
      ),
    );
  }

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, right: 12),
          width: 4,
          height: 4,
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
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(String text, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, right: 12),
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: MyColors.accent,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyles.medium(context).copyWith(
              fontSize: 16,
              height: 1.5,
              color: MyColors.primaryDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}