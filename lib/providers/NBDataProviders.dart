

import '../models/NBModel.dart';
import '../screens/thechurch/bookstore_home.dart';
import '../utils/ApiUrl.dart';

String details = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.\n\n'
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
    ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
    'software like Aldus PageMaker including versions of Lorem Ipsum.';


    String NBNewsImage1 = 'assets/images/bible.jpg';
    String NBNewsImage2 = 'assets/images/event.jpg';
    String NBNewsImage3 = 'assets/images/devotionals.jpg';
    String NBNewsImage4 = 'assets/images/sermons.jpg';
    String NBNewsImage5 = 'assets/images/messages.jpg';

    String bookCover1 = 'assets/images/faithcover.png';
    String bookCover2 = 'assets/images/heavencover.png';

List<NBBannerItemModel> nbGetBannerItems() {
  List<NBBannerItemModel> bannerList = [];
  bannerList.add(NBBannerItemModel(image: NBNewsImage1));
  bannerList.add(NBBannerItemModel(image: NBNewsImage4));
  bannerList.add(NBBannerItemModel(image: NBNewsImage3));
  return bannerList;
}



List<NBNewsDetailsModel> nbGetNewsDetails() {
  List<NBNewsDetailsModel> newsDetailsList = [];
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Grace',
    title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
    date: '20 jan 2021',
    image: NBNewsImage1,
    details: details,
    time: '40:18',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Faith',
    title: 'Amazfit T-Rex Pro review: This fitness watch is in a league of its own',
    date: '20 jan 2021',
    image: NBNewsImage2,
    details: details,
    time: '1:40:18',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Mercy',
    title: 'Amazfit T-Rex Pro review: This fitness watch is in a league of its own',
    date: '20 jan 2021',
    image: NBNewsImage3,
    details: details,
    time: '40:00',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Sanctification',
    title: 'NHL roundup: Mika Zibanejad\'s record night powers Rangers',
    date: '20 jan 2021',
    image: NBNewsImage4,
    details: details,
    time: '15:00',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Grace',
    title: 'Spring training roundup: Braves get past Rays',
    date: '20 Nov 2020',
    image: NBNewsImage5,
    details: details,
    time: '1:9:30',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Youth',
    title: 'Micromax In 1 review: Clean software gives this budget smartphone an edge',
    date: '20 Nov 2020',
    image: NBNewsImage3,
    details: details,
    time: '1:9:30',
    isBookmark: true,
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Gifts',
    title: 'Micromax In 1 review: Clean software gives this budget smartphone an edge',
    date: '20 Nov 2020',
    image: NBNewsImage1,
    details: details,
    time: '40:00',
  ));
  newsDetailsList.add(NBNewsDetailsModel(
    categoryName: 'Believe',
    title: 'Spring training roundup: Braves get past Rays',
    date: '20 Nov 2020',
    image: NBNewsImage1,
    details: details,
    time: '20:00',
  ));
  return newsDetailsList;
}





List<NBNotificationItemModel> nbGetNotificationItems() {
  List<NBNotificationItemModel> notificationList = [];
  notificationList.add(NBNotificationItemModel('App Notification', true));
  notificationList.add(NBNotificationItemModel('Recommended Article', true));
  notificationList.add(NBNotificationItemModel('Promotion', false));
  notificationList.add(NBNotificationItemModel('Latest News', true));
  return notificationList;
}

/*List<NBCategoryItemModel> nbGetCategoryItems() {
  List<NBCategoryItemModel> categoryList = [];
  categoryList.add(NBCategoryItemModel(NBTechnologyCategory, 'Technology'));
  categoryList.add(NBCategoryItemModel(NBFashionCategory, 'Fashion'));
  categoryList.add(NBCategoryItemModel(NBSportsCategory, 'Sports'));
  categoryList.add(NBCategoryItemModel(NBScienceCategory, 'Science'));
  return categoryList;
}*/

List<NBMembershipPlanItemModel> nbGetMembershipPlanItems() {
  List<NBMembershipPlanItemModel> planList = [];
  planList.add(NBMembershipPlanItemModel('Free Plan', '\$0.00', 'Free Usage', '0.05'));
  planList.add(NBMembershipPlanItemModel('Monthly', '\$1.5', 'Billed every month', '1.5'));
  planList.add(NBMembershipPlanItemModel('Yearly', '\$14.99/year', 'Billed every year', '14.99'));
  planList.add(NBMembershipPlanItemModel('Notice', 'Save 2months', 'On YearLy Plan', '0.05'));
  return planList;
}

List<NBFollowersItemModel> nbGetFollowers() {
  List<NBFollowersItemModel> followersList = [];
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Jones Hawkins', 13));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Frederick Rodriquez', 8));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'John Jordan', 37));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Cameron Williamson', 16));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Cody Fisher', 13));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Carla Hamilton', 21));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Fannie Townsend', 25));
  followersList.add(NBFollowersItemModel(ApiUrl.NBProfileImage, 'Viola Lloyd', 13));
  return followersList;
}

List<SneakerShoppingModel> getAllCart() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Youth Empowerment ', img: 'assets/images/bible.jpg', amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Spiritual Battle', img: NBNewsImage1, amount: '\$200.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Prayer 101', img: NBNewsImage2, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Meditations of on the Word', img: NBNewsImage3, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Gifts of the Spirit', img: NBNewsImage4, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Fruits of the Spirit', img: NBNewsImage5, amount: '\$250.00'));

  return list;
}

List<SneakerShoppingModel> getAllLibrary() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Youth Empowerment ', img: bookCover1, amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Spiritual Battle', img: bookCover2, amount: '\$200.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Prayer 101', img: NBNewsImage2, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Meditations of on the Word', img: NBNewsImage3, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Gifts of the Spirit', img: NBNewsImage4, amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Spirit Filled  Life and Being a Witness in the power of the Holy Spirit ', subtitle: 'Fruits of the Spirit', img: NBNewsImage5, amount: '\$250.00'));

  return list;
}


List<NBCommentItemModel> nbGetCommentList() {
  List<NBCommentItemModel> commentList = [];
  commentList.add(NBCommentItemModel(
    image: ApiUrl.NBProfileImage,
    name: 'Jones Hawkins',
    date: 'Jan 18,2021',
    time: '12:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: ApiUrl.NBProfileImage,
    name: 'Frederick Rodriquez',
    date: 'Jan 19,2021',
    time: '01:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: ApiUrl.NBProfileImage,
    name: 'John Jordan',
    date: 'Feb 18,2021',
    time: '03:15',
    message: 'This is Very Helpful,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: ApiUrl.NBProfileImage,
    name: 'Cameron Williamson',
    date: 'Jan 21,2021',
    time: '12:15',
    message: 'This is very Important for me,Thank You.',
  ));
  commentList.add(NBCommentItemModel(
    image: ApiUrl.NBProfileImage,
    name: 'Cody Fisher',
    date: 'Jan 28,2021',
    time: '12:15',
    message: 'This is very helpful,thanks',
  ));
  return commentList;
}
