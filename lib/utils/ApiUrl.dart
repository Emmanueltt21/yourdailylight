class ApiUrl {
  static const String BASEURL = "https://app.yourdailylight.org/dailylight/";   //LIVE Server
    //static const String BASEURL = "https://testdailylight.yourdailylight.org/dailylight/";   //test dailylight Server
  //static const String BASEURL_ADD = "https://hupertech.com/";
  static const String BASEURL_ADD = "https://www.pay.iwomitechnologies.com";
  static const String TERMS = "https://sites.google.com/view/dailylight01/privacy_policy";
  static const String PRIVACY = "https://sites.google.com/view/dailylight01/privacy_policy";
  static const String ABOUT = "https://sites.google.com/view/dailylight01/aboutus";

 // static const String DeepLUrl = "https://api.deepl.com/v2/translate";
  //static const String DeepLAPI_ProKey = "f192525c-93cd-aceb-1154-a8bdd645c9b2";


  static const String donationPage = "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=3G57JHYW9RNG6&source=url";
  static const String supportEmail = "PastorSimon@LGmissions.org";
  static const String appName = "Your Daily Light";

  static String? appPackageName = "com.lighthouse.yourdailylight";
  static String? appleAppURL = "https://apps.apple.com/us/app/your-daily-light/id1663965399";
  static String? appleAppId = "1663965399";

  static String androidAppShareUrlDesc = "Let me recommend you this application\n\n$androidAppUrl";
  static String iosAppShareUrlDesc = "Let me recommend you this application\n\n$iosAppUrl";
  static String androidAppUrl = "https://play.google.com/store/apps/details?id=${ApiUrl.appPackageName}";
  static String iosAppUrl = "https://apps.apple.com/us/app/id${ApiUrl.appleAppId}";


  static String appFacebookLink = "https://www.facebook.com/YourDailyLight";
  static String appYoutubeLink = "https://www.facebook.com/YourDailyLight";
  static String appInstagramLink = "https://instagram.com/yourdailylight_devotional?igshid=OGQ5ZDc2ODk2ZA==";
  static String appContactDeleteAcc = "https://sites.google.com/view/dailylight01/home";

  static String appPaypal_Url = "https://paypal.me/LGmissions?country.x=DE&locale.x=en_US";


  static String appDescriptionSupport = "Your partnership through giving to Lighthouse Global Missions enables us to accomplish more in fulfilling God’s call in bringing His life changing word and the miracle working power of the Holy Spirit around the world. And your every sacrifice will be richly rewarded and replenished with multiplication by the Lord, even as He guaranteed by His word (Scripture References: Mark 10:29-30, Luke 6:38).";


  static const NBProfileImage = 'assets/images/bible.jpg';


  //DO NOT EDIT THE LINES BELOW, ELSE THE APPLICATION WILL MISBEHAVE
  static const String GET_BIBLE = BASEURL + "getBibleVersions";
  static const String DONATE = BASEURL + "donate";
  static const String DISCOVER = BASEURL + "discover";
  static const String CATEGORIES = BASEURL + "fetch_categories";
  static const String LIVESTREAMS = BASEURL + "discoverLivestreams";
  static const String TRENDING = BASEURL + "discoverTrends";
  static const String FETCH_MEDIA = BASEURL + "fetch_media";
  static const String FETCH_BRANCHES = BASEURL + "church_branches";
  static const String DEVOTIONALS = BASEURL + "devotionals";
  static const String EVENTS = BASEURL + "fetch_events";
  static const String INBOX = BASEURL + "fetch_inbox";
  static const String HYMNS = BASEURL + "fetch_hymns";
  static const String FETCH_CATEGORIES_MEDIA =
      BASEURL + "fetch_categories_media";
  static const String SEARCH = BASEURL + "search";
  static const String REGISTER = BASEURL + "registerUser";
  static const String LOGIN = BASEURL + "loginUser";
  static const String RESETPASSWORD = BASEURL + "resetPassword";
  static const String getmediatotallikesandcommentsviews =
      BASEURL + "getmediatotallikesandcommentsviews";
  static const String update_media_total_views =
      BASEURL + "update_media_total_views";
  static const String likeunlikemedia = BASEURL + "likeunlikemedia";
  static const String editcomment = BASEURL + "editcomment";
  static const String deletecomment = BASEURL + "deletecomment";
  static const String makecomment = BASEURL + "makecomment";
  static const String loadcomments = BASEURL + "loadcomments";
  static const String editreply = BASEURL + "editreply";
  static const String deletereply = BASEURL + "deletereply";
  static const String replycomment = BASEURL + "replycomment";
  static const String loadreplies = BASEURL + "loadreplies";
  static const String reportcomment = BASEURL + "reportcomment";
  static const String storeFcmToken = BASEURL + "storefcmtoken";

  static const String getUsersToFollow = BASEURL + "get_users_to_follow";
  static const String followUnfollowUser = BASEURL + "follow_unfollow_user";
  static const String userNotifications = BASEURL + "userNotifications";
  static const String fetchUserSettings = BASEURL + "fetch_user_settings";
  static const String updateUserSettings = BASEURL + "update_user_settings";
  static const String fetchUserPosts = BASEURL + "fetch_posts_flutter";
  static const String likeunlikepost = BASEURL + "likeunlikepost";
  static const String pinunpinpost = BASEURL + "pinunpinpost";
  static const String postLikesPeople = BASEURL + "post_likes_people";
  static const String fetchUserPins = BASEURL + "fetchUserPinsFlutter";
  static const String loadpostcomments = BASEURL + "loadpostcomments";
  static const String makepostcomment = BASEURL + "makepostcomment";
  static const String editpostcomment = BASEURL + "editpostcomment";
  static const String deletepostcomment = BASEURL + "deletepostcomment";
  static const String reportpostcomment = BASEURL + "reportpostcomment";
  static const String loadpostreplies = BASEURL + "loadpostreplies";
  static const String replypostcomment = BASEURL + "replypostcomment";
  static const String editpostreply = BASEURL + "editpostreply";
  static const String deletepostreply = BASEURL + "deletepostreply";
  static const String userBioInfoFlutter = BASEURL + "userBioInfoFlutter";
  static const String fetchUserdataPosts = BASEURL + "fetchUserPostsflutter";
  static const String usersFollowPeopleList = BASEURL + "users_follow_people";
  static const String makePost = BASEURL + "make_post_flutter";
  static const String editPost = BASEURL + "editpost";
  static const String deletePost = BASEURL + "deletepost";
  static const String updateUserSocialFcmToken =
      BASEURL + "updateUserSocialFcmToken";

  static const String FETCH_USER_CHATS = BASEURL + "fetch_user_chats";
  static const String FETCH_PARTNER_CHATS = BASEURL + "fetch_user_partner_chat";
  static const String SAVE_CHAT_CONVERSATION =
      BASEURL + "save_user_conversation";
  static const String ONSEEN_USER_CONVERSATION =
      BASEURL + "on_seen_conversation";
  static const String ON_USER_TYPING = BASEURL + "on_user_typing";
  static const String UPDATE_ONLINE_PRESENCE =
      BASEURL + "update_user_online_status";
  static const String DELETE_SELECTED_CHATS =
      BASEURL + "delete_selected_chat_messages";
  static const String CLEAR_USER_CONVERSATION =
      BASEURL + "clear_user_conversation";
  static const String BLOCK_UNBLOCK_USER = BASEURL + "blockUnblockUser";
  static const String LOAD_MORE_CHATS = BASEURL + "load_more_chats";
  static const String CHECK_FOR_NEW_MESSAGES = BASEURL + "checkfornewmessages";


  ///EMT
  static const String GET_NEWS = BASEURL + "fetch_newsm";
  static const String GET_ALL_BOOKS = BASEURL + "booksListingm";
  static const String ADD_PRAYER_REQUEST = BASEURL + "addPrayer_request";
  static const String GET_PRAYER_REQUEST = BASEURL + "getPrayer_request";



  ///EMMT Payment
  static const String GETPaymentPayPal = BASEURL + "get_paypal_linkv1";
  //Subscription
  //TO GET THE PACK LIST
  static const String GET_PACKAGE_LIST = BASEURL + "getPackList";

  //TRANSACTION  HISTORY OF THE ANDROID USER
  static const String GET_TRANSACTION_LIST = BASEURL + "getTransactionsList";

  //TO PAY FOR A SUBSCRIPTION
  static const String PAY_SUBSCRIPTION = BASEURL + "paySubscription";

  //checkStatus
  static const String CHECK_STATUS = BASEURL + "checkStatus";

  //checSubscribtionM
  static const String CHECK_SUBSCRIPTION = BASEURL + "checSubscribtionM";
}
