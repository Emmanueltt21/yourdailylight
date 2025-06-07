
/*
 * Generated file. Do not edit.
 *
 * Locales: 4
 * Strings: 1112 (278.0 per locale)
 *
 * Built on 2022-03-08 at 08:34 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	fr, // 'fr'
	de, // 'pt'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsFr _translationsFr = _StringsFr.build();
late _StringsDe _translationsDe = _StringsDe.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.fr: return _translationsFr;
			case AppLocale.de: return _translationsDe;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.fr: return _StringsFr.build();
			case AppLocale.de: return _StringsDe.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.fr: return 'fr';
			case AppLocale.de: return 'de';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'fr': return AppLocale.fr;
			case 'de': return AppLocale.de;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get appname => 'Your Daily Light App';
	String get appname_label => 'Your Daily Light ';
	String get selectlanguage => 'Select Language';
	String get chooseapplanguage => 'Choose App Language';
	String get nightmode => 'Night Mode';
	String get initializingapp => 'initializing...';
	String get home => 'Home';
	String get branches => 'Branches';
	String get inbox => 'Inbox';
	String get downloads => 'Downloads';
	String get settings => 'Settings';
	String get events => 'Events';
	String get myplaylists => 'My Playlists';
	String get website => 'Website';
	String get hymns => 'Hymns';
	String get articles => 'Articles';
	String get notes => 'Notes';
	String get donate => 'Donate';
	String get savenotetitle => 'Note Title';
	String get nonotesfound => 'No notes found';
	String get newnote => 'New';
	String get deletenote => 'Delete Note';
	String get deletenotehint => 'Do you want to delete this note? This action cannot be reversed.';
	String get bookmarks => 'Bookmarks';
	String get socialplatforms => 'Social Platforms';
	List<String> get onboardingpagetitles => [
		'YOUR DAILY LIGHT',
		'CREATE AN ACCOUNT',
		'SHARE',
		'STAY UP TO DATE',
	];
	List<String> get onboardingpagehints => [
		'Find daily illumination from God’s word through devotionals and podcasts',
		'Access inspirational content, build your personal library and bring God’s word with you anywhere',
		'Share or read inspiring testimonies from around the world. Share prayer requests and find timely support',
		'Know what God is saying for the season, stay updated about events and discover ways to join the movement',
	];
	String get next => 'NEXT';
	String get done => 'Get Started';
	String get quitapp => 'Quit App!';
	String get quitappwarning => 'Do you wish to close the app?';
	String get quitappaudiowarning => 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.';
	String get ok => 'Ok';
	String get retry => 'RETRY';
	String get oops => 'Ooops!';
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get error => 'Error';
	String get success => 'Success';
	String get skip => 'Skip';
	String get skiplogin => 'Skip Login';
	String get skipregister => 'Skip Registration';
	String get dataloaderror => 'Could not load requested data at the moment, check your data connection and click to retry.';
	String get suggestedforyou => 'Suggested for you';
	String get videomessages => 'Video Messages';
	String get audiomessages => 'Audio Messages';
	String get devotionals => 'Devotionals';
	String get categories => 'Categories';
	String get category => 'Category';
	String get videos => 'Videos';
	String get audios => 'Audios';
	String get biblebooks => 'Bible';
	String get audiobible => 'Audio Bible';
	String get livestreams => 'Livestreams';
	String get radio => 'Radio';
	String get allitems => 'All Items';
	String get emptyplaylist => 'No Playlists';
	String get notsupported => 'Not Supported';
	String get cleanupresources => 'Cleaning up resources';
	String get grantstoragepermission => 'Please grant accessing storage permission to continue';
	String get sharefiletitle => 'Watch or Listen to ';
	String get sharefilebody => 'Via Your Daily Light App, Download now at ';
	String get sharetext => 'Enjoy unlimited Audio & Video streaming';
	String get sharetexthint => 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at';
	String get download => 'Download';
	String get addplaylist => 'Add to playlist';
	String get bookmark => 'Bookmark';
	String get unbookmark => 'UnBookmark';
	String get share => 'Share';
	String get deletemedia => 'Delete File';
	String get deletemediahint => 'Do you wish to delete this downloaded file? This action cannot be undone.';
	String get searchhint => 'Search Audio & Video Messages';
	String get performingsearch => 'Searching Audios and Videos';
	String get nosearchresult => 'No results Found';
	String get nosearchresulthint => 'Try input more general keyword';
	String get addtoplaylist => 'Add to playlist';
	String get newplaylist => 'New playlist';
	String get playlistitm => 'Playlist';
	String get mediaaddedtoplaylist => 'Media added to playlist.';
	String get mediaremovedfromplaylist => 'Media removed from playlist';
	String get clearplaylistmedias => 'Clear All Media';
	String get deletePlayList => 'Delete Playlist';
	String get clearplaylistmediashint => 'Go ahead and remove all media from this playlist?';
	String get deletePlayListhint => 'Go ahead and delete this playlist and clear all media?';
	String get comments => 'Comments';
	String get replies => 'Replies';
	String get reply => 'Reply';
	String get logintoaddcomment => 'Login to add a comment';
	String get logintoreply => 'Login to reply';
	String get writeamessage => 'Write a message...';
	String get nocomments => 'No Comments found \nclick to retry';
	String get errormakingcomments => 'Cannot process commenting at the moment..';
	String get errordeletingcomments => 'Cannot delete this comment at the moment..';
	String get erroreditingcomments => 'Cannot edit this comment at the moment..';
	String get errorloadingmorecomments => 'Cannot load more comments at the moment..';
	String get deletingcomment => 'Deleting comment';
	String get editingcomment => 'Editing comment';
	String get deletecommentalert => 'Delete Comment';
	String get editcommentalert => 'Edit Comment';
	String get deletecommentalerttext => 'Do you wish to delete this comment? This action cannot be undone';
	String get loadmore => 'load more';
	String get messages => 'Messages';
	String get guestuser => 'Guest User';
	String get fullname => 'Full Name';
	String get emailaddress => 'Email Address';
	String get password => 'Password';
	String get repeatpassword => 'Repeat Password';
	String get register => 'Register';
	String get login => 'Login';
	String get logout => 'Logout';
	String get logoutfromapp => 'Logout from app?';
	String get logoutfromapphint => 'You wont be able to like or comment on articles and videos if you are not logged in.';
	String get gotologin => 'Go to Login';
	String get resetpassword => 'Reset Password';
	String get logintoaccount => 'Already have an account? Login';
	String get emptyfielderrorhint => 'You need to fill all the fields';
	String get invalidemailerrorhint => 'You need to enter a valid email address';
	String get passwordsdontmatch => 'Passwords dont match';
	String get processingpleasewait => 'Processing, Please wait...';
	String get createaccount => 'Create an account';
	String get forgotpassword => 'Forgot Password?';
	String get orloginwith => 'Or Login With';
	String get facebook => 'Facebook';
	String get google => 'Google';
	String get moreoptions => 'More Options';
	String get about => 'About Us';
	String get privacy => 'Privacy Policy';
	String get terms => 'App Terms';
	String get rate => 'Rate App';
	String get version => 'Version';
	String get pulluploadmore => 'pull up load';
	String get loadfailedretry => 'Load Failed!Click retry!';
	String get releaseloadmore => 'release to load more';
	String get nomoredata => 'No more Data';
	String get errorReportingComment => 'Error Reporting Comment';
	String get reportingComment => 'Reporting Comment';
	String get reportcomment => 'Report Options';
	List<String> get reportCommentsList => [
		'Unwanted commercial content or spam',
		'Pornography or sexual explicit material',
		'Hate speech or graphic violence',
		'Harassment or bullying',
	];
	String get bookmarksMedia => 'My Bookmarks';
	String get noitemstodisplay => 'No Items To Display';
	String get loginrequired => 'Login Required';
	String get loginrequiredhint => 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.';
	String get subscriptions => 'App Subscriptions';
	String get subscribe => 'SUBSCRIBE';
	String get subscribehint => 'Subscription Required';
	String get playsubscriptionrequiredhint => 'You need to subscribe before you can listen to or watch this media.';
	String get previewsubscriptionrequiredhint => 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.';
	String get copiedtoclipboard => 'Copied to clipboard';
	String get downloadbible => 'Download Bible';
	String get downloadversion => 'Download';
	String get downloading => 'Downloading';
	String get failedtodownload => 'Failed to download';
	String get pleaseclicktoretry => 'Please click to retry.';
	String get of => 'Of';
	String get nobibleversionshint => 'There is no bible data to display, click on the button below to download atleast one bible version.';
	String get downloaded => 'Downloaded';
	String get enteremailaddresstoresetpassword => 'Enter your email to reset your password';
	String get backtologin => 'BACK TO LOGIN';
	String get signintocontinue => 'Sign in to continue';
	String get signin => 'S I G N  I N';
	String get signinforanaccount => 'SIGN UP FOR AN ACCOUNT?';
	String get alreadyhaveanaccount => 'Already have an account?';
	String get updateprofile => 'Update Profile';
	String get updateprofilehint => 'To get started, please update your profile page, this will help us in connecting you with other people';
	String get autoplayvideos => 'AutoPlay Videos';
	String get gosocial => 'Go Social';
	String get searchbible => 'Search Bible';
	String get filtersearchoptions => 'Filter Search Options';
	String get narrowdownsearch => 'Use the filter button below to narrow down search for a more precise result.';
	String get searchbibleversion => 'Search Bible Version';
	String get searchbiblebook => 'Search Bible Book';
	String get search => 'Search';
	String get setBibleBook => 'Set Bible Book';
	String get oldtestament => 'Old Testament';
	String get newtestament => 'New Testament';
	String get limitresults => 'Limit Results';
	String get setfilters => 'Set Filters';
	String get bibletranslator => 'Bible Translator';
	String get chapter => ' Chapter ';
	String get verse => ' Verse ';
	String get translate => 'translate';
	String get bibledownloadinfo => 'Bible Download started, Please do not close this page until the download is done.';
	String get received => 'received';
	String get outoftotal => 'out of total';
	String get set => 'SET';
	String get selectColor => 'Select Color';
	String get switchbibleversion => 'Switch Bible Version';
	String get switchbiblebook => 'Switch Bible Book';
	String get gotosearch => 'Go to Chapter';
	String get changefontsize => 'Change Font Size';
	String get font => 'Font';
	String get readchapter => 'Read Chapter';
	String get showhighlightedverse => 'Show Highlighted Verses';
	String get downloadmoreversions => 'Download more versions';
	String get suggestedusers => 'Suggested users to follow';
	String get unfollow => 'UnFollow';
	String get follow => 'Follow';
	String get searchforpeople => 'Search for people';
	String get viewpost => 'View Post';
	String get viewprofile => 'View Profile';
	String get mypins => 'My Pins';
	String get viewpinnedposts => 'View Pinned Posts';
	String get personal => 'Personal';
	String get update => 'Update';
	String get phonenumber => 'Phone Number';
	String get showmyphonenumber => 'Show my phone number to users';
	String get dateofbirth => 'Date of Birth';
	String get showmyfulldateofbirth => 'Show my full date of birth to people viewing my status';
	String get notifications => 'Notifications';
	String get notifywhenuserfollowsme => 'Notify me when a user follows me';
	String get notifymewhenusercommentsonmypost => 'Notify me when users comment on my post';
	String get notifymewhenuserlikesmypost => 'Notify me when users like my post';
	String get churchsocial => 'Church Social';
	String get shareyourthoughts => 'Share your thoughts';
	String get readmore => '...Read more';
	String get less => ' Less';
	String get couldnotprocess => 'Could not process requested action.';
	String get pleaseselectprofilephoto => 'Please select a profile photo to upload';
	String get pleaseselectprofilecover => 'Please select a cover photo to upload';
	String get updateprofileerrorhint => 'You need to fill your name, date of birth, gender, phone and location before you can proceed.';
	String get gender => 'Gender';
	String get male => 'Male';
	String get female => 'Female';
	String get dob => 'Date Of Birth';
	String get location => 'Current Location';
	String get qualification => 'Qualification';
	String get aboutme => 'About Me';
	String get facebookprofilelink => 'Facebook Profile Link';
	String get twitterprofilelink => 'Twitter Profile Link';
	String get linkdln => 'Linkedln Profile Link';
	String get likes => 'Likes';
	String get likess => 'Like(s)';
	String get pinnedposts => 'My Pinned Posts';
	String get unpinpost => 'Unpin Post';
	String get unpinposthint => 'Do you wish to remove this post from your pinned posts?';
	String get postdetails => 'Post Details';
	String get posts => 'Posts';
	String get followers => 'Followers';
	String get followings => 'Followings';
	String get my => 'My';
	String get edit => 'Edit';
	String get delete => 'Delete';
	String get deletepost => 'Delete Post';
	String get deleteposthint => 'Do you wish to delete this post? Posts can still appear on some users feeds.';
	String get maximumallowedsizehint => 'Maximum allowed file upload reached';
	String get maximumuploadsizehint => 'The selected file exceeds the allowed upload file size limit.';
	String get makeposterror => 'Unable to make post at the moment, please click to retry.';
	String get makepost => 'Make Post';
	String get selectfile => 'Select File';
	String get images => 'Images';
	String get shareYourThoughtsNow => 'Share your thoughts ...';
	String get photoviewer => 'Photo Viewer';
	String get nochatsavailable => 'No Conversations available \n Click the add icon below \nto select users to chat with';
	String get typing => 'Typing...';
	String get photo => 'Photo';
	String get online => 'Online';
	String get offline => 'Offline';
	String get lastseen => 'Last Seen';
	String get deleteselectedhint => 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.';
	String get deleteselected => 'Delete selected';
	String get unabletofetchconversation => 'Unable to Fetch \nyour conversation with \n';
	String get loadmoreconversation => 'Load more conversations';
	String get sendyourfirstmessage => 'Send your first message to \n';
	String get unblock => 'Unblock ';
	String get block => 'Block';
	String get writeyourmessage => 'Write your message...';
	String get clearconversation => 'Clear Conversation';
	String get clearconversationhintone => 'This action will clear all your conversation with ';
	String get clearconversationhinttwo => '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.';
	String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';
	String get mylibrary=> 'My Library';
	String get prayer_request=> 'Prayer Request or Testimony';
	String get mySubscription=> 'My Subscription';
	String get giveandpart=> 'Giving and PartnerShip';
	String get follow_us=> 'Follow us on';
	String get profile=> 'Profile';
	String get no_phone=> 'No Phone';
	String get no_address=> 'No address';
	String get changepwd=> 'Change Password';
	String get help_support=> 'Help and Support';
	String get quest_logout=> 'Do you want to logout from the app?';
	String get no=> 'No';
	String get yes=> 'YES';
	String get enjoy_using=> 'Enjoy Using ';
	String get tap_rate=> 'Tap a star rate it on the App Store ';
	String get please_rate=> 'Please Enter Your Rating ';
	String get submit=> 'submit';
	String get select_email=> 'Select email app to compose';
	String get open_mail=> 'Open Mail Appe';
	String get no_mailer=> 'No mail apps installed';
	String get login_request=> 'Login to View Request';
	String get empty=> 'Empty';
	String get send_prayer=> 'No Item Found \n Send a New Prayer Request or Testimony';
	String get podcast=> 'PodCast';
	String get new_prayer_req=> 'New Prayer Request or Testimony';
	String get read_more=> 'READ MORE';
	String get details=> 'Details';
	String get added_bookmark=> 'Added to Bookmark';
	String get removed_bookmark=> 'Removed from Bookmark';
	String get delete_account=> 'Delete Account';
}

// Path: <root>

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsFr _root = this;

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Choisir la langue';
	@override String get chooseapplanguage => 'Choisissez la langue de l\'application';
	@override String get nightmode => 'Mode nuit';
	@override String get initializingapp => 'initialisation...';
	@override String get home => 'Accueil';
	@override String get branches => 'Branches';
	@override String get inbox => 'Boîte de réception';
	@override String get downloads => 'Téléchargements';
	@override String get settings => 'Paramètres';
	@override String get events => 'Événements';
	@override String get myplaylists => 'Mes listes de lecture';
	@override String get nonotesfound => 'Aucune note trouvée';
	@override String get newnote => 'Nouveau';
	@override String get website => 'Site Internet';
	@override String get hymns => 'Hymnes';
	@override String get articles => 'Des articles';
	@override String get notes => 'Remarques';
	@override String get donate => 'Faire un don';
	@override String get deletenote => 'Supprimer la note';
	@override String get deletenotehint => 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.';
	@override String get savenotetitle => 'Titre de la note';
	@override String get bookmarks => 'Favoris';
	@override String get socialplatforms => 'Plateformes sociales';
	@override List<String> get onboardingpagetitles => [
		'Bienvenue à  Daily Light',
		'Plein de fonctionnalités',
		'Audio, Video \n et diffusion en direct',
		'Créer un compte',
	];
	@override List<String> get onboardingpagehints => [
		'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.',
		'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.',
		'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.',
		'Commencez votre voyage vers une expérience de culte sans fin.',
	];
	@override String get next => 'SUIVANT';
	@override String get done => 'COMMENCER';
	@override String get quitapp => 'Quitter l\'application!';
	@override String get quitappwarning => 'Souhaitez-vous fermer l\'application?';
	@override String get quitappaudiowarning => 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.';
	@override String get ok => 'D\'accord';
	@override String get retry => 'RECOMMENCEZ';
	@override String get oops => 'Oups!';
	@override String get save => 'sauver';
	@override String get cancel => 'Annuler';
	@override String get error => 'Erreur';
	@override String get success => 'Succès';
	@override String get skip => 'Sauter';
	@override String get skiplogin => 'Passer l\'identification';
	@override String get skipregister => 'Sauter l\'inscription';
	@override String get dataloaderror => 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.';
	@override String get suggestedforyou => 'Suggéré pour vous';
	@override String get devotionals => 'Dévotion';
	@override String get categories => 'Catégories';
	@override String get category => 'Catégorie';
	@override String get videos => 'Vidéos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Bible';
	@override String get audiobible => 'Bible audio';
	@override String get livestreams => 'Livestreams';
	@override String get radio => 'Radio';
	@override String get allitems => 'Tous les articles';
	@override String get emptyplaylist => 'Aucune liste de lecture';
	@override String get notsupported => 'Non supporté';
	@override String get cleanupresources => 'Nettoyage des ressources';
	@override String get grantstoragepermission => 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer';
	@override String get sharefiletitle => 'Regarder ou écouter ';
	@override String get sharefilebody => 'Via Your Daily Light App, Téléchargez maintenant sur ';
	@override String get sharetext => 'Profitez d\'un streaming audio et vidéo illimité';
	@override String get sharetexthint => 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur';
	@override String get download => 'Télécharger';
	@override String get addplaylist => 'Ajouter à la playlist';
	@override String get bookmark => 'Signet';
	@override String get unbookmark => 'Supprimer les favoris';
	@override String get share => 'Partager';
	@override String get deletemedia => 'Supprimer le fichier';
	@override String get deletemediahint => 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.';
	@override String get searchhint => 'Rechercher des messages audio et vidéo';
	@override String get performingsearch => 'Recherche d\'audio et de vidéos';
	@override String get nosearchresult => 'Aucun résultat trouvé';
	@override String get nosearchresulthint => 'Essayez de saisir un mot clé plus général';
	@override String get addtoplaylist => 'Ajouter à la playlist';
	@override String get newplaylist => 'Nouvelle playlist';
	@override String get playlistitm => 'Playlist';
	@override String get mediaaddedtoplaylist => 'Média ajouté à la playlist.';
	@override String get mediaremovedfromplaylist => 'Média supprimé de la playlist';
	@override String get clearplaylistmedias => 'Effacer tous les médias';
	@override String get deletePlayList => 'Supprimer la playlist';
	@override String get clearplaylistmediashint => 'Voulez-vous supprimer tous les médias de cette liste de lecture?';
	@override String get deletePlayListhint => 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?';
	@override String get videomessages => 'Messages vidéo';
	@override String get audiomessages => 'Messages audio';
	@override String get comments => 'commentaires';
	@override String get replies => 'réponses';
	@override String get reply => 'Répondre';
	@override String get logintoaddcomment => 'Connectez-vous pour ajouter un commentaire';
	@override String get logintoreply => 'Connectez-vous pour répondre';
	@override String get writeamessage => 'Écrire un message...';
	@override String get nocomments => 'Aucun commentaire trouvé \ncliquez pour réessayer';
	@override String get errormakingcomments => 'Impossible de traiter les commentaires pour le moment..';
	@override String get errordeletingcomments => 'Impossible de supprimer ce commentaire pour le moment..';
	@override String get erroreditingcomments => 'Impossible de modifier ce commentaire pour le moment..';
	@override String get errorloadingmorecomments => 'Impossible de charger plus de commentaires pour le moment..';
	@override String get deletingcomment => 'Suppression du commentaire';
	@override String get editingcomment => 'Modification du commentaire';
	@override String get deletecommentalert => 'Supprimer le commentaire';
	@override String get editcommentalert => 'Modifier le commentaire';
	@override String get deletecommentalerttext => 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée';
	@override String get loadmore => 'charger plus';
	@override String get messages => 'Messages';
	@override String get guestuser => 'Utilisateur invité';
	@override String get fullname => 'Nom complet';
	@override String get emailaddress => 'Adresse électronique';
	@override String get password => 'Mot de passe';
	@override String get repeatpassword => 'Répéter le mot de passe';
	@override String get register => 'S\'inscrire';
	@override String get login => 'S\'identifier';
	@override String get logout => 'Se déconnecter';
	@override String get logoutfromapp => 'Déconnexion de l\'application?';
	@override String get logoutfromapphint => 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.';
	@override String get gotologin => 'Aller à la connexion';
	@override String get resetpassword => 'réinitialiser le mot de passe';
	@override String get logintoaccount => 'Vous avez déjà un compte? S\'identifier';
	@override String get emptyfielderrorhint => 'Vous devez remplir tous les champs';
	@override String get invalidemailerrorhint => 'Vous devez saisir une adresse e-mail valide';
	@override String get passwordsdontmatch => 'Les mots de passe ne correspondent pas';
	@override String get processingpleasewait => 'Traitement, veuillez patienter...';
	@override String get createaccount => 'Créer un compte';
	@override String get forgotpassword => 'Mot de passe oublié?';
	@override String get orloginwith => 'Ou connectez-vous avec';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Plus d\'options';
	@override String get about => 'À propos de nous';
	@override String get privacy => 'confidentialité';
	@override String get terms => 'Termes de l\'application';
	@override String get rate => 'Application de taux';
	@override String get version => 'Version';
	@override String get pulluploadmore => 'tirer la charge';
	@override String get loadfailedretry => 'Échec du chargement! Cliquez sur Réessayer!';
	@override String get releaseloadmore => 'relâchez pour charger plus';
	@override String get nomoredata => 'Plus de données';
	@override String get errorReportingComment => 'Commentaire de rapport d\'erreur';
	@override String get reportingComment => 'Signaler un commentaire';
	@override String get reportcomment => 'Options de rapport';
	@override List<String> get reportCommentsList => [
		'Contenu commercial indésirable ou spam',
		'Pornographie ou matériel sexuel explicite',
		'Discours haineux ou violence graphique',
		'Harcèlement ou intimidation',
	];
	@override String get bookmarksMedia => 'Mes marque-pages';
	@override String get noitemstodisplay => 'Aucun élément à afficher';
	@override String get loginrequired => 'Connexion requise';
	@override String get loginrequiredhint => 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.';
	@override String get subscriptions => 'Abonnements aux applications';
	@override String get subscribe => 'SOUSCRIRE';
	@override String get subscribehint => 'Abonnement requis';
	@override String get playsubscriptionrequiredhint => 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.';
	@override String get previewsubscriptionrequiredhint => 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.';
	@override String get copiedtoclipboard => 'Copié dans le presse-papier';
	@override String get downloadbible => 'Télécharger la Bible';
	@override String get downloadversion => 'Télécharger';
	@override String get downloading => 'Téléchargement';
	@override String get failedtodownload => 'Échec du téléchargement';
	@override String get pleaseclicktoretry => 'Veuillez cliquer pour réessayer.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.';
	@override String get downloaded => 'Téléchargé';
	@override String get enteremailaddresstoresetpassword => 'Entrez votre e-mail pour réinitialiser votre mot de passe';
	@override String get backtologin => 'RETOUR CONNEXION';
	@override String get signintocontinue => 'Connectez-vous pour continuer';
	@override String get signin => 'SE CONNECTER';
	@override String get signinforanaccount => 'INSCRIVEZ-VOUS POUR UN COMPTE?';
	@override String get alreadyhaveanaccount => 'Vous avez déjà un compte?';
	@override String get updateprofile => 'Mettre à jour le profil';
	@override String get updateprofilehint => 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes';
	@override String get autoplayvideos => 'Vidéos de lecture automatique';
	@override String get gosocial => 'Passez aux réseaux sociaux';
	@override String get searchbible => 'Rechercher dans la Bible';
	@override String get filtersearchoptions => 'Filtrer les options de recherche';
	@override String get narrowdownsearch => 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.';
	@override String get searchbibleversion => 'Rechercher la version de la Bible';
	@override String get searchbiblebook => 'Rechercher un livre biblique';
	@override String get search => 'Chercher';
	@override String get setBibleBook => 'Définir le livre de la Bible';
	@override String get oldtestament => 'L\'Ancien Testament';
	@override String get newtestament => 'Nouveau Testament';
	@override String get limitresults => 'Limiter les résultats';
	@override String get setfilters => 'Définir les filtres';
	@override String get bibletranslator => 'Traducteur de la Bible';
	@override String get chapter => ' Chapitre ';
	@override String get verse => ' Verset ';
	@override String get translate => 'traduire';
	@override String get bibledownloadinfo => 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.';
	@override String get received => 'reçu';
	@override String get outoftotal => 'sur le total';
	@override String get set => 'ENSEMBLE';
	@override String get selectColor => 'Select Color';
	@override String get switchbibleversion => 'Changer de version de la Bible';
	@override String get switchbiblebook => 'Changer de livre biblique';
	@override String get gotosearch => 'Aller au chapitre';
	@override String get changefontsize => 'Changer la taille de la police';
	@override String get font => 'Police de caractère';
	@override String get readchapter => 'Lire le chapitre';
	@override String get showhighlightedverse => 'Afficher les versets en surbrillance';
	@override String get downloadmoreversions => 'Télécharger plus de versions';
	@override String get suggestedusers => 'Utilisateurs suggérés à suivre';
	@override String get unfollow => 'Ne pas suivre';
	@override String get follow => 'Suivre';
	@override String get searchforpeople => 'Recherche de personnes';
	@override String get viewpost => 'Voir l\'article';
	@override String get viewprofile => 'Voir le profil';
	@override String get mypins => 'Mes épingles';
	@override String get viewpinnedposts => 'Afficher les messages épinglés';
	@override String get personal => 'Personnel';
	@override String get update => 'Mettre à jour';
	@override String get phonenumber => 'Numéro de téléphone';
	@override String get showmyphonenumber => 'Afficher mon numéro de téléphone aux utilisateurs';
	@override String get dateofbirth => 'Date de naissance';
	@override String get showmyfulldateofbirth => 'Afficher ma date de naissance complète aux personnes qui consultent mon statut';
	@override String get notifications => 'Notifications';
	@override String get notifywhenuserfollowsme => 'M\'avertir lorsqu\'un utilisateur me suit';
	@override String get notifymewhenusercommentsonmypost => 'M\'avertir lorsque les utilisateurs commentent mon message';
	@override String get notifymewhenuserlikesmypost => 'M\'avertir lorsque les utilisateurs aiment mon message';
	@override String get churchsocial => 'Église sociale';
	@override String get shareyourthoughts => 'Partage tes pensées';
	@override String get readmore => '...Lire la suite';
	@override String get less => ' Moins';
	@override String get couldnotprocess => 'Impossible de traiter l\'action demandée.';
	@override String get pleaseselectprofilephoto => 'Veuillez sélectionner une photo de profil à télécharger';
	@override String get pleaseselectprofilecover => 'Veuillez sélectionner une photo de couverture à télécharger';
	@override String get updateprofileerrorhint => 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.';
	@override String get gender => 'Le sexe';
	@override String get male => 'Mâle';
	@override String get female => 'Femme';
	@override String get dob => 'Date de naissance';
	@override String get location => 'Localisation actuelle';
	@override String get qualification => 'Qualification';
	@override String get aboutme => 'À propos de moi';
	@override String get facebookprofilelink => 'Lien de profil Facebook';
	@override String get twitterprofilelink => 'Lien de profil Twitter';
	@override String get linkdln => 'Lien de profil Linkedln';
	@override String get likes => 'Aime';
	@override String get likess => 'Comme';
	@override String get pinnedposts => 'Mes messages épinglés';
	@override String get unpinpost => 'Détacher le message';
	@override String get unpinposthint => 'Souhaitez-vous supprimer ce message de vos messages épinglés?';
	@override String get postdetails => 'Détails de l\'article';
	@override String get posts => 'Des postes';
	@override String get followers => 'Suiveurs';
	@override String get followings => 'Suivi';
	@override String get my => 'Mon';
	@override String get edit => 'Éditer';
	@override String get delete => 'Supprimer';
	@override String get deletepost => 'Supprimer le message';
	@override String get deleteposthint => 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.';
	@override String get maximumallowedsizehint => 'Téléchargement de fichier maximum autorisé atteint';
	@override String get maximumuploadsizehint => 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.';
	@override String get makeposterror => 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.';
	@override String get makepost => 'Faire un message';
	@override String get selectfile => 'Choisir le dossier';
	@override String get images => 'Images';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visor de fotos';
	@override String get nochatsavailable => 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter';
	@override String get typing => 'Dactylographie...';
	@override String get photo => 'Foto';
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
	@override String get lastseen => 'Dernière vue';
	@override String get deleteselectedhint => 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.';
	@override String get deleteselected => 'Supprimer sélectionnée';
	@override String get unabletofetchconversation => 'Impossible de récupérer \n votre conversation avec \n';
	@override String get loadmoreconversation => 'Charger plus de conversations';
	@override String get sendyourfirstmessage => 'Envoyez votre premier message à \n';
	@override String get unblock => 'Débloquer ';
	@override String get block => 'Bloquer ';
	@override String get writeyourmessage => 'Rédigez votre message...';
	@override String get clearconversation => 'Conversation claire';
	@override String get clearconversationhintone => 'Cette action effacera toute votre conversation avec ';
	@override String get clearconversationhinttwo => '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.';
	@override String get facebookloginerror => 'Something went wrong with the login process.\n, Here is the error Facebook gave us';

@override String get mylibrary	 => 'Ma bibliothèque	';
@override String get prayer_request	 => 'Demande de prière ou témoignage	';
@override String get mySubscription	 => 'Mon abonnement	';
@override String get giveandpart	 => 'Don et partenariat	';
@override String get follow_us	 => 'Suivez-nous sur	';
@override String get profile	 => 'Profil	';
@override String get no_phone	 => 'Pas de téléphone	';
@override String get no_address	 => 'Pas d\'adresse	';
@override String get changepwd	 => 'Changer le mot de passe	';
@override String get help_support	 => 'Aide et soutien	';
@override String get quest_logout	 => 'Voulez-vous vous déconnecter de l\'application ?	';
@override String get no	 => 'Non	';
@override String get yes	 => 'OUI	';
@override String get enjoy_using	 => 'Profitez de l\'utilisation 	';
@override String get tap_rate	 => 'Appuyez sur une étoile et notez-le sur l\'App Store 	';
@override String get please_rate	 => 'Veuillez entrer votre note 	';
@override String get submit	 => 'soumettre	';
@override String get select_email	 => 'Sélectionnez l\'application de messagerie à composer	';
@override String get open_mail	 => 'Ouvrir l\'application Mail	';
@override String get no_mailer	 => 'Aucune application de messagerie installée	';
@override String get login_request	 => 'Connectez-vous pour afficher la demande	';
@override String get empty	 => 'Vide	';
@override String get send_prayer	 => 'Aucun élément trouvé \n 	';
@override String get podcast	 => 'Podcast	';
@override String get new_prayer_req	 => 'Nouvelle demande de prière ou témoignage	';
@override String get read_more	 => 'EN SAVOIR PLUS	';
@override String get details	 => 'Détails	';
@override String get added_bookmark	 => 'Ajouté aux favoris	';
@override String get removed_bookmark	 => 'Supprimé du signet	';
@override String get delete_account	 => 'Supprimer le compte';

}

// Path: <root>
class _StringsDe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsDe _root = this;

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Sprache auswählen';
	@override String get chooseapplanguage => 'Wählen Sie App-Sprache';
	@override String get nightmode => 'Nacht-Modus';
	@override String get initializingapp => 'Initialisierung...';
	@override String get home => 'Heim';
	@override String get branches => 'Geäst';
	@override String get inbox => 'Posteingang';
	@override String get downloads => 'Downloads';
	@override String get settings => 'Einstellungen';
	@override String get events => 'Veranstaltungen';
	@override String get myplaylists => 'Meine Playlists';
	@override String get website => 'Webseite';
	@override String get hymns => 'Hymnen';
	@override String get articles => 'Artikel';
	@override String get notes => 'Anmerkungen';
	@override String get donate => 'Spenden';
	@override String get savenotetitle => 'Notiztitel';
	@override String get nonotesfound => 'Keine Notizen gefunden';
	@override String get newnote => 'Neu';
	@override String get deletenote => 'Notiz löschen';
	@override String get deletenotehint => 'Möchten Sie diese Notiz löschen? ';
	@override String get bookmarks => 'Lesezeichen';
	@override String get socialplatforms => 'Soziale Plattformen';
	List<String> get onboardingpagetitles => [
		'YOUR DAILY LIGHT',
		'CREATE AN ACCOUNT',
		'SHARE',
		'STAY UP TO DATE',
	];
	List<String> get onboardingpagehints => [
		'Find daily illumination from God’s word through devotionals and podcasts',
		'Access inspirational content, build your personal library and bring God’s word with you anywhere',
		'Share or read inspiring testimonies from around the world. Share prayer requests and find timely support',
		'Know what God is saying for the season, stay updated about events and discover ways to join the movement',
	];
	@override String get next => 'NÄCHSTE';
	@override String get done => 'Loslegen';
	@override String get quitapp => 'Beenden Sie die App!';
	@override String get quitappwarning => 'Möchten Sie die App schließen?';
	@override String get quitappaudiowarning => 'Sie spielen gerade eine Audiodatei ab. Wenn Sie die App beenden, wird die Audiowiedergabe gestoppt. ';
	@override String get ok => 'OK';
	@override String get retry => 'WIEDERHOLEN';
	@override String get oops => 'Ups!';
	@override String get save => 'Speichern';
	@override String get cancel => 'Stornieren';
	@override String get error => 'Fehler';
	@override String get success => 'Erfolg';
	@override String get skip => 'Überspringen';
	@override String get skiplogin => 'Login überspringen';
	@override String get skipregister => 'Registrierung überspringen';
	@override String get dataloaderror => 'Die angeforderten Daten konnten derzeit nicht geladen werden. Überprüfen Sie Ihre Datenverbindung und klicken Sie, um es erneut zu versuchen.';
	@override String get suggestedforyou => 'Für Sie empfohlen';
	@override String get videomessages => 'Videobotschaften';
	@override String get audiomessages => 'Audio-Nachrichten';
	@override String get devotionals => 'Andachten';
	@override String get categories => 'Kategorien';
	@override String get category => 'Kategorie';
	@override String get videos => 'Videos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Bibel';
	@override String get audiobible => 'Audio-Bibel';
	@override String get livestreams => 'Live-Streams';
	@override String get radio => 'Radio';
	@override String get allitems => 'Alle Elemente';
	@override String get emptyplaylist => 'Keine Playlists';
	@override String get notsupported => 'Nicht unterstützt';
	@override String get cleanupresources => 'Ressourcen bereinigen';
	@override String get grantstoragepermission => 'Bitte erteilen Sie die Erlaubnis zum Zugriff auf den Speicher, um fortzufahren';
	@override String get sharefiletitle => 'Anschauen oder anhören ';
	@override String get sharefilebody => 'Laden Sie es jetzt über Ihre Daily Light-App herunter unter ';
	@override String get sharetext => 'Genießen Sie unbegrenztes Audio- und Video-Streaming';
	@override String get sharetexthint => 'Treten Sie der Video- und Audio-Streaming-Plattform bei, mit der Sie Millionen von Dateien aus der ganzen Welt ansehen und anhören können. ';
	@override String get download => 'Herunterladen';
	@override String get addplaylist => 'Zur Wiedergabeliste hinzufügen';
	@override String get bookmark => 'Lesezeichen';
	@override String get unbookmark => 'Lesezeichen aufheben';
	@override String get share => 'Aktie';
	@override String get deletemedia => 'Datei löschen';
	@override String get deletemediahint => 'Möchten Sie diese heruntergeladene Datei löschen? ';
	@override String get searchhint => 'Suchen Sie nach Audio- und Videonachrichten';
	@override String get performingsearch => 'Suche nach Audios und Videos';
	@override String get nosearchresult => 'Keine Ergebnisse gefunden';
	@override String get nosearchresulthint => 'Versuchen Sie, ein allgemeineres Schlüsselwort einzugeben';
	@override String get addtoplaylist => 'Zur Wiedergabeliste hinzufügen';
	@override String get newplaylist => 'Neue Playlist';
	@override String get playlistitm => 'Wiedergabeliste';
	@override String get mediaaddedtoplaylist => 'Medien zur Playlist hinzugefügt.';
	@override String get mediaremovedfromplaylist => 'Medien aus der Playlist entfernt';
	@override String get clearplaylistmedias => 'Alle Medien löschen';
	@override String get deletePlayList => 'Playlist löschen';
	@override String get clearplaylistmediashint => 'Alle Medien aus dieser Playlist entfernen?';
	@override String get deletePlayListhint => 'Möchten Sie diese Wiedergabeliste und alle Medien löschen?';
	@override String get comments => 'Kommentare';
	@override String get replies => 'Antworten';
	@override String get reply => 'Antwort';
	@override String get logintoaddcomment => 'Melden Sie sich an, um einen Kommentar hinzuzufügen';
	@override String get logintoreply => 'Anmelden um zu Antworten';
	@override String get writeamessage => 'Nachricht schreiben...';
	@override String get nocomments => 'Keine Kommentare gefunden \n';
	@override String get errormakingcomments => 'Kommentare können im Moment nicht verarbeitet werden.';
	@override String get errordeletingcomments => 'Dieser Kommentar kann im Moment nicht gelöscht werden.';
	@override String get erroreditingcomments => 'Dieser Kommentar kann im Moment nicht bearbeitet werden.';
	@override String get errorloadingmorecomments => 'Im Moment können keine weiteren Kommentare geladen werden.';
	@override String get deletingcomment => 'Kommentar wird gelöscht';
	@override String get editingcomment => 'Kommentar bearbeiten';
	@override String get deletecommentalert => 'Kommentar löschen';
	@override String get editcommentalert => 'Kommentar bearbeiten';
	@override String get deletecommentalerttext => 'Möchten Sie diesen Kommentar löschen? ';
	@override String get loadmore => 'Mehr laden';
	@override String get messages => 'Mitteilungen';
	@override String get guestuser => 'Gastbenutzer';
	@override String get fullname => 'Vollständiger Name';
	@override String get emailaddress => 'E-Mail-Adresse';
	@override String get password => 'Passwort';
	@override String get repeatpassword => 'Passwort wiederholen';
	@override String get register => 'Registrieren';
	@override String get login => 'Anmeldung';
	@override String get logout => 'Ausloggen';
	@override String get logoutfromapp => 'Von der App abmelden?';
	@override String get logoutfromapphint => 'Wenn Sie nicht angemeldet sind, können Sie Artikel und Videos nicht liken oder kommentieren.';
	@override String get gotologin => 'Gehen Sie zu Anmelden';
	@override String get resetpassword => 'Passwort zurücksetzen';
	@override String get logintoaccount => 'Sie haben bereits ein Konto? ';
	@override String get emptyfielderrorhint => 'Sie müssen alle Felder ausfüllen';
	@override String get invalidemailerrorhint => 'Sie müssen eine gültige E-Mail-Adresse eingeben';
	@override String get passwordsdontmatch => 'Passwörter stimmen nicht überein';
	@override String get processingpleasewait => 'Verarbeite .. Bitte warten...';
	@override String get createaccount => 'Ein Konto erstellen';
	@override String get forgotpassword => 'Passwort vergessen?';
	@override String get orloginwith => 'Oder melden Sie sich an mit';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mehr Optionen';
	@override String get about => 'Über uns';
	@override String get privacy => 'Datenschutzrichtlinie';
	@override String get terms => 'App-Bedingungen';
	@override String get rate => 'Bewertungs App';
	@override String get version => 'Ausführung';
	@override String get pulluploadmore => 'Last hochziehen';
	@override String get loadfailedretry => 'Laden fehlgeschlagen! Klicken Sie auf „Wiederholen“!';
	@override String get releaseloadmore => 'loslassen, um mehr zu laden';
	@override String get nomoredata => 'Keine Daten mehr';
	@override String get errorReportingComment => 'Kommentar zur Fehlerberichterstattung';
	@override String get reportingComment => 'Meldekommentar';
	@override String get reportcomment => 'Berichtsoptionen';
	@override List<String> get reportCommentsList => [
		'Contenu commercial indésirable ou spam',
		'Pornographie ou matériel sexuel explicite',
		'Discours haineux ou violence graphique',
		'Harcèlement ou intimidation',
	];
	@override String get bookmarksMedia => 'Meine Lesezeichen';
	@override String get noitemstodisplay => 'Keine anzuzeigenden Elemente vorhanden';
	@override String get loginrequired => 'Anmeldung erforderlich';
	@override String get loginrequiredhint => 'Um sich auf dieser Plattform anzumelden, müssen Sie angemeldet sein. Erstellen Sie jetzt ein kostenloses Konto oder melden Sie sich bei Ihrem bestehenden Konto an.';
	@override String get subscriptions => 'App-Abonnements';
	@override String get subscribe => 'ABONNIEREN';
	@override String get subscribehint => 'Abonnement erforderlich';
	@override String get playsubscriptionrequiredhint => 'Sie müssen sich anmelden, bevor Sie diese Medien anhören oder ansehen können.';
	@override String get previewsubscriptionrequiredhint => 'Sie haben die zulässige Vorschaudauer für dieses Medium erreicht. ';
	@override String get copiedtoclipboard => 'In die Zwischenablage kopiert';
	@override String get downloadbible => 'Bibel herunterladen';
	@override String get downloadversion => 'Herunterladen';
	@override String get downloading => 'wird heruntergeladen';
	@override String get failedtodownload => 'Download fehlgeschlagen';
	@override String get pleaseclicktoretry => 'Bitte klicken Sie, um es erneut zu versuchen.';
	@override String get of => 'Von';
	@override String get nobibleversionshint => 'Es sind keine Bibeldaten vorhanden. Klicken Sie auf die Schaltfläche unten, um mindestens eine Bibelversion herunterzuladen.';
	@override String get downloaded => 'Heruntergeladen';
	@override String get enteremailaddresstoresetpassword => 'Geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen';
	@override String get backtologin => 'ZURÜCK ZUR ANMELDUNG';
	@override String get signintocontinue => 'Melden Sie sich an, um fortzufahren';
	@override String get signin => 'ANMELDEN';
	@override String get signinforanaccount => 'FÜR EINEN ACCOUNT ANMELDEN?';
	@override String get alreadyhaveanaccount => 'Sie haben bereits ein Konto?';
	@override String get updateprofile => 'Profil aktualisieren';
	@override String get updateprofilehint => 'Bitte aktualisieren Sie zunächst Ihre Profilseite. Dies wird uns dabei helfen, Sie mit anderen Menschen in Kontakt zu bringen';
	@override String get autoplayvideos => 'AutoPlay-Videos';
	@override String get gosocial => 'Gehen Sie sozial';
	@override String get searchbible => 'Bibel durchsuchen';
	@override String get filtersearchoptions => 'Suchoptionen filtern';
	@override String get narrowdownsearch => 'Verwenden Sie die Filterschaltfläche unten, um die Suche einzugrenzen und ein genaueres Ergebnis zu erhalten.';
	@override String get searchbibleversion => 'Bibelversion suchen';
	@override String get searchbiblebook => 'Bibelbuch durchsuchen';
	@override String get search => 'Suchen';
	@override String get setBibleBook => 'Bibelbuch einstellen';
	@override String get oldtestament => 'Altes Testament';
	@override String get newtestament => 'Neues Testament';
	@override String get limitresults => 'Ergebnisse begrenzen';
	@override String get setfilters => 'Filter festlegen';
	@override String get bibletranslator => 'Bibelübersetzer';
	@override String get chapter => ' Kapitel ';
	@override String get verse => ' Vers ';
	@override String get translate => 'übersetzen';
	@override String get bibledownloadinfo => 'Bibel-Download gestartet. Bitte schließen Sie diese Seite nicht, bis der Download abgeschlossen ist.';
	@override String get received => 'erhalten';
	@override String get outoftotal => 'insgesamt';
	@override String get set => 'SATZ';
	@override String get selectColor => 'Wähle Farbe';
	@override String get switchbibleversion => 'Wechseln Sie die Bibelversion';
	@override String get switchbiblebook => 'Bibelbuch wechseln';
	@override String get gotosearch => 'Gehe zum Kapitel';
	@override String get changefontsize => 'Schriftgröße ändern';
	@override String get font => 'Schriftart';
	@override String get readchapter => 'Kapitel lesen';
	@override String get showhighlightedverse => 'Hervorgehobene Verse anzeigen';
	@override String get downloadmoreversions => 'Laden Sie weitere Versionen herunter';
	@override String get suggestedusers => 'Empfohlene Benutzer zum Folgen';
	@override String get unfollow => 'Nicht mehr folgen';
	@override String get follow => 'Folgen';
	@override String get searchforpeople => 'Suche nach Personen';
	@override String get viewpost => 'Beitrag anzeigen';
	@override String get viewprofile => 'Profil anzeigen';
	@override String get mypins => 'Meine Pins';
	@override String get viewpinnedposts => 'Angepinnte Beiträge anzeigen';
	@override String get personal => 'persönlich';
	@override String get update => 'Aktualisieren';
	@override String get phonenumber => 'Telefonnummer';
	@override String get showmyphonenumber => 'Benutzern meine Telefonnummer anzeigen';
	@override String get dateofbirth => 'Geburtsdatum';
	@override String get showmyfulldateofbirth => 'Den Leuten, die meinen Status ansehen, mein vollständiges Geburtsdatum anzeigen';
	@override String get notifications => 'Benachrichtigungen';
	@override String get notifywhenuserfollowsme => 'Benachrichtigen Sie mich, wenn mir ein Benutzer folgt';
	@override String get notifymewhenusercommentsonmypost => 'Benachrichtigen Sie mich, wenn Benutzer meinen Beitrag kommentieren';
	@override String get notifymewhenuserlikesmypost => 'Benachrichtigen Sie mich, wenn Benutzern mein Beitrag gefällt';
	@override String get churchsocial => 'Kirchensozial';
	@override String get shareyourthoughts => 'Teile deine Gedanken';
	@override String get readmore => '...Mehr lesen';
	@override String get less => ' Weniger';
	@override String get couldnotprocess => 'Die angeforderte Aktion konnte nicht verarbeitet werden.';
	@override String get pleaseselectprofilephoto => 'Bitte wählen Sie ein Profilfoto zum Hochladen aus';
	@override String get pleaseselectprofilecover => 'Bitte wählen Sie ein Titelbild zum Hochladen aus';
	@override String get updateprofileerrorhint => 'Sie müssen Ihren Namen, Ihr Geburtsdatum, Ihr Geschlecht, Ihre Telefonnummer und Ihren Standort eingeben, bevor Sie fortfahren können.';
	@override String get gender => 'Geschlecht';
	@override String get male => 'Männlich';
	@override String get female => 'Weiblich';
	@override String get dob => 'Geburtsdatum';
	@override String get location => 'Aktueller Standort';
	@override String get qualification => 'Qualifikation';
	@override String get aboutme => 'Über mich';
	@override String get facebookprofilelink => 'Facebook-Profillink';
	@override String get twitterprofilelink => 'Twitter-Profillink';
	@override String get linkdln => 'Linkedln-Profillink';
	@override String get likes => 'Likes';
	@override String get likess => 'Likes)';
	@override String get pinnedposts => 'Meine angepinnten Beiträge';
	@override String get unpinpost => 'Beitrag entfernen';
	@override String get unpinposthint => 'Möchten Sie diesen Beitrag aus Ihren angepinnten Beiträgen entfernen?';
	@override String get postdetails => 'Beitragsdetails';
	@override String get posts => 'Beiträge';
	@override String get followers => 'Anhänger';
	@override String get followings => 'Folgendes';
	@override String get my => 'Mein';
	@override String get edit => 'Bearbeiten';
	@override String get delete => 'Löschen';
	@override String get deletepost => 'Beitrag entfernen';
	@override String get deleteposthint => 'Möchten Sie diesen Beitrag löschen? ';
	@override String get maximumallowedsizehint => 'Maximal zulässiger Datei-Upload erreicht';
	@override String get maximumuploadsizehint => 'Die ausgewählte Datei überschreitet die zulässige Dateigrößenbeschränkung für den Upload.';
	@override String get makeposterror => 'Das Verfassen des Beitrags ist im Moment nicht möglich. Bitte klicken Sie, um es erneut zu versuchen.';
	@override String get makepost => 'Beitrag erstellen';
	@override String get selectfile => 'Datei aussuchen';
	@override String get images => 'Bilder';
	@override String get shareYourThoughtsNow => 'Teile deine Gedanken ...';
	@override String get photoviewer => 'Fotobetrachter';
	@override String get nochatsavailable => 'Keine Gespräche verfügbar \n ';
	@override String get typing => 'Tippen...';
	@override String get photo => 'Foto';
	@override String get online => 'Online';
	@override String get offline => 'Offline';
	@override String get lastseen => 'Zuletzt gesehen';
	@override String get deleteselectedhint => 'Durch diese Aktion werden die ausgewählten Nachrichten gelöscht.  ';
	@override String get deleteselected => 'Ausgewählte löschen';
	@override String get unabletofetchconversation => 'Abruf nicht möglich \n \n';
	@override String get loadmoreconversation => 'Laden Sie weitere Konversationen';
	@override String get sendyourfirstmessage => 'Senden Sie Ihre erste Nachricht an \n';
	@override String get unblock => 'Entsperren ';
	@override String get block => 'Block';
	@override String get writeyourmessage => 'Schreibe deine Nachricht...';
	@override String get clearconversation => 'Klare Unterhaltung';
	@override String get clearconversationhintone => 'Durch diese Aktion werden alle Ihre Gespräche gelöscht ';
	@override String get clearconversationhinttwo => '.\n  ';
	@override String get facebookloginerror => 'Beim Anmeldevorgang ist ein Fehler aufgetreten.\n';

	@override String get mylibrary => 'Meine Bibliothek';
	@override String get prayer_request => 'Gebetsanliegen oder Zeugnis';
	@override String get mySubscription => 'Mein Abonnement';
	@override String get giveandpart => 'Geben und Partnerschaft';
	@override String get follow_us => 'Folge uns auf';
	@override String get profile => 'Profil';
	@override String get no_phone => 'Kein Handy';
	@override String get no_address => 'Keine Adresse';
	@override String get changepwd => 'Kennwort ändern';
	@override String get help_support => 'Hilfe und Unterstützung';
	@override String get quest_logout => 'Möchten Sie sich von der App abmelden?';
	@override String get no => 'NEIN';
	@override String get yes => 'JA';
	@override String get enjoy_using => 'Viel Spaß beim Benutzen ';
	@override String get tap_rate => 'Tippen Sie im App Store auf einen Stern und bewerten Sie es ';
	@override String get please_rate => 'Bitte geben Sie Ihre Bewertung ein ';
	@override String get submit => 'einreichen';
	@override String get select_email => 'Wählen Sie die E-Mail-App zum Verfassen aus';
	@override String get open_mail => 'Öffnen Sie die Mail-App';
	@override String get no_mailer => 'Keine Mail-Apps installiert';
	@override String get login_request => 'Melden Sie sich an, um die Anfrage anzuzeigen';
	@override String get empty => 'Leer';
	@override String get send_prayer => 'Kein Artikel gefunden \n ';
	@override String get podcast => 'Podcast';
	@override String get new_prayer_req => 'Neue Gebetsanliegen oder Zeugnisse';
	@override String get read_more => 'MEHR LESEN';
	@override String get details => 'Einzelheiten';
	@override String get added_bookmark => 'Zum Lesezeichen hinzugefügt';
	@override String get removed_bookmark => 'Aus Lesezeichen entfernt';
	@override String get delete_account => 'Konto löschen';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Select Language',
			'chooseapplanguage': 'Choose App Language',
			'nightmode': 'Night Mode',
			'initializingapp': 'initializing...',
			'home': 'Home',
			'branches': 'Branches',
			'inbox': 'Inbox',
			'downloads': 'Downloads',
			'settings': 'Settings',
			'events': 'Events',
			'myplaylists': 'My Playlists',
			'website': 'Website',
			'hymns': 'Hymns',
			'articles': 'Articles',
			'notes': 'Notes',
			'donate': 'Donate',
			'savenotetitle': 'Note Title',
			'nonotesfound': 'No notes found',
			'newnote': 'New',
			'deletenote': 'Delete Note',
			'deletenotehint': 'Do you want to delete this note? This action cannot be reversed.',
			'bookmarks': 'Bookmarks',
			'socialplatforms': 'Social Platforms',
			'onboardingpagetitles.0': 'YOUR DAILY LIGHT',
			'onboardingpagetitles.1': 'CREATE AN ACCOUNT',
			'onboardingpagetitles.2': 'SHARE',
			'onboardingpagetitles.3': ' STAY UP TO DATE ',
			'onboardingpagehints.0': 'Find daily illumination from God’s word through devotionals and podcasts',
			'onboardingpagehints.1': 'Access inspirational content, build your personal library and bring God’s word with you anywhere',
			'onboardingpagehints.2': 'Share or read inspiring testimonies from around the world. Share prayer requests and find timely support',
			'onboardingpagehints.3': 'Know what God is saying for the season, stay updated about events and discover ways to join the movement',
			'next': 'NEXT',
			'done': 'Get Started',
			'quitapp': 'Quit App!',
			'quitappwarning': 'Do you wish to close the app?',
			'quitappaudiowarning': 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.',
			'ok': 'Ok',
			'retry': 'RETRY',
			'oops': 'Ooops!',
			'save': 'Save',
			'cancel': 'Cancel',
			'error': 'Error',
			'success': 'Success',
			'skip': 'Skip',
			'skiplogin': 'Skip Login',
			'skipregister': 'Skip Registration',
			'dataloaderror': 'Could not load requested data at the moment, check your data connection and click to retry.',
			'suggestedforyou': 'Suggested for you',
			'videomessages': 'Video Messages',
			'audiomessages': 'Audio Messages',
			'devotionals': 'Devotionals',
			'categories': 'Categories',
			'category': 'Category',
			'videos': 'Videos',
			'audios': 'Audios',
			'biblebooks': 'Bible',
			'audiobible': 'Audio Bible',
			'livestreams': 'Livestreams',
			'radio': 'Radio',
			'allitems': 'All Items',
			'emptyplaylist': 'No Playlists',
			'notsupported': 'Not Supported',
			'cleanupresources': 'Cleaning up resources',
			'grantstoragepermission': 'Please grant accessing storage permission to continue',
			'sharefiletitle': 'Watch or Listen to ',
			'sharefilebody': 'Via MyChurch App, Download now at ',
			'sharetext': 'Enjoy unlimited Audio & Video streaming',
			'sharetexthint': 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at',
			'download': 'Download',
			'addplaylist': 'Add to playlist',
			'bookmark': 'Bookmark',
			'unbookmark': 'UnBookmark',
			'share': 'Share',
			'deletemedia': 'Delete File',
			'deletemediahint': 'Do you wish to delete this downloaded file? This action cannot be undone.',
			'searchhint': 'Search Audio & Video Messages',
			'performingsearch': 'Searching Audios and Videos',
			'nosearchresult': 'No results Found',
			'nosearchresulthint': 'Try input more general keyword',
			'addtoplaylist': 'Add to playlist',
			'newplaylist': 'New playlist',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'Media added to playlist.',
			'mediaremovedfromplaylist': 'Media removed from playlist',
			'clearplaylistmedias': 'Clear All Media',
			'deletePlayList': 'Delete Playlist',
			'clearplaylistmediashint': 'Go ahead and remove all media from this playlist?',
			'deletePlayListhint': 'Go ahead and delete this playlist and clear all media?',
			'comments': 'Comments',
			'replies': 'Replies',
			'reply': 'Reply',
			'logintoaddcomment': 'Login to add a comment',
			'logintoreply': 'Login to reply',
			'writeamessage': 'Write a message...',
			'nocomments': 'No Comments found \nclick to retry',
			'errormakingcomments': 'Cannot process commenting at the moment..',
			'errordeletingcomments': 'Cannot delete this comment at the moment..',
			'erroreditingcomments': 'Cannot edit this comment at the moment..',
			'errorloadingmorecomments': 'Cannot load more comments at the moment..',
			'deletingcomment': 'Deleting comment',
			'editingcomment': 'Editing comment',
			'deletecommentalert': 'Delete Comment',
			'editcommentalert': 'Edit Comment',
			'deletecommentalerttext': 'Do you wish to delete this comment? This action cannot be undone',
			'loadmore': 'load more',
			'messages': 'Messages',
			'guestuser': 'Guest User',
			'fullname': 'Full Name',
			'emailaddress': 'Email Address',
			'password': 'Password',
			'repeatpassword': 'Repeat Password',
			'register': 'Register',
			'login': 'Login',
			'logout': 'Logout',
			'logoutfromapp': 'Logout from app?',
			'logoutfromapphint': 'You wont be able to like or comment on articles and videos if you are not logged in.',
			'gotologin': 'Go to Login',
			'resetpassword': 'Reset Password',
			'logintoaccount': 'Already have an account? Login',
			'emptyfielderrorhint': 'You need to fill all the fields',
			'invalidemailerrorhint': 'You need to enter a valid email address',
			'passwordsdontmatch': 'Passwords dont match',
			'processingpleasewait': 'Processing, Please wait...',
			'createaccount': 'Create an account',
			'forgotpassword': 'Forgot Password?',
			'orloginwith': 'Or Login With',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'More Options',
			'about': 'About Us',
			'privacy': 'Privacy Policy',
			'terms': 'App Terms',
			'rate': 'Rate App',
			'version': 'Version',
			'pulluploadmore': 'pull up load',
			'loadfailedretry': 'Load Failed!Click retry!',
			'releaseloadmore': 'release to load more',
			'nomoredata': 'No more Data',
			'errorReportingComment': 'Error Reporting Comment',
			'reportingComment': 'Reporting Comment',
			'reportcomment': 'Report Options',
			'reportCommentsList.0': 'Unwanted commercial content or spam',
			'reportCommentsList.1': 'Pornography or sexual explicit material',
			'reportCommentsList.2': 'Hate speech or graphic violence',
			'reportCommentsList.3': 'Harassment or bullying',
			'bookmarksMedia': 'My Bookmarks',
			'noitemstodisplay': 'No Items To Display',
			'loginrequired': 'Login Required',
			'loginrequiredhint': 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.',
			'subscriptions': 'App Subscriptions',
			'subscribe': 'SUBSCRIBE',
			'subscribehint': 'Subscription Required',
			'playsubscriptionrequiredhint': 'You need to subscribe before you can listen to or watch this media.',
			'previewsubscriptionrequiredhint': 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.',
			'copiedtoclipboard': 'Copied to clipboard',
			'downloadbible': 'Download Bible',
			'downloadversion': 'Download',
			'downloading': 'Downloading',
			'failedtodownload': 'Failed to download',
			'pleaseclicktoretry': 'Please click to retry.',
			'of': 'Of',
			'nobibleversionshint': 'There is no bible data to display, click on the button below to download atleast one bible version.',
			'downloaded': 'Downloaded',
			'enteremailaddresstoresetpassword': 'Enter your email to reset your password',
			'backtologin': 'BACK TO LOGIN',
			'signintocontinue': 'Sign in to continue',
			'signin': 'S I G N  I N',
			'signinforanaccount': 'SIGN UP FOR AN ACCOUNT?',
			'alreadyhaveanaccount': 'Already have an account?',
			'updateprofile': 'Update Profile',
			'updateprofilehint': 'To get started, please update your profile page, this will help us in connecting you with other people',
			'autoplayvideos': 'AutoPlay Videos',
			'gosocial': 'Go Social',
			'searchbible': 'Search Bible',
			'filtersearchoptions': 'Filter Search Options',
			'narrowdownsearch': 'Use the filter button below to narrow down search for a more precise result.',
			'searchbibleversion': 'Search Bible Version',
			'searchbiblebook': 'Search Bible Book',
			'search': 'Search',
			'setBibleBook': 'Set Bible Book',
			'oldtestament': 'Old Testament',
			'newtestament': 'New Testament',
			'limitresults': 'Limit Results',
			'setfilters': 'Set Filters',
			'bibletranslator': 'Bible Translator',
			'chapter': ' Chapter ',
			'verse': ' Verse ',
			'translate': 'translate',
			'bibledownloadinfo': 'Bible Download started, Please do not close this page until the download is done.',
			'received': 'received',
			'outoftotal': 'out of total',
			'set': 'SET',
			'selectColor': 'Select Color',
			'switchbibleversion': 'Switch Bible Version',
			'switchbiblebook': 'Switch Bible Book',
			'gotosearch': 'Go to Chapter',
			'changefontsize': 'Change Font Size',
			'font': 'Font',
			'readchapter': 'Read Chapter',
			'showhighlightedverse': 'Show Highlighted Verses',
			'downloadmoreversions': 'Download more versions',
			'suggestedusers': 'Suggested users to follow',
			'unfollow': 'UnFollow',
			'follow': 'Follow',
			'searchforpeople': 'Search for people',
			'viewpost': 'View Post',
			'viewprofile': 'View Profile',
			'mypins': 'My Pins',
			'viewpinnedposts': 'View Pinned Posts',
			'personal': 'Personal',
			'update': 'Update',
			'phonenumber': 'Phone Number',
			'showmyphonenumber': 'Show my phone number to users',
			'dateofbirth': 'Date of Birth',
			'showmyfulldateofbirth': 'Show my full date of birth to people viewing my status',
			'notifications': 'Notifications',
			'notifywhenuserfollowsme': 'Notify me when a user follows me',
			'notifymewhenusercommentsonmypost': 'Notify me when users comment on my post',
			'notifymewhenuserlikesmypost': 'Notify me when users like my post',
			'churchsocial': 'Church Social',
			'shareyourthoughts': 'Share your thoughts',
			'readmore': '...Read more',
			'less': ' Less',
			'couldnotprocess': 'Could not process requested action.',
			'pleaseselectprofilephoto': 'Please select a profile photo to upload',
			'pleaseselectprofilecover': 'Please select a cover photo to upload',
			'updateprofileerrorhint': 'You need to fill your name, date of birth, gender, phone and location before you can proceed.',
			'gender': 'Gender',
			'male': 'Male',
			'female': 'Female',
			'dob': 'Date Of Birth',
			'location': 'Current Location',
			'qualification': 'Qualification',
			'aboutme': 'About Me',
			'facebookprofilelink': 'Facebook Profile Link',
			'twitterprofilelink': 'Twitter Profile Link',
			'linkdln': 'Linkedln Profile Link',
			'likes': 'Likes',
			'likess': 'Like(s)',
			'pinnedposts': 'My Pinned Posts',
			'unpinpost': 'Unpin Post',
			'unpinposthint': 'Do you wish to remove this post from your pinned posts?',
			'postdetails': 'Post Details',
			'posts': 'Posts',
			'followers': 'Followers',
			'followings': 'Followings',
			'my': 'My',
			'edit': 'Edit',
			'delete': 'Delete',
			'deletepost': 'Delete Post',
			'deleteposthint': 'Do you wish to delete this post? Posts can still appear on some users feeds.',
			'maximumallowedsizehint': 'Maximum allowed file upload reached',
			'maximumuploadsizehint': 'The selected file exceeds the allowed upload file size limit.',
			'makeposterror': 'Unable to make post at the moment, please click to retry.',
			'makepost': 'Make Post',
			'selectfile': 'Select File',
			'images': 'Images',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Photo Viewer',
			'nochatsavailable': 'No Conversations available \n Click the add icon below \nto select users to chat with',
			'typing': 'Typing...',
			'photo': 'Photo',
			'online': 'Online',
			'offline': 'Offline',
			'lastseen': 'Last Seen',
			'deleteselectedhint': 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.',
			'deleteselected': 'Delete selected',
			'unabletofetchconversation': 'Unable to Fetch \nyour conversation with \n',
			'loadmoreconversation': 'Load more conversations',
			'sendyourfirstmessage': 'Send your first message to \n',
			'unblock': 'Unblock ',
			'block': 'Block',
			'writeyourmessage': 'Write your message...',
			'clearconversation': 'Clear Conversation',
			'clearconversationhintone': 'This action will clear all your conversation with ',
			'clearconversationhinttwo': '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			"mylibrary":"My Library",
			"prayer_request":"Prayer Request or Testimony",
			"mySubscription":"My Subscription",
			"giveandpart":"Giving and PartnerShip",
			"follow_us":"Follow us on",
			"profile":"Profile",
			"no_phone":"No Phone",
			"no_address":"No address",
			"changepwd":"Change Password",
			"help_support":"Help and Support",
			"quest_logout":"Do you want to logout from the app?",
			"no":"No",
			"yes":"YES",
			"enjoy_using":"Enjoy Using ",
			"tap_rate":"Tap a star rate it on the App Store ",
			"please_rate":"Please Enter Your Rating ",
			"submit":"submit",
			"select_email":"Select email app to compose",
			"open_mail":"Open Mail Appe",
			"no_mailer":"No mail apps installed",
			"login_request":"Login to View Request",
			"empty":"Empty",
			"send_prayer":"No Item Found \n Send a New Prayer Request or Testimony",
			"podcast":"PodCast",
			"new_prayer_req":"New Prayer Request or Testimony",
			"read_more":"READ MORE",
			"details":"Details",
			"added_bookmark":"Added to Bookmark",
			"removed_bookmark":"Removed from Bookmark",
		"delete_account":"Delete Account"
		};
	}
}

extension on _StringsFr {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Choisir la langue',
			'chooseapplanguage': 'Choisissez la langue de l\'application',
			'nightmode': 'Mode nuit',
			'initializingapp': 'initialisation...',
			'home': 'Accueil',
			'branches': 'Branches',
			'inbox': 'Boîte de réception',
			'downloads': 'Téléchargements',
			'settings': 'Paramètres',
			'events': 'Événements',
			'myplaylists': 'Mes listes de lecture',
			'nonotesfound': 'Aucune note trouvée',
			'newnote': 'Nouveau',
			'website': 'Site Internet',
			'hymns': 'Hymnes',
			'articles': 'Des articles',
			'notes': 'Remarques',
			'donate': 'Faire un don',
			'deletenote': 'Supprimer la note',
			'deletenotehint': 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.',
			'savenotetitle': 'Titre de la note',
			'bookmarks': 'Favoris',
			'socialplatforms': 'Plateformes sociales',
			'onboardingpagetitles.0': 'Bienvenue à Your Daily Light',
			'onboardingpagetitles.1': 'Plein de fonctionnalités',
			'onboardingpagetitles.2': 'Audio, Video \n et diffusion en direct',
			'onboardingpagetitles.3': 'Créer un compte',
			'onboardingpagehints.0': 'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.',
			'onboardingpagehints.1': 'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.',
			'onboardingpagehints.2': 'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.',
			'onboardingpagehints.3': 'Commencez votre voyage vers une expérience de culte sans fin.',
			'next': 'SUIVANT',
			'done': 'COMMENCER',
			'quitapp': 'Quitter l\'application!',
			'quitappwarning': 'Souhaitez-vous fermer l\'application?',
			'quitappaudiowarning': 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.',
			'ok': 'D\'accord',
			'retry': 'RECOMMENCEZ',
			'oops': 'Oups!',
			'save': 'sauver',
			'cancel': 'Annuler',
			'error': 'Erreur',
			'success': 'Succès',
			'skip': 'Sauter',
			'skiplogin': 'Passer l\'identification',
			'skipregister': 'Sauter l\'inscription',
			'dataloaderror': 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.',
			'suggestedforyou': 'Suggéré pour vous',
			'devotionals': 'Dévotion',
			'categories': 'Catégories',
			'category': 'Catégorie',
			'videos': 'Vidéos',
			'audios': 'Audios',
			'biblebooks': 'Bible',
			'audiobible': 'Bible audio',
			'livestreams': 'Livestreams',
			'radio': 'Radio',
			'allitems': 'Tous les articles',
			'emptyplaylist': 'Aucune liste de lecture',
			'notsupported': 'Non supporté',
			'cleanupresources': 'Nettoyage des ressources',
			'grantstoragepermission': 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer',
			'sharefiletitle': 'Regarder ou écouter ',
			'sharefilebody': 'Via Your Daily Light App, Téléchargez maintenant sur ',
			'sharetext': 'Profitez d\'un streaming audio et vidéo illimité',
			'sharetexthint': 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur',
			'download': 'Télécharger',
			'addplaylist': 'Ajouter à la playlist',
			'bookmark': 'Signet',
			'unbookmark': 'Supprimer les favoris',
			'share': 'Partager',
			'deletemedia': 'Supprimer le fichier',
			'deletemediahint': 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.',
			'searchhint': 'Rechercher des messages audio et vidéo',
			'performingsearch': 'Recherche d\'audio et de vidéos',
			'nosearchresult': 'Aucun résultat trouvé',
			'nosearchresulthint': 'Essayez de saisir un mot clé plus général',
			'addtoplaylist': 'Ajouter à la playlist',
			'newplaylist': 'Nouvelle playlist',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'Média ajouté à la playlist.',
			'mediaremovedfromplaylist': 'Média supprimé de la playlist',
			'clearplaylistmedias': 'Effacer tous les médias',
			'deletePlayList': 'Supprimer la playlist',
			'clearplaylistmediashint': 'Voulez-vous supprimer tous les médias de cette liste de lecture?',
			'deletePlayListhint': 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?',
			'videomessages': 'Messages vidéo',
			'audiomessages': 'Messages audio',
			'comments': 'commentaires',
			'replies': 'réponses',
			'reply': 'Répondre',
			'logintoaddcomment': 'Connectez-vous pour ajouter un commentaire',
			'logintoreply': 'Connectez-vous pour répondre',
			'writeamessage': 'Écrire un message...',
			'nocomments': 'Aucun commentaire trouvé \ncliquez pour réessayer',
			'errormakingcomments': 'Impossible de traiter les commentaires pour le moment..',
			'errordeletingcomments': 'Impossible de supprimer ce commentaire pour le moment..',
			'erroreditingcomments': 'Impossible de modifier ce commentaire pour le moment..',
			'errorloadingmorecomments': 'Impossible de charger plus de commentaires pour le moment..',
			'deletingcomment': 'Suppression du commentaire',
			'editingcomment': 'Modification du commentaire',
			'deletecommentalert': 'Supprimer le commentaire',
			'editcommentalert': 'Modifier le commentaire',
			'deletecommentalerttext': 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée',
			'loadmore': 'charger plus',
			'messages': 'Messages',
			'guestuser': 'Utilisateur invité',
			'fullname': 'Nom complet',
			'emailaddress': 'Adresse électronique',
			'password': 'Mot de passe',
			'repeatpassword': 'Répéter le mot de passe',
			'register': 'S\'inscrire',
			'login': 'S\'identifier',
			'logout': 'Se déconnecter',
			'logoutfromapp': 'Déconnexion de l\'application?',
			'logoutfromapphint': 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.',
			'gotologin': 'Aller à la connexion',
			'resetpassword': 'réinitialiser le mot de passe',
			'logintoaccount': 'Vous avez déjà un compte? S\'identifier',
			'emptyfielderrorhint': 'Vous devez remplir tous les champs',
			'invalidemailerrorhint': 'Vous devez saisir une adresse e-mail valide',
			'passwordsdontmatch': 'Les mots de passe ne correspondent pas',
			'processingpleasewait': 'Traitement, veuillez patienter...',
			'createaccount': 'Créer un compte',
			'forgotpassword': 'Mot de passe oublié?',
			'orloginwith': 'Ou connectez-vous avec',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Plus d\'options',
			'about': 'À propos de nous',
			'privacy': 'confidentialité',
			'terms': 'Termes de l\'application',
			'rate': 'Application de taux',
			'version': 'Version',
			'pulluploadmore': 'tirer la charge',
			'loadfailedretry': 'Échec du chargement! Cliquez sur Réessayer!',
			'releaseloadmore': 'relâchez pour charger plus',
			'nomoredata': 'Plus de données',
			'errorReportingComment': 'Commentaire de rapport d\'erreur',
			'reportingComment': 'Signaler un commentaire',
			'reportcomment': 'Options de rapport',
			'reportCommentsList.0': 'Contenu commercial indésirable ou spam',
			'reportCommentsList.1': 'Pornographie ou matériel sexuel explicite',
			'reportCommentsList.2': 'Discours haineux ou violence graphique',
			'reportCommentsList.3': 'Harcèlement ou intimidation',
			'bookmarksMedia': 'Mes marque-pages',
			'noitemstodisplay': 'Aucun élément à afficher',
			'loginrequired': 'Connexion requise',
			'loginrequiredhint': 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.',
			'subscriptions': 'Abonnements aux applications',
			'subscribe': 'SOUSCRIRE',
			'subscribehint': 'Abonnement requis',
			'playsubscriptionrequiredhint': 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.',
			'previewsubscriptionrequiredhint': 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.',
			'copiedtoclipboard': 'Copié dans le presse-papier',
			'downloadbible': 'Télécharger la Bible',
			'downloadversion': 'Télécharger',
			'downloading': 'Téléchargement',
			'failedtodownload': 'Échec du téléchargement',
			'pleaseclicktoretry': 'Veuillez cliquer pour réessayer.',
			'of': 'De',
			'nobibleversionshint': 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.',
			'downloaded': 'Téléchargé',
			'enteremailaddresstoresetpassword': 'Entrez votre e-mail pour réinitialiser votre mot de passe',
			'backtologin': 'RETOUR CONNEXION',
			'signintocontinue': 'Connectez-vous pour continuer',
			'signin': 'SE CONNECTER',
			'signinforanaccount': 'INSCRIVEZ-VOUS POUR UN COMPTE?',
			'alreadyhaveanaccount': 'Vous avez déjà un compte?',
			'updateprofile': 'Mettre à jour le profil',
			'updateprofilehint': 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes',
			'autoplayvideos': 'Vidéos de lecture automatique',
			'gosocial': 'Passez aux réseaux sociaux',
			'searchbible': 'Rechercher dans la Bible',
			'filtersearchoptions': 'Filtrer les options de recherche',
			'narrowdownsearch': 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.',
			'searchbibleversion': 'Rechercher la version de la Bible',
			'searchbiblebook': 'Rechercher un livre biblique',
			'search': 'Chercher',
			'setBibleBook': 'Définir le livre de la Bible',
			'oldtestament': 'L\'Ancien Testament',
			'newtestament': 'Nouveau Testament',
			'limitresults': 'Limiter les résultats',
			'setfilters': 'Définir les filtres',
			'bibletranslator': 'Traducteur de la Bible',
			'chapter': ' Chapitre ',
			'verse': ' Verset ',
			'translate': 'traduire',
			'bibledownloadinfo': 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.',
			'received': 'reçu',
			'outoftotal': 'sur le total',
			'set': 'ENSEMBLE',
			'selectColor': 'Select Color',
			'switchbibleversion': 'Changer de version de la Bible',
			'switchbiblebook': 'Changer de livre biblique',
			'gotosearch': 'Aller au chapitre',
			'changefontsize': 'Changer la taille de la police',
			'font': 'Police de caractère',
			'readchapter': 'Lire le chapitre',
			'showhighlightedverse': 'Afficher les versets en surbrillance',
			'downloadmoreversions': 'Télécharger plus de versions',
			'suggestedusers': 'Utilisateurs suggérés à suivre',
			'unfollow': 'Ne pas suivre',
			'follow': 'Suivre',
			'searchforpeople': 'Recherche de personnes',
			'viewpost': 'Voir l\'article',
			'viewprofile': 'Voir le profil',
			'mypins': 'Mes épingles',
			'viewpinnedposts': 'Afficher les messages épinglés',
			'personal': 'Personnel',
			'update': 'Mettre à jour',
			'phonenumber': 'Numéro de téléphone',
			'showmyphonenumber': 'Afficher mon numéro de téléphone aux utilisateurs',
			'dateofbirth': 'Date de naissance',
			'showmyfulldateofbirth': 'Afficher ma date de naissance complète aux personnes qui consultent mon statut',
			'notifications': 'Notifications',
			'notifywhenuserfollowsme': 'M\'avertir lorsqu\'un utilisateur me suit',
			'notifymewhenusercommentsonmypost': 'M\'avertir lorsque les utilisateurs commentent mon message',
			'notifymewhenuserlikesmypost': 'M\'avertir lorsque les utilisateurs aiment mon message',
			'churchsocial': 'Église sociale',
			'shareyourthoughts': 'Partage tes pensées',
			'readmore': '...Lire la suite',
			'less': ' Moins',
			'couldnotprocess': 'Impossible de traiter l\'action demandée.',
			'pleaseselectprofilephoto': 'Veuillez sélectionner une photo de profil à télécharger',
			'pleaseselectprofilecover': 'Veuillez sélectionner une photo de couverture à télécharger',
			'updateprofileerrorhint': 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.',
			'gender': 'Le sexe',
			'male': 'Mâle',
			'female': 'Femme',
			'dob': 'Date de naissance',
			'location': 'Localisation actuelle',
			'qualification': 'Qualification',
			'aboutme': 'À propos de moi',
			'facebookprofilelink': 'Lien de profil Facebook',
			'twitterprofilelink': 'Lien de profil Twitter',
			'linkdln': 'Lien de profil Linkedln',
			'likes': 'Aime',
			'likess': 'Comme',
			'pinnedposts': 'Mes messages épinglés',
			'unpinpost': 'Détacher le message',
			'unpinposthint': 'Souhaitez-vous supprimer ce message de vos messages épinglés?',
			'postdetails': 'Détails de l\'article',
			'posts': 'Des postes',
			'followers': 'Suiveurs',
			'followings': 'Suivi',
			'my': 'Mon',
			'edit': 'Éditer',
			'delete': 'Supprimer',
			'deletepost': 'Supprimer le message',
			'deleteposthint': 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.',
			'maximumallowedsizehint': 'Téléchargement de fichier maximum autorisé atteint',
			'maximumuploadsizehint': 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.',
			'makeposterror': 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.',
			'makepost': 'Faire un message',
			'selectfile': 'Choisir le dossier',
			'images': 'Images',
			'shareYourThoughtsNow': 'Share your thoughts ...',
			'photoviewer': 'Visor de fotos',
			'nochatsavailable': 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter',
			'typing': 'Dactylographie...',
			'photo': 'Foto',
			'online': 'En ligne',
			'offline': 'Hors ligne',
			'lastseen': 'Dernière vue',
			'deleteselectedhint': 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.',
			'deleteselected': 'Supprimer sélectionnée',
			'unabletofetchconversation': 'Impossible de récupérer \n votre conversation avec \n',
			'loadmoreconversation': 'Charger plus de conversations',
			'sendyourfirstmessage': 'Envoyez votre premier message à \n',
			'unblock': 'Débloquer ',
			'block': 'Bloquer ',
			'writeyourmessage': 'Rédigez votre message...',
			'clearconversation': 'Conversation claire',
			'clearconversationhintone': 'Cette action effacera toute votre conversation avec ',
			'clearconversationhinttwo': '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.',
			'facebookloginerror': 'Something went wrong with the login process.\n, Here is the error Facebook gave us',
			"mylibrary": "Ma bibliothèque",
			"prayer_request": "Demande de prière ou témoignage",
			"mySubscription": "Mon abonnement",
			"giveandpart": "Don et partenariat",
			"follow_us": "Suivez-nous sur",
			"profile": "Profil",
			"no_phone": "Pas de téléphone",
			"no_address": "Pas d'adresse",
			"changepwd": "Changer le mot de passe",
			"help_support": "Aide et soutien",
			"quest_logout": "Voulez-vous vous déconnecter de l'application ?",
			"no": "Non",
			"yes": "OUI",
			"enjoy_using": "Profitez de l'utilisation ",
			"tap_rate": "Appuyez sur une étoile et notez-le sur l'App Store ",
			"please_rate": "Veuillez entrer votre note ",
			"submit": "soumettre",
			"select_email": "Sélectionnez l'application de messagerie à composer",
			"open_mail": "Ouvrir l'application Mail",
			"no_mailer": "Aucune application de messagerie installée",
			"login_request": "Connectez-vous pour afficher la demande",
			"empty": "Vide",
			"send_prayer": "Aucun élément trouvé \n ",
			"podcast": "Podcast",
			"new_prayer_req": "Nouvelle demande de prière ou témoignage",
			"read_more": "EN SAVOIR PLUS",
			"details": "Détails",
			"added_bookmark": "Ajouté aux favoris",
			"removed_bookmark": "Supprimé du signet",
		"delete_account":"Supprimer le compte"

		};
	}
}



extension on _StringsDe {
	Map<String, dynamic> _buildFlatMap() {
		return {
			"appname": "Your Daily Light",
			"appname_label": "Your Daily Light",
			"selectlanguage": "Sprache auswählen",
			"chooseapplanguage": "Wählen Sie App-Sprache",
			"nightmode": "Nacht-Modus",
			"initializingapp": "Initialisierung...",
			"home": "Heim",
			"branches": "Geäst",
			"inbox": "Posteingang",
			"downloads": "Downloads",
			"settings": "Einstellungen",
			"events": "Veranstaltungen",
			"myplaylists": "Meine Playlists",
			"website": "Webseite",
			"hymns": "Hymnen",
			"articles": "Artikel",
			"notes": "Anmerkungen",
			"donate": "Spenden",
			"savenotetitle": "Notiztitel",
			"nonotesfound": "Keine Notizen gefunden",
			"newnote": "Neu",
			"deletenote": "Notiz löschen",
			"deletenotehint": "Möchten Sie diese Notiz löschen? ",
			"bookmarks": "Lesezeichen",
			"socialplatforms": "Soziale Plattformen",
			"onboardingpagetitles": [
				"DEIN TÄGLICHES LICHT ",
				"EIN KONTO ERSTELLEN",
				"AKTIE ",
				" AUF DEM LAUFENDEN BLEIBEN "
			],
			"onboardingpagehints": [
				"Finden Sie tägliche Erleuchtung durch Gottes Wort durch Andachten und Podcasts",
				"Greifen Sie auf inspirierende Inhalte zu, bauen Sie Ihre persönliche Bibliothek auf und nehmen Sie Gottes Wort überallhin mit",
				"Teilen oder lesen Sie inspirierende Zeugnisse aus der ganzen Welt. ",
				"Erfahren Sie, was Gott für diese Saison sagt, bleiben Sie über Ereignisse auf dem Laufenden und entdecken Sie Möglichkeiten, sich der Bewegung anzuschließen"
			],
			"next": "NÄCHSTE",
			"done": "Loslegen",
			"quitapp": "Beenden Sie die App!",
			"quitappwarning": "Möchten Sie die App schließen?",
			"quitappaudiowarning": "Sie spielen gerade eine Audiodatei ab. Wenn Sie die App beenden, wird die Audiowiedergabe gestoppt. ",
			"ok": "OK",
			"retry": "WIEDERHOLEN",
			"oops": "Ups!",
			"save": "Speichern",
			"cancel": "Stornieren",
			"error": "Fehler",
			"success": "Erfolg",
			"skip": "Überspringen",
			"skiplogin": "Login überspringen",
			"skipregister": "Registrierung überspringen",
			"dataloaderror": "Die angeforderten Daten konnten derzeit nicht geladen werden. Überprüfen Sie Ihre Datenverbindung und klicken Sie, um es erneut zu versuchen.",
			"suggestedforyou": "Für Sie empfohlen",
			"videomessages": "Videobotschaften",
			"audiomessages": "Audio-Nachrichten",
			"devotionals": "Andachten",
			"categories": "Kategorien",
			"category": "Kategorie",
			"videos": "Videos",
			"audios": "Audios",
			"biblebooks": "Bibel",
			"audiobible": "Audio-Bibel",
			"livestreams": "Live-Streams",
			"radio": "Radio",
			"allitems": "Alle Elemente",
			"emptyplaylist": "Keine Playlists",
			"notsupported": "Nicht unterstützt",
			"cleanupresources": "Ressourcen bereinigen",
			"grantstoragepermission": "Bitte erteilen Sie die Erlaubnis zum Zugriff auf den Speicher, um fortzufahren",
			"sharefiletitle": "Anschauen oder anhören ",
			"sharefilebody": "Laden Sie es jetzt über Ihre Daily Light-App herunter unter ",
			"sharetext": "Genießen Sie unbegrenztes Audio- und Video-Streaming",
			"sharetexthint": "Treten Sie der Video- und Audio-Streaming-Plattform bei, mit der Sie Millionen von Dateien aus der ganzen Welt ansehen und anhören können. ",
			"download": "Herunterladen",
			"addplaylist": "Zur Wiedergabeliste hinzufügen",
			"bookmark": "Lesezeichen",
			"unbookmark": "Lesezeichen aufheben",
			"share": "Aktie",
			"deletemedia": "Datei löschen",
			"deletemediahint": "Möchten Sie diese heruntergeladene Datei löschen? ",
			"searchhint": "Suchen Sie nach Audio- und Videonachrichten",
			"performingsearch": "Suche nach Audios und Videos",
			"nosearchresult": "Keine Ergebnisse gefunden",
			"nosearchresulthint": "Versuchen Sie, ein allgemeineres Schlüsselwort einzugeben",
			"addtoplaylist": "Zur Wiedergabeliste hinzufügen",
			"newplaylist": "Neue Playlist",
			"playlistitm": "Wiedergabeliste",
			"mediaaddedtoplaylist": "Medien zur Playlist hinzugefügt.",
			"mediaremovedfromplaylist": "Medien aus der Playlist entfernt",
			"clearplaylistmedias": "Alle Medien löschen",
			"deletePlayList": "Playlist löschen",
			"clearplaylistmediashint": "Alle Medien aus dieser Playlist entfernen?",
			"deletePlayListhint": "Möchten Sie diese Wiedergabeliste und alle Medien löschen?",
			"comments": "Kommentare",
			"replies": "Antworten",
			"reply": "Antwort",
			"logintoaddcomment": "Melden Sie sich an, um einen Kommentar hinzuzufügen",
			"logintoreply": "Anmelden um zu Antworten",
			"writeamessage": "Nachricht schreiben...",
			"nocomments": "Keine Kommentare gefunden \n",
			"errormakingcomments": "Kommentare können im Moment nicht verarbeitet werden.",
			"errordeletingcomments": "Dieser Kommentar kann im Moment nicht gelöscht werden.",
			"erroreditingcomments": "Dieser Kommentar kann im Moment nicht bearbeitet werden.",
			"errorloadingmorecomments": "Im Moment können keine weiteren Kommentare geladen werden.",
			"deletingcomment": "Kommentar wird gelöscht",
			"editingcomment": "Kommentar bearbeiten",
			"deletecommentalert": "Kommentar löschen",
			"editcommentalert": "Kommentar bearbeiten",
			"deletecommentalerttext": "Möchten Sie diesen Kommentar löschen? ",
			"loadmore": "Mehr laden",
			"messages": "Mitteilungen",
			"guestuser": "Gastbenutzer",
			"fullname": "Vollständiger Name",
			"emailaddress": "E-Mail-Adresse",
			"password": "Passwort",
			"repeatpassword": "Passwort wiederholen",
			"register": "Registrieren",
			"login": "Anmeldung",
			"logout": "Ausloggen",
			"logoutfromapp": "Von der App abmelden?",
			"logoutfromapphint": "Wenn Sie nicht angemeldet sind, können Sie Artikel und Videos nicht liken oder kommentieren.",
			"gotologin": "Gehen Sie zu Anmelden",
			"resetpassword": "Passwort zurücksetzen",
			"logintoaccount": "Sie haben bereits ein Konto? ",
			"emptyfielderrorhint": "Sie müssen alle Felder ausfüllen",
			"invalidemailerrorhint": "Sie müssen eine gültige E-Mail-Adresse eingeben",
			"passwordsdontmatch": "Passwörter stimmen nicht überein",
			"processingpleasewait": "Verarbeite .. Bitte warten...",
			"createaccount": "Ein Konto erstellen",
			"forgotpassword": "Passwort vergessen?",
			"orloginwith": "Oder melden Sie sich an mit",
			"facebook": "Facebook",
			"google": "Google",
			"moreoptions": "Mehr Optionen",
			"about": "Über uns",
			"privacy": "Datenschutzrichtlinie",
			"terms": "App-Bedingungen",
			"rate": "Bewertungs App",
			"version": "Ausführung",
			"pulluploadmore": "Last hochziehen",
			"loadfailedretry": "Laden fehlgeschlagen! Klicken Sie auf „Wiederholen“!",
			"releaseloadmore": "loslassen, um mehr zu laden",
			"nomoredata": "Keine Daten mehr",
			"errorReportingComment": "Kommentar zur Fehlerberichterstattung",
			"reportingComment": "Meldekommentar",
			"reportcomment": "Berichtsoptionen",
			"reportCommentsList": [
				"Unerwünschter kommerzieller Inhalt oder Spam",
				"Pornografie oder sexuell explizites Material",
				"Hassrede oder drastische Gewalt",
				"Belästigung oder Mobbing"
			],
			"bookmarksMedia": "Meine Lesezeichen",
			"noitemstodisplay": "Keine anzuzeigenden Elemente vorhanden",
			"loginrequired": "Anmeldung erforderlich",
			"loginrequiredhint": "Um sich auf dieser Plattform anzumelden, müssen Sie angemeldet sein. Erstellen Sie jetzt ein kostenloses Konto oder melden Sie sich bei Ihrem bestehenden Konto an.",
			"subscriptions": "App-Abonnements",
			"subscribe": "ABONNIEREN",
			"subscribehint": "Abonnement erforderlich",
			"playsubscriptionrequiredhint": "Sie müssen sich anmelden, bevor Sie diese Medien anhören oder ansehen können.",
			"previewsubscriptionrequiredhint": "Sie haben die zulässige Vorschaudauer für dieses Medium erreicht. ",
			"copiedtoclipboard": "In die Zwischenablage kopiert",
			"downloadbible": "Bibel herunterladen",
			"downloadversion": "Herunterladen",
			"downloading": "wird heruntergeladen",
			"failedtodownload": "Download fehlgeschlagen",
			"pleaseclicktoretry": "Bitte klicken Sie, um es erneut zu versuchen.",
			"of": "Von",
			"nobibleversionshint": "Es sind keine Bibeldaten vorhanden. Klicken Sie auf die Schaltfläche unten, um mindestens eine Bibelversion herunterzuladen.",
			"downloaded": "Heruntergeladen",
			"enteremailaddresstoresetpassword": "Geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen",
			"backtologin": "ZURÜCK ZUR ANMELDUNG",
			"signintocontinue": "Melden Sie sich an, um fortzufahren",
			"signin": "ANMELDEN",
			"signinforanaccount": "FÜR EINEN ACCOUNT ANMELDEN?",
			"alreadyhaveanaccount": "Sie haben bereits ein Konto?",
			"updateprofile": "Profil aktualisieren",
			"updateprofilehint": "Bitte aktualisieren Sie zunächst Ihre Profilseite. Dies wird uns dabei helfen, Sie mit anderen Menschen in Kontakt zu bringen",
			"autoplayvideos": "AutoPlay-Videos",
			"gosocial": "Gehen Sie sozial",
			"searchbible": "Bibel durchsuchen",
			"filtersearchoptions": "Suchoptionen filtern",
			"narrowdownsearch": "Verwenden Sie die Filterschaltfläche unten, um die Suche einzugrenzen und ein genaueres Ergebnis zu erhalten.",
			"searchbibleversion": "Bibelversion suchen",
			"searchbiblebook": "Bibelbuch durchsuchen",
			"search": "Suchen",
			"setBibleBook": "Bibelbuch einstellen",
			"oldtestament": "Altes Testament",
			"newtestament": "Neues Testament",
			"limitresults": "Ergebnisse begrenzen",
			"setfilters": "Filter festlegen",
			"bibletranslator": "Bibelübersetzer",
			"chapter": " Kapitel ",
			"verse": " Vers ",
			"translate": "übersetzen",
			"bibledownloadinfo": "Bibel-Download gestartet. Bitte schließen Sie diese Seite nicht, bis der Download abgeschlossen ist.",
			"received": "erhalten",
			"outoftotal": "insgesamt",
			"set": "SATZ",
			"selectColor": "Wähle Farbe",
			"switchbibleversion": "Wechseln Sie die Bibelversion",
			"switchbiblebook": "Bibelbuch wechseln",
			"gotosearch": "Gehe zum Kapitel",
			"changefontsize": "Schriftgröße ändern",
			"font": "Schriftart",
			"readchapter": "Kapitel lesen",
			"showhighlightedverse": "Hervorgehobene Verse anzeigen",
			"downloadmoreversions": "Laden Sie weitere Versionen herunter",
			"suggestedusers": "Empfohlene Benutzer zum Folgen",
			"unfollow": "Nicht mehr folgen",
			"follow": "Folgen",
			"searchforpeople": "Suche nach Personen",
			"viewpost": "Beitrag anzeigen",
			"viewprofile": "Profil anzeigen",
			"mypins": "Meine Pins",
			"viewpinnedposts": "Angepinnte Beiträge anzeigen",
			"personal": "persönlich",
			"update": "Aktualisieren",
			"phonenumber": "Telefonnummer",
			"showmyphonenumber": "Benutzern meine Telefonnummer anzeigen",
			"dateofbirth": "Geburtsdatum",
			"showmyfulldateofbirth": "Den Leuten, die meinen Status ansehen, mein vollständiges Geburtsdatum anzeigen",
			"notifications": "Benachrichtigungen",
			"notifywhenuserfollowsme": "Benachrichtigen Sie mich, wenn mir ein Benutzer folgt",
			"notifymewhenusercommentsonmypost": "Benachrichtigen Sie mich, wenn Benutzer meinen Beitrag kommentieren",
			"notifymewhenuserlikesmypost": "Benachrichtigen Sie mich, wenn Benutzern mein Beitrag gefällt",
			"churchsocial": "Kirchensozial",
			"shareyourthoughts": "Teile deine Gedanken",
			"readmore": "...Mehr lesen",
			"less": " Weniger",
			"couldnotprocess": "Die angeforderte Aktion konnte nicht verarbeitet werden.",
			"pleaseselectprofilephoto": "Bitte wählen Sie ein Profilfoto zum Hochladen aus",
			"pleaseselectprofilecover": "Bitte wählen Sie ein Titelbild zum Hochladen aus",
			"updateprofileerrorhint": "Sie müssen Ihren Namen, Ihr Geburtsdatum, Ihr Geschlecht, Ihre Telefonnummer und Ihren Standort eingeben, bevor Sie fortfahren können.",
			"gender": "Geschlecht",
			"male": "Männlich",
			"female": "Weiblich",
			"dob": "Geburtsdatum",
			"location": "Aktueller Standort",
			"qualification": "Qualifikation",
			"aboutme": "Über mich",
			"facebookprofilelink": "Facebook-Profillink",
			"twitterprofilelink": "Twitter-Profillink",
			"linkdln": "Linkedln-Profillink",
			"likes": "Likes",
			"likess": "Likes)",
			"pinnedposts": "Meine angepinnten Beiträge",
			"unpinpost": "Beitrag entfernen",
			"unpinposthint": "Möchten Sie diesen Beitrag aus Ihren angepinnten Beiträgen entfernen?",
			"postdetails": "Beitragsdetails",
			"posts": "Beiträge",
			"followers": "Anhänger",
			"followings": "Folgendes",
			"my": "Mein",
			"edit": "Bearbeiten",
			"delete": "Löschen",
			"deletepost": "Beitrag entfernen",
			"deleteposthint": "Möchten Sie diesen Beitrag löschen? ",
			"maximumallowedsizehint": "Maximal zulässiger Datei-Upload erreicht",
			"maximumuploadsizehint": "Die ausgewählte Datei überschreitet die zulässige Dateigrößenbeschränkung für den Upload.",
			"makeposterror": "Das Verfassen des Beitrags ist im Moment nicht möglich. Bitte klicken Sie, um es erneut zu versuchen.",
			"makepost": "Beitrag erstellen",
			"selectfile": "Datei aussuchen",
			"images": "Bilder",
			"shareYourThoughtsNow": "Teile deine Gedanken ...",
			"photoviewer": "Fotobetrachter",
			"nochatsavailable": "Keine Gespräche verfügbar \n ",
			"typing": "Tippen...",
			"photo": "Foto",
			"online": "Online",
			"offline": "Offline",
			"lastseen": "Zuletzt gesehen",
			"deleteselectedhint": "Durch diese Aktion werden die ausgewählten Nachrichten gelöscht.  ",
			"deleteselected": "Ausgewählte löschen",
			"unabletofetchconversation": "Abruf nicht möglich \n \n",
			"loadmoreconversation": "Laden Sie weitere Konversationen",
			"sendyourfirstmessage": "Senden Sie Ihre erste Nachricht an \n",
			"unblock": "Entsperren ",
			"block": "Block",
			"writeyourmessage": "Schreibe deine Nachricht...",
			"clearconversation": "Klare Unterhaltung",
			"clearconversationhintone": "Durch diese Aktion werden alle Ihre Gespräche gelöscht ",
			"clearconversationhinttwo": ".\n  ",
			"facebookloginerror": "Beim Anmeldevorgang ist ein Fehler aufgetreten.\n",
		"mylibrary": "Meine Bibliothek",
		"prayer_request": "Gebetsanliegen oder Zeugnis",
		"mySubscription": "Mein Abonnement",
		"giveandpart": "Geben und Partnerschaft",
		"follow_us": "Folge uns auf",
		"profile": "Profil",
		"no_phone": "Kein Handy",
		"no_address": "Keine Adresse",
		"changepwd": "Kennwort ändern",
		"help_support": "Hilfe und Unterstützung",
		"quest_logout": "Möchten Sie sich von der App abmelden?",
		"no": "NEIN",
		"yes": "JA",
		"enjoy_using": "Viel Spaß beim Benutzen ",
		"tap_rate": "Tippen Sie im App Store auf einen Stern und bewerten Sie es ",
		"please_rate": "Bitte geben Sie Ihre Bewertung ein ",
		"submit": "einreichen",
		"select_email": "Wählen Sie die E-Mail-App zum Verfassen aus",
		"open_mail": "Öffnen Sie die Mail-App",
		"no_mailer": "Keine Mail-Apps installiert",
		"login_request": "Melden Sie sich an, um die Anfrage anzuzeigen",
		"empty": "Leer",
		"send_prayer": "Kein Artikel gefunden \n ",
		"podcast": "Podcast",
		"new_prayer_req": "Neue Gebetsanliegen oder Zeugnisse",
		"read_more": "MEHR LESEN",
		"details": "Einzelheiten",
		"added_bookmark": "Zum Lesezeichen hinzugefügt",
		"removed_bookmark": "Aus Lesezeichen entfernt",
			"delete_account":"Konto löschen"

		};
	}
}
