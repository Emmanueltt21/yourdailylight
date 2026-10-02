
/*
 * Generated file. Do not edit.
 *
 * Locales: 9
 * Strings: 2988 (332.0 per locale)
 *
 * Built on 2026-10-01 at 12:28 UTC
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
	de, // 'de'
	es, // 'es'
	fr, // 'fr'
	hi, // 'hi'
	it, // 'it'
	pt, // 'pt'
	ru, // 'ru'
	zh, // 'zh'
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

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

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
late _StringsDe _translationsDe = _StringsDe.build();
late _StringsEs _translationsEs = _StringsEs.build();
late _StringsFr _translationsFr = _StringsFr.build();
late _StringsHi _translationsHi = _StringsHi.build();
late _StringsIt _translationsIt = _StringsIt.build();
late _StringsPt _translationsPt = _StringsPt.build();
late _StringsRu _translationsRu = _StringsRu.build();
late _StringsZh _translationsZh = _StringsZh.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.de: return _translationsDe;
			case AppLocale.es: return _translationsEs;
			case AppLocale.fr: return _translationsFr;
			case AppLocale.hi: return _translationsHi;
			case AppLocale.it: return _translationsIt;
			case AppLocale.pt: return _translationsPt;
			case AppLocale.ru: return _translationsRu;
			case AppLocale.zh: return _translationsZh;
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
			case AppLocale.de: return _StringsDe.build();
			case AppLocale.es: return _StringsEs.build();
			case AppLocale.fr: return _StringsFr.build();
			case AppLocale.hi: return _StringsHi.build();
			case AppLocale.it: return _StringsIt.build();
			case AppLocale.pt: return _StringsPt.build();
			case AppLocale.ru: return _StringsRu.build();
			case AppLocale.zh: return _StringsZh.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.de: return 'de';
			case AppLocale.es: return 'es';
			case AppLocale.fr: return 'fr';
			case AppLocale.hi: return 'hi';
			case AppLocale.it: return 'it';
			case AppLocale.pt: return 'pt';
			case AppLocale.ru: return 'ru';
			case AppLocale.zh: return 'zh';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
			case AppLocale.hi: return const Locale.fromSubtags(languageCode: 'hi');
			case AppLocale.it: return const Locale.fromSubtags(languageCode: 'it');
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
			case AppLocale.ru: return const Locale.fromSubtags(languageCode: 'ru');
			case AppLocale.zh: return const Locale.fromSubtags(languageCode: 'zh');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'de': return AppLocale.de;
			case 'es': return AppLocale.es;
			case 'fr': return AppLocale.fr;
			case 'hi': return AppLocale.hi;
			case 'it': return AppLocale.it;
			case 'pt': return AppLocale.pt;
			case 'ru': return AppLocale.ru;
			case 'zh': return AppLocale.zh;
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

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get appname => 'Your Daily Light';
	String get appname_label => 'Your Daily Light';
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
		'YOUR DAILY LIGHT ',
		'CREATE AN ACCOUNT',
		'SHARE ',
		' STAY UP TO DATE ',
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
	String get mylibrary => 'My Library';
	String get prayer_request => 'Prayer Request or Testimony';
	String get mySubscription => 'My Subscription';
	String get giveandpart => 'Giving and Partnership';
	String get follow_us => 'Follow us on';
	String get profile => 'Profile';
	String get no_phone => 'No Phone';
	String get no_address => 'No address';
	String get changepwd => 'Change Password';
	String get help_support => 'Help and Support';
	String get quest_logout => 'Do you want to logout from the app?';
	String get no => 'No';
	String get yes => 'YES';
	String get enjoy_using => 'Enjoy Using ';
	String get tap_rate => 'Tap a star rate it on the App Store ';
	String get please_rate => 'Please Enter Your Rating ';
	String get submit => 'submit';
	String get select_email => 'Select email app to compose';
	String get open_mail => 'Open Mail Appe';
	String get no_mailer => 'No mail apps installed';
	String get login_request => 'Login to View Request';
	String get empty => 'Empty';
	String get send_prayer => 'No Item Found \n Send a New Prayer Request or Testimony';
	String get podcast => 'PodCast';
	String get new_prayer_req => 'New Prayer Request or Testimony';
	String get read_more => 'READ MORE';
	String get details => 'Details';
	String get added_bookmark => 'Added to Bookmark';
	String get removed_bookmark => 'Removed from Bookmark';
	String get delete_account => 'Delete Account';
	String get appDescriptionSupport => 'Your partnership through giving to Lighthouse Global Missions enables us to accomplish more in fulfilling God’s call in bringing His life changing word and the miracle working power of the Holy Spirit around the world. And your every sacrifice will be richly rewarded and replenished with multiplication by the Lord, even as He guaranteed by His word (Scripture References: Mark 10:29-30, Luke 6:38).';
	String get giving_via_paypal => 'Giving via PayPal';
	String get click_to_give => 'Click to Give';
	String get additional_giving => 'Additional giving options';
	String get email => 'Email';
	String get aboutcontent_para_1 => 'Lighthouse Global Missions is fulfilling God’s call to bring the Light of Jesus Christ to the nations. Your Daily Light devotional is one of the ways by which we are fulfilling this call to bring the Gospel of Jesus Christ and the illuminating word of God to individuals across the globe. This devotional brings God’s word daily, to individuals for a victorious and a fulfilling life in Christ, enabling them to grow in the knowledge of God, walk in the power of the Holy Spirit, discover their life purpose and fulfill God’s call for their lives.';
	String get aboutcontent_para_2 => 'We are glad to have you get on board with Your Daily Light app, granting you free access to a daily dose of God’s word for your nourishment and spiritual development. We also encourage you to share the impact of this devotional in your life, invite others to download the app, and contribute to helping us reach more people for the glory of God. Directly hit the share button in the application and invite others to download the app today.';
	String get aboutcontent_para_3 => 'On the application home section, you will also find seasonal prophetic messages of what God is saying, stay updated with ministry events, read real life testimonies and discover opportunities to be part of what God is doing through Lighthouse Global Missions.';
	String get aboutcontent_para_4 => 'You can also share your testimonies and submit prayer requests using the testimony and prayers section. We will be glad to read about the impact of Your Daily Light in your life, and to pray with you in your areas of need. From the built in book store, you can directly find and get relevant materials to accelerate your growth.';
	String get aboutcontent_para_5 => 'Your Daily Light app is only made free and accessible to a global audience by the generosity of individuals like you through financial partnership. We also have many other avenues of ministry where every gift makes a difference. You too can join this mission by giving to this ministry. And God who guarantees to reward every sacrifice for His purpose will richly reward you with a multiplication of your gift and with diverse blessings. Your giving will make a difference in many lives. Use the Giving and Partnership section to see ways to donate.';
	String get aboutcontent_para_6a => 'Learn more about Lighthouse Global Missions at ';
	String get aboutcontent_para_6b => 'or';
	String get aboutcontent_para_7a => 'Subscribe to our Newsletter at ';
	String get aboutcontent_para_7b => 'to stay updated and get involved with what God is accomplishing.';
	String get aboutcontent_para_8a => 'You can also get in touch with Pastor Simon at:';
	String get apptagline => 'Devotional App for Daily Illumination and Spiritual Growth';
	String get seebankdetails => 'See bank transfer details';
	String get via_bank => 'via Bank';
	String get bank_details => 'Bank Transfer Details';
	String get account_name => 'Account Name';
	String get bank => 'Bank';
	String get iban => 'IBAN';
	String get myProfile => 'My Profile';
}

// Path: <root>
class _StringsDe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsDe _root = this; // ignore: unused_field

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
	@override List<String> get onboardingpagetitles => [
		'DEIN TÄGLICHES LICHT ',
		'EIN KONTO ERSTELLEN',
		'Teilen ',
		' AUF DEM LAUFENDEN BLEIBEN ',
	];
	@override List<String> get onboardingpagehints => [
		'Finden Sie tägliche Erleuchtung durch Gottes Wort durch Andachten und Podcasts',
		'Greifen Sie auf inspirierende Inhalte zu, bauen Sie Ihre persönliche Bibliothek auf und nehmen Sie Gottes Wort überallhin mit',
		'Teilen oder lesen Sie inspirierende Zeugnisse aus der ganzen Welt. ',
		'Erfahren Sie, was Gott für diese Saison sagt, bleiben Sie über Ereignisse auf dem Laufenden und entdecken Sie Möglichkeiten, sich der Bewegung anzuschließen',
	];
	@override String get next => 'NÄCHSTE';
	@override String get done => 'Loslegen';
	@override String get quitapp => 'Beenden Sie die App!';
	@override String get quitappwarning => 'Möchten Sie die App schließen?';
	@override String get quitappaudiowarning => 'Sie spielen gerade eine Audiodatei ab. Wenn Sie die App beenden, wird die Audiowiedergabe gestoppt. ';
	@override String get ok => 'Ja';
	@override String get retry => 'WIEDERHOLEN';
	@override String get oops => 'Ups!';
	@override String get save => 'Speichern';
	@override String get cancel => 'Nein';
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
	@override String get share => 'Teilen';
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
	@override String get guestuser => 'Gastnutzer';
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
	@override String get rate => 'Bewertung App';
	@override String get version => 'Ausführung';
	@override String get pulluploadmore => 'Last hochziehen';
	@override String get loadfailedretry => 'Laden fehlgeschlagen! Klicken Sie auf „Wiederholen“!';
	@override String get releaseloadmore => 'loslassen, um mehr zu laden';
	@override String get nomoredata => 'Keine Daten mehr';
	@override String get errorReportingComment => 'Kommentar zur Fehlerberichterstattung';
	@override String get reportingComment => 'Meldekommentar';
	@override String get reportcomment => 'Berichtsoptionen';
	@override List<String> get reportCommentsList => [
		'Unerwünschter kommerzieller Inhalt oder Spam',
		'Pornografie oder sexuell explizites Material',
		'Hassrede oder drastische Gewalt',
		'Belästigung oder Mobbing',
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
	@override String get appDescriptionSupport => 'Ihre Partnerschaft durch Ihre Spende an Lighthouse Global Missions ermöglicht es uns, mehr zu bewirken, indem wir Gottes Auftrag erfüllen und Sein lebensveränderndes Wort sowie die wunderwirkende Kraft des Heiligen Geistes in die ganze Welt bringen.\nUnd jedes Opfer, das Sie bringen, wird vom Herrn reich belohnt und vervielfacht, so wie Er es in Seinem Wort zugesichert hat (Bibelstellen: Markus 10,29–30; Lukas 6,38).';
	@override String get giving_via_paypal => 'Spenden über PayPal';
	@override String get click_to_give => 'Zum Spenden klicken';
	@override String get additional_giving => 'Weitere Spendenoptionen';
	@override String get email => 'E-Mail';
	@override String get aboutcontent_para_1 => 'Lighthouse Global Missions folgt Gottes Ruf, das Licht Jesu Christi zu den Völkern zu bringen. Die tägliche Andacht „Dein tägliches Licht" (orig.Your Daily Light) ist eine der Möglichkeiten, wie wir diesem Ruf folgen, um das Evangelium Jesu Christi und das erleuchtende Wort Gottes zu Menschen auf der ganzen Welt zu tragen. Diese Andacht bringt Menschen täglich Gottes Wort für ein siegreiches und erfülltes Leben in Christus, damit sie in der Erkenntnis Gottes wachsen, in der Kraft des Heiligen Geistes wandeln, ihren Lebenszweck entdecken und Gottes Ruf für ihr Leben erfüllen können.';
	@override String get aboutcontent_para_2 => 'Wir freuen uns, dass du die App „Your Daily Light“ nutzt, die dir kostenlosen Zugang zu einer täglichen Dosis von Gottes Wort für deine geistliche Nahrung und Entwicklung bietet. Wir ermutigen dich auch, die Wirkung dieser Andacht in deinem Leben mit anderen zu teilen, andere zum Herunterladen der App einzuladen und dazu beizutragen, dass wir mehr Menschen zur Ehre Gottes erreichen. Klicke direkt auf die Schaltfläche „Teilen“ in der Anwendung und lade andere ein, die App noch heute herunterzuladen.';
	@override String get aboutcontent_para_3 => 'Auf der Startseite der App findest du zudem saisonale prophetische Botschaften darüber, was Gott sagt, kannst dich über Veranstaltungen des Dienstes auf dem Laufenden halten, echte Lebenszeugnisse lesen und Möglichkeiten entdecken, Teil dessen zu sein, was Gott durch Lighthouse Global Missions tut.';
	@override String get aboutcontent_para_4 => 'Du kannst auch deine Zeugnisse teilen und Gebetsanliegen über den Bereich „Zeugnisse und Gebete” einreichen. Wir freuen uns, wenn du uns erzählst, wie „Your Daily Light” dein Leben beeinflusst hat, und beten gerne mit dir für deine Anliegen. Im integrierten Buchladen kannst du weiteres Lesematerial finden, das dein Wachstum fördert.';
	@override String get aboutcontent_para_5 => 'Die Your Daily Light App ist nur dank der Großzügigkeit von Menschen wie dir, die uns finanziell unterstützen, kostenlos und für ein weltweites Publikum zugänglich. Wir haben auch viele andere Bereiche, in denen jede Spende einen Unterschied macht. Auch du kannst dich dieser Mission anschließen, indem du für diesen Dienst spendest. Und Gott, der verspricht, jedes Opfer für seine Zwecke zu belohnen, wird dich reichlich mit einer Vervielfachung deiner Spende und mit vielfältigen Segnungen beschenken. Deine Spende wird in vielen Leben etwas bewirken. Unter „Spenden und Partnerschaft” findest du Möglichkeiten, wie du spenden kannst.';
	@override String get aboutcontent_para_6a => 'Erfahre mehr über Lighthouse Global Missions unter ';
	@override String get aboutcontent_para_6b => 'oder';
	@override String get aboutcontent_para_7a => 'Abonniere unseren Newsletter unter ';
	@override String get aboutcontent_para_7b => ' um auf dem Laufenden zu bleiben und dich an dem zu beteiligen, was Gott tut. ';
	@override String get aboutcontent_para_8a => 'Sie können sich auch unter folgender Adresse an Pastor Simon wenden:';
	@override String get apptagline => 'Andachts-App für tägliche Erleuchtung und geistliches Wachstum';
	@override String get seebankdetails => 'Überweisungsdetails anzeigen';
	@override String get via_bank => 'Über Bank';
	@override String get bank_details => 'Überweisungsdetails';
	@override String get account_name => 'Kontoname';
	@override String get bank => 'Bank';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Mein Profil';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Seleccionar idioma';
	@override String get chooseapplanguage => 'Elija el idioma de la aplicación';
	@override String get nightmode => 'Modo nocturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Inicio';
	@override String get branches => 'Sucursales';
	@override String get inbox => 'Bandeja de entrada';
	@override String get downloads => 'Descargas';
	@override String get settings => 'Configuración';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Mis listas de reproducción';
	@override String get website => 'Sitio web';
	@override String get hymns => 'Himnos';
	@override String get articles => 'Artículos';
	@override String get notes => 'Notas';
	@override String get donate => 'Donar';
	@override String get savenotetitle => 'Título de la nota';
	@override String get nonotesfound => 'No se encontraron notas';
	@override String get newnote => 'Nuevo';
	@override String get deletenote => 'Eliminar nota';
	@override String get deletenotehint => '¿Quieres eliminar esta nota? Esta acción no se puede revertir.';
	@override String get bookmarks => 'Marcadores';
	@override String get socialplatforms => 'Plataformas sociales';
	@override List<String> get onboardingpagetitles => [
		'TU LUZ DIARIA',
		'CREAR UNA CUENTA',
		'COMPARTIR',
		'MANTÉNGASE ACTUALIZADO',
	];
	@override List<String> get onboardingpagehints => [
		'Encuentre iluminación diaria de la palabra de Dios a través de devocionales y podcasts',
		'Acceda a contenido inspirador, cree su biblioteca personal y lleve la palabra de Dios a cualquier lugar',
		'Comparta o lea testimonios inspiradores de todo el mundo. Comparta peticiones de oración y encuentre apoyo oportuno',
		'Sepa lo que Dios está diciendo para la temporada, manténgase actualizado sobre los eventos y descubra formas de unirse al movimiento.',
	];
	@override String get next => 'SIGUIENTE';
	@override String get done => 'Empezar';
	@override String get quitapp => '¡Salga de la aplicación!';
	@override String get quitappwarning => '¿Deseas cerrar la aplicación?';
	@override String get quitappaudiowarning => 'Actualmente estás reproduciendo un audio; al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.';
	@override String get ok => 'Ok';
	@override String get retry => 'REINTENTAR';
	@override String get oops => '¡Ups!';
	@override String get save => 'Guardar';
	@override String get cancel => 'Cancelar';
	@override String get error => 'error';
	@override String get success => 'Éxito';
	@override String get skip => 'Saltar';
	@override String get skiplogin => 'Saltar inicio de sesión';
	@override String get skipregister => 'Saltar registro';
	@override String get dataloaderror => 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.';
	@override String get suggestedforyou => 'Sugerido para ti';
	@override String get videomessages => 'Mensajes de vídeo';
	@override String get audiomessages => 'Mensajes de audio';
	@override String get devotionals => 'Devocionales';
	@override String get categories => 'Categorías';
	@override String get category => 'categoría';
	@override String get videos => 'Vídeos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Biblia';
	@override String get audiobible => 'Biblia en audio';
	@override String get livestreams => 'Transmisiones en vivo';
	@override String get radio => 'Radio';
	@override String get allitems => 'Todos los artículos';
	@override String get emptyplaylist => 'Sin listas de reproducción';
	@override String get notsupported => 'No compatible';
	@override String get cleanupresources => 'Limpiando recursos';
	@override String get grantstoragepermission => 'Otorgue permiso de acceso al almacenamiento para continuar';
	@override String get sharefiletitle => 'Mirar o escuchar';
	@override String get sharefilebody => 'A través de la aplicación Your Daily Light, descárgala ahora en';
	@override String get sharetext => 'Disfrute de transmisión ilimitada de audio y video';
	@override String get sharetexthint => 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descargar ahora en';
	@override String get download => 'Descargar';
	@override String get addplaylist => 'Agregar a la lista de reproducción';
	@override String get bookmark => 'Marcador';
	@override String get unbookmark => 'Desmarcar';
	@override String get share => 'Compartir';
	@override String get deletemedia => 'Eliminar archivo';
	@override String get deletemediahint => '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.';
	@override String get searchhint => 'Buscar mensajes de audio y vídeo';
	@override String get performingsearch => 'Búsqueda de audios y vídeos';
	@override String get nosearchresult => 'No se encontraron resultados';
	@override String get nosearchresulthint => 'Intente ingresar una palabra clave más general';
	@override String get addtoplaylist => 'Agregar a la lista de reproducción';
	@override String get newplaylist => 'Nueva lista de reproducción';
	@override String get playlistitm => 'Lista de reproducción';
	@override String get mediaaddedtoplaylist => 'Medios agregados a la lista de reproducción.';
	@override String get mediaremovedfromplaylist => 'Medios eliminados de la lista de reproducción';
	@override String get clearplaylistmedias => 'Borrar todos los medios';
	@override String get deletePlayList => 'Eliminar lista de reproducción';
	@override String get clearplaylistmediashint => '¿Continuar y eliminar todos los medios de esta lista de reproducción?';
	@override String get deletePlayListhint => '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?';
	@override String get comments => 'Comentarios';
	@override String get replies => 'Respuestas';
	@override String get reply => 'Responder';
	@override String get logintoaddcomment => 'Inicia sesión para agregar un comentario';
	@override String get logintoreply => 'Inicia sesión para responder';
	@override String get writeamessage => 'Escribe un mensaje...';
	@override String get nocomments => 'No se encontraron comentarios \n haga clic para volver a intentarlo';
	@override String get errormakingcomments => 'No se pueden procesar los comentarios en este momento.';
	@override String get errordeletingcomments => 'No se puede eliminar este comentario en este momento.';
	@override String get erroreditingcomments => 'No se puede editar este comentario en este momento.';
	@override String get errorloadingmorecomments => 'No se pueden cargar más comentarios en este momento.';
	@override String get deletingcomment => 'Eliminando comentario';
	@override String get editingcomment => 'Editando comentario';
	@override String get deletecommentalert => 'Eliminar comentario';
	@override String get editcommentalert => 'Editar comentario';
	@override String get deletecommentalerttext => '¿Quieres eliminar este comentario? Esta acción no se puede deshacer.';
	@override String get loadmore => 'cargar más';
	@override String get messages => 'Mensajes';
	@override String get guestuser => 'Usuario invitado';
	@override String get fullname => 'Nombre completo';
	@override String get emailaddress => 'Dirección de correo electrónico';
	@override String get password => 'Contraseña';
	@override String get repeatpassword => 'Repetir contraseña';
	@override String get register => 'Registrarse';
	@override String get login => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get logoutfromapp => '¿Cerrar sesión en la aplicación?';
	@override String get logoutfromapphint => 'No podrás dar me gusta ni comentar artículos y videos si no estás conectado.';
	@override String get gotologin => 'Ir a Iniciar sesión';
	@override String get resetpassword => 'Restablecer contraseña';
	@override String get logintoaccount => '¿Ya tienes una cuenta? Iniciar sesión';
	@override String get emptyfielderrorhint => 'Necesitas llenar todos los campos';
	@override String get invalidemailerrorhint => 'Debes ingresar una dirección de correo electrónico válida.';
	@override String get passwordsdontmatch => 'Las contraseñas no coinciden';
	@override String get processingpleasewait => 'Procesando, por favor espere...';
	@override String get createaccount => 'Crear una cuenta';
	@override String get forgotpassword => '¿Olvidaste tu contraseña?';
	@override String get orloginwith => 'O inicia sesión con';
	@override String get facebook => 'facebook';
	@override String get google => 'google';
	@override String get moreoptions => 'Más opciones';
	@override String get about => 'Sobre nosotros';
	@override String get privacy => 'Política de privacidad';
	@override String get terms => 'Términos de la aplicación';
	@override String get rate => 'Calificar aplicación';
	@override String get version => 'Versión';
	@override String get pulluploadmore => 'levantar la carga';
	@override String get loadfailedretry => '¡Falló la carga! ¡Haga clic en Reintentar!';
	@override String get releaseloadmore => 'suelta para cargar más';
	@override String get nomoredata => 'No más datos';
	@override String get errorReportingComment => 'Comentario de informe de errores';
	@override String get reportingComment => 'Comentario de informe';
	@override String get reportcomment => 'Opciones de informe';
	@override List<String> get reportCommentsList => [
		'Contenido comercial no deseado o spam',
		'Pornografía o material sexual explícito.',
		'Incitación al odio o violencia gráfica',
		'Acoso o intimidación',
	];
	@override String get bookmarksMedia => 'Mis marcadores';
	@override String get noitemstodisplay => 'No hay elementos para mostrar';
	@override String get loginrequired => 'Iniciar sesión requerido';
	@override String get loginrequiredhint => 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.';
	@override String get subscriptions => 'Suscripciones a aplicaciones';
	@override String get subscribe => 'SUSCRIBIRSE';
	@override String get subscribehint => 'Se requiere suscripción';
	@override String get playsubscriptionrequiredhint => 'Debes suscribirte antes de poder escuchar o ver este medio.';
	@override String get previewsubscriptionrequiredhint => 'Ha alcanzado la duración de vista previa permitida para este medio. Necesitas suscribirte para seguir escuchando o viendo este medio.';
	@override String get copiedtoclipboard => 'Copiado al portapapeles';
	@override String get downloadbible => 'Descargar la Biblia';
	@override String get downloadversion => 'Descargar';
	@override String get downloading => 'Descargando';
	@override String get failedtodownload => 'No se pudo descargar';
	@override String get pleaseclicktoretry => 'Por favor haga clic para volver a intentarlo.';
	@override String get of => 'de';
	@override String get nobibleversionshint => 'No hay datos bíblicos para mostrar, haga clic en el botón a continuación para descargar al menos una versión de la Biblia.';
	@override String get downloaded => 'Descargado';
	@override String get enteremailaddresstoresetpassword => 'Ingresa tu correo electrónico para restablecer tu contraseña';
	@override String get backtologin => 'VOLVER A INICIAR SESIÓN';
	@override String get signintocontinue => 'Inicia sesión para continuar';
	@override String get signin => 'FIRMAR';
	@override String get signinforanaccount => '¿REGISTRARSE PARA OBTENER UNA CUENTA?';
	@override String get alreadyhaveanaccount => '¿Ya tienes una cuenta?';
	@override String get updateprofile => 'Actualizar perfil';
	@override String get updateprofilehint => 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas.';
	@override String get autoplayvideos => 'Vídeos de reproducción automática';
	@override String get gosocial => 'socializar';
	@override String get searchbible => 'Buscar Biblia';
	@override String get filtersearchoptions => 'Filtrar opciones de búsqueda';
	@override String get narrowdownsearch => 'Utilice el botón de filtro a continuación para limitar la búsqueda y obtener un resultado más preciso.';
	@override String get searchbibleversion => 'Buscar versión de la Biblia';
	@override String get searchbiblebook => 'Buscar libro de la Biblia';
	@override String get search => 'Buscar';
	@override String get setBibleBook => 'Establecer libro de la Biblia';
	@override String get oldtestament => 'Antiguo Testamento';
	@override String get newtestament => 'Nuevo Testamento';
	@override String get limitresults => 'Limitar resultados';
	@override String get setfilters => 'Establecer filtros';
	@override String get bibletranslator => 'Traductor de la Biblia';
	@override String get chapter => 'Capítulo';
	@override String get verse => 'Verso';
	@override String get translate => 'traducir';
	@override String get bibledownloadinfo => 'La descarga de la Biblia comenzó. No cierre esta página hasta que finalice la descarga.';
	@override String get received => 'recibido';
	@override String get outoftotal => 'del total';
	@override String get set => 'CONJUNTO';
	@override String get selectColor => 'Seleccionar color';
	@override String get switchbibleversion => 'Cambiar versión de la Biblia';
	@override String get switchbiblebook => 'Cambiar libro de la Biblia';
	@override String get gotosearch => 'Ir al capítulo';
	@override String get changefontsize => 'Cambiar tamaño de fuente';
	@override String get font => 'fuente';
	@override String get readchapter => 'Leer capítulo';
	@override String get showhighlightedverse => 'Mostrar versículos resaltados';
	@override String get downloadmoreversions => 'Descargar más versiones';
	@override String get suggestedusers => 'Usuarios sugeridos a seguir';
	@override String get unfollow => 'Dejar de seguir';
	@override String get follow => 'Seguir';
	@override String get searchforpeople => 'buscar personas';
	@override String get viewpost => 'Ver publicación';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Mis pines';
	@override String get viewpinnedposts => 'Ver publicaciones fijadas';
	@override String get personal => 'personales';
	@override String get update => 'Actualizar';
	@override String get phonenumber => 'Número de teléfono';
	@override String get showmyphonenumber => 'Mostrar mi número de teléfono a los usuarios';
	@override String get dateofbirth => 'Fecha de nacimiento';
	@override String get showmyfulldateofbirth => 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado';
	@override String get notifications => 'Notificaciones';
	@override String get notifywhenuserfollowsme => 'Notificarme cuando un usuario me sigue';
	@override String get notifymewhenusercommentsonmypost => 'Notificarme cuando los usuarios comenten mi publicación.';
	@override String get notifymewhenuserlikesmypost => 'Notificarme cuando a los usuarios les guste mi publicación.';
	@override String get churchsocial => 'Iglesia Social';
	@override String get shareyourthoughts => 'Comparte tus pensamientos';
	@override String get readmore => '...Leer más';
	@override String get less => 'menos';
	@override String get couldnotprocess => 'No se pudo procesar la acción solicitada.';
	@override String get pleaseselectprofilephoto => 'Por favor seleccione una foto de perfil para cargar';
	@override String get pleaseselectprofilecover => 'Seleccione una foto de portada para cargar';
	@override String get updateprofileerrorhint => 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.';
	@override String get gender => 'Género';
	@override String get male => 'masculino';
	@override String get female => 'Mujer';
	@override String get dob => 'fecha de nacimiento';
	@override String get location => 'Ubicación actual';
	@override String get qualification => 'Calificación';
	@override String get aboutme => 'Acerca de mí';
	@override String get facebookprofilelink => 'Enlace de perfil de Facebook';
	@override String get twitterprofilelink => 'Enlace al perfil de Twitter';
	@override String get linkdln => 'Enlace de perfil de LinkedIn';
	@override String get likes => 'Me gusta';
	@override String get likess => 'Me gusta';
	@override String get pinnedposts => 'Mis publicaciones fijadas';
	@override String get unpinpost => 'Desanclar publicación';
	@override String get unpinposthint => '¿Quieres eliminar esta publicación de tus publicaciones fijadas?';
	@override String get postdetails => 'Detalles de la publicación';
	@override String get posts => 'Publicaciones';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Seguidores';
	@override String get my => 'mi';
	@override String get edit => 'Editar';
	@override String get delete => 'Eliminar';
	@override String get deletepost => 'Eliminar publicación';
	@override String get deleteposthint => '¿Quieres eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.';
	@override String get maximumallowedsizehint => 'Carga máxima de archivos permitida alcanzada';
	@override String get maximumuploadsizehint => 'El archivo seleccionado excede el límite de tamaño de archivo de carga permitido.';
	@override String get makeposterror => 'No se puede realizar una publicación en este momento, haga clic para volver a intentarlo.';
	@override String get makepost => 'Hacer publicación';
	@override String get selectfile => 'Seleccionar archivo';
	@override String get images => 'Imágenes';
	@override String get shareYourThoughtsNow => 'Comparte tus pensamientos...';
	@override String get photoviewer => 'Visor de fotos';
	@override String get nochatsavailable => 'No hay conversaciones disponibles \n Haga clic en el ícono Agregar debajo de \n para seleccionar usuarios con quienes chatear';
	@override String get typing => 'Escribiendo...';
	@override String get photo => 'Foto';
	@override String get online => 'En línea';
	@override String get offline => 'Sin conexión';
	@override String get lastseen => 'Visto por última vez';
	@override String get deleteselectedhint => 'Esta acción eliminará los mensajes seleccionados.  Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes aún se mostrarán en el dispositivo de su socio.';
	@override String get deleteselected => 'Eliminar seleccionado';
	@override String get unabletofetchconversation => 'No se puede recuperar \n tu conversación con \n';
	@override String get loadmoreconversation => 'Cargar más conversaciones';
	@override String get sendyourfirstmessage => 'Envía tu primer mensaje a \n';
	@override String get unblock => 'Desbloquear';
	@override String get block => 'Bloquear';
	@override String get writeyourmessage => 'Escribe tu mensaje...';
	@override String get clearconversation => 'Conversación clara';
	@override String get clearconversationhintone => 'Esta acción borrará toda tu conversación con';
	@override String get clearconversationhinttwo => '. \n Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.';
	@override String get facebookloginerror => 'Algo salió mal con el proceso de inicio de sesión. \n, Aquí está el error que nos dio Facebook';
	@override String get mylibrary => 'Mi biblioteca';
	@override String get prayer_request => 'Petición de Oración o Testimonio';
	@override String get mySubscription => 'Mi suscripción';
	@override String get giveandpart => 'Dar y asociarse';
	@override String get follow_us => 'Síguenos en';
	@override String get profile => 'Perfil';
	@override String get no_phone => 'Sin teléfono';
	@override String get no_address => 'Sin dirección';
	@override String get changepwd => 'Cambiar contraseña';
	@override String get help_support => 'Ayuda y soporte';
	@override String get quest_logout => '¿Quieres cerrar sesión en la aplicación?';
	@override String get no => 'No';
	@override String get yes => 'SI';
	@override String get enjoy_using => 'Disfruta usando';
	@override String get tap_rate => 'Toca una estrella y califícala en la App Store';
	@override String get please_rate => 'Por favor ingrese su calificación';
	@override String get submit => 'enviar';
	@override String get select_email => 'Seleccione la aplicación de correo electrónico para redactar';
	@override String get open_mail => 'Abrir aplicación de correo';
	@override String get no_mailer => 'No hay aplicaciones de correo instaladas';
	@override String get login_request => 'Inicie sesión para ver la solicitud';
	@override String get empty => 'vacio';
	@override String get send_prayer => 'No se encontró ningún artículo \n Envíe una nueva solicitud de oración o testimonio';
	@override String get podcast => 'PodCast';
	@override String get new_prayer_req => 'Nueva Petición de Oración o Testimonio';
	@override String get read_more => 'LEER MÁS';
	@override String get details => 'Detalles';
	@override String get added_bookmark => 'Agregado al marcador';
	@override String get removed_bookmark => 'Eliminado del marcador';
	@override String get delete_account => 'Eliminar cuenta';
	@override String get appDescriptionSupport => 'Su asociación a través de donaciones a Lighthouse Global Missions nos permite lograr más en el cumplimiento del llamado de Dios de llevar Su palabra que cambia vidas y el poder milagroso del Espíritu Santo en todo el mundo. Y cada uno de sus sacrificios será ricamente recompensado y repleto con multiplicación por parte del Señor, tal como lo garantizó mediante Su palabra (Referencias de las Escrituras: Marcos 10:29-30, Lucas 6:38).';
	@override String get giving_via_paypal => 'Donar a través de PayPal';
	@override String get click_to_give => 'Haga clic para donar';
	@override String get additional_giving => 'Opciones de donación adicionales';
	@override String get email => 'Correo electrónico';
	@override String get aboutcontent_para_1 => 'Lighthouse Global Missions está cumpliendo el llamado de Dios de llevar la Luz de Jesucristo a las naciones. Su devocional Daily Light es una de las formas en que estamos cumpliendo este llamado de llevar el Evangelio de Jesucristo y la palabra iluminadora de Dios a personas de todo el mundo. Este devocional trae la palabra de Dios diariamente a las personas para una vida victoriosa y plena en Cristo, permitiéndoles crecer en el conocimiento de Dios, caminar en el poder del Espíritu Santo, descubrir el propósito de su vida y cumplir el llamado de Dios para sus vidas.';
	@override String get aboutcontent_para_2 => 'Nos complace que se sume a la aplicación Your Daily Light, que le brinda acceso gratuito a una dosis diaria de la palabra de Dios para su nutrición y desarrollo espiritual. También te animamos a compartir el impacto de este devocional en tu vida, invitar a otros a descargar la aplicación y contribuir a ayudarnos a llegar a más personas para la gloria de Dios. Presione directamente el botón compartir en la aplicación e invite a otros a descargar la aplicación hoy.';
	@override String get aboutcontent_para_3 => 'En la sección de inicio de la aplicación, también encontrará mensajes proféticos estacionales de lo que Dios está diciendo, se mantendrá actualizado con los eventos del ministerio, leerá testimonios de la vida real y descubrirá oportunidades para ser parte de lo que Dios está haciendo a través de Lighthouse Global Missions.';
	@override String get aboutcontent_para_4 => 'También puede compartir sus testimonios y enviar solicitudes de oración utilizando la sección de testimonios y oraciones. Estaremos encantados de leer sobre el impacto de Tu Luz Diaria en tu vida y de orar contigo en tus áreas de necesidad. Desde la librería integrada, puede buscar y obtener directamente materiales relevantes para acelerar su crecimiento.';
	@override String get aboutcontent_para_5 => 'Su aplicación Daily Light solo es gratuita y accesible para una audiencia global gracias a la generosidad de personas como usted a través de una asociación financiera. También tenemos muchas otras vías de ministerio donde cada donativo marca la diferencia. Tú también puedes unirte a esta misión donando a este ministerio. Y Dios que garantiza recompensar cada sacrificio para Su propósito, os recompensará ricamente con una multiplicación de vuestra ofrenda y con diversas bendiciones. Tu donación marcará la diferencia en muchas vidas. Utilice la sección Donaciones y asociaciones para ver formas de donar.';
	@override String get aboutcontent_para_6a => 'Obtenga más información sobre las misiones globales de Lighthouse en';
	@override String get aboutcontent_para_6b => 'o';
	@override String get aboutcontent_para_7a => 'Suscríbete a nuestro Newsletter en';
	@override String get aboutcontent_para_7b => 'para mantenerse actualizado e involucrarse con lo que Dios está logrando.';
	@override String get aboutcontent_para_8a => 'También puede ponerse en contacto con el Pastor Simón en:';
	@override String get apptagline => 'Aplicación devocional para la iluminación diaria y el crecimiento espiritual';
	@override String get seebankdetails => 'Ver detalles de transferencia bancaria';
	@override String get via_bank => 'vía banco';
	@override String get bank_details => 'Detalles de la transferencia bancaria';
	@override String get account_name => 'Nombre de cuenta';
	@override String get bank => 'Banco';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Mi perfil';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsFr _root = this; // ignore: unused_field

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
		'Bienvenue à Your Daily Light',
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
	@override String get mylibrary => 'Ma bibliothèque';
	@override String get prayer_request => 'Demande de prière ou témoignage';
	@override String get mySubscription => 'Mon abonnement';
	@override String get giveandpart => 'Don et partenariat';
	@override String get follow_us => 'Suivez-nous sur';
	@override String get profile => 'Profil';
	@override String get no_phone => 'Pas de téléphone';
	@override String get no_address => 'Pas d\'adresse';
	@override String get changepwd => 'Changer le mot de passe';
	@override String get help_support => 'Aide et soutien';
	@override String get quest_logout => 'Voulez-vous vous déconnecter de l\'application ?';
	@override String get no => 'Non';
	@override String get yes => 'OUI';
	@override String get enjoy_using => 'Profitez de l\'utilisation ';
	@override String get tap_rate => 'Appuyez sur une étoile et notez-le sur l\'App Store ';
	@override String get please_rate => 'Veuillez entrer votre note ';
	@override String get submit => 'soumettre';
	@override String get select_email => 'Sélectionnez l\'application de messagerie à composer';
	@override String get open_mail => 'Ouvrir l\'application Mail';
	@override String get no_mailer => 'Aucune application de messagerie installée';
	@override String get login_request => 'Connectez-vous pour afficher la demande';
	@override String get empty => 'Vide';
	@override String get send_prayer => 'Aucun élément trouvé \n ';
	@override String get podcast => 'Podcast';
	@override String get new_prayer_req => 'Nouvelle demande de prière ou témoignage';
	@override String get read_more => 'EN SAVOIR PLUS';
	@override String get details => 'Détails';
	@override String get added_bookmark => 'Ajouté aux favoris';
	@override String get removed_bookmark => 'Supprimé du signet';
	@override String get delete_account => 'Supprimer le compte';
	@override String get appDescriptionSupport => 'Votre partenariat par vos dons à Lighthouse Global Missions nous permet d’accomplir davantage l’appel de Dieu, en apportant Sa Parole qui transforme les vies et la puissance miraculeuse du Saint-Esprit à travers le monde. Et chaque sacrifice que vous faites sera richement récompensé et renouvelé avec multiplication par le Seigneur, comme Il l’a garanti dans Sa Parole (Références bibliques : Marc 10:29-30, Luc 6:38).';
	@override String get giving_via_paypal => 'Donner via PayPal';
	@override String get click_to_give => 'Cliquer pour donner';
	@override String get additional_giving => 'Options de don supplémentaires';
	@override String get email => 'E-mail';
	@override String get aboutcontent_para_1 => 'Lighthouse Global Missions répond à l\'appel de Dieu pour apporter la lumière de Jésus-Christ aux nations. Notre dévotion quotidienne « Your Daily Light » est l\'un des moyens par lesquels nous répondons à cet appel pour apporter l\'Évangile de Jésus-Christ et la parole éclairante de Dieu aux gens partout dans le monde. Cette méditation apporte chaque jour la parole de Dieu aux gens pour qu\'ils aient une vie victorieuse et épanouissante en Christ, leur permettant de grandir dans la connaissance de Dieu, de marcher dans la puissance du Saint-Esprit, de découvrir le dessein de leur vie et de répondre à l\'appel de Dieu pour leur vie.';
	@override String get aboutcontent_para_2 => 'On est heureux de vous accueillir sur l\'application Your Daily Light, qui vous donne accès gratuitement à une dose quotidienne de la parole de Dieu pour votre nourriture et votre développement spirituel. On vous encourage également à partager l\'impact de cette méditation dans votre vie, à inviter d\'autres personnes à télécharger l\'application et à contribuer à nous aider à toucher plus de gens pour la gloire de Dieu. Cliquez directement sur le bouton « Partager » dans l\'application et invitez d\'autres personnes à télécharger l\'application dès aujourd\'hui.';
	@override String get aboutcontent_para_3 => 'Dans la section d\'accueil de l\'appli, tu trouveras aussi des messages prophétiques saisonniers sur ce que Dieu dit, tu pourras te tenir au courant des événements du ministère, lire des témoignages réels et découvrir des opportunités de participer à ce que Dieu fait à travers Lighthouse Global Missions.';
	@override String get aboutcontent_para_4 => 'Tu peux aussi partager tes témoignages et envoyer des demandes de prière dans la section « Témoignages et prières ». On sera ravis de lire l\'impact de Your Daily Light dans ta vie et de prier avec toi pour tes besoins. Dans la librairie intégrée, tu peux directement trouver et obtenir des ressources pertinentes pour accélérer ta croissance.';
	@override String get aboutcontent_para_5 => 'L\'application Your Daily Light est gratuite et accessible à un public mondial grâce à la générosité de personnes comme toi qui nous soutiennent financièrement. On a aussi plein d\'autres moyens de ministère où chaque don fait une différence. Toi aussi, tu peux te joindre à cette mission en donnant à ce ministère. Et Dieu, qui garantit de récompenser chaque sacrifice pour son dessein, te récompensera généreusement en multipliant ton don et en te donnant plein de bénédictions. Ton don fera une différence dans de nombreuses vies. Consulte la section Dons et partenariat pour découvrir les différentes façons de faire un don.';
	@override String get aboutcontent_para_6a => 'Pour en savoir plus sur Lighthouse Global Missions, rends-toi sur ';
	@override String get aboutcontent_para_6b => 'ou ';
	@override String get aboutcontent_para_7a => 'Abonne-toi à notre newsletter sur ';
	@override String get aboutcontent_para_7b => 'pour rester informé et t\'impliquer dans l\'œuvre que Dieu accomplit.';
	@override String get aboutcontent_para_8a => 'Vous pouvez également contacter le pasteur Simon à l\'adresse suivante :';
	@override String get apptagline => 'Application de dévotion pour l’illumination quotidienne et la croissance spirituelle';
	@override String get seebankdetails => 'Voir les détails du virement bancaire';
	@override String get via_bank => 'via Banque';
	@override String get bank_details => 'Détails du virement bancaire';
	@override String get account_name => 'Nom du compte';
	@override String get bank => 'Banque';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Mon profil';
}

// Path: <root>
class _StringsHi implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHi.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsHi _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'भाषा चुनें';
	@override String get chooseapplanguage => 'ऐप भाषा चुनें';
	@override String get nightmode => 'रात्रि मोड';
	@override String get initializingapp => 'प्रारंभ किया जा रहा है...';
	@override String get home => 'घर';
	@override String get branches => 'शाखाएँ';
	@override String get inbox => 'इनबॉक्स';
	@override String get downloads => 'डाउनलोड';
	@override String get settings => 'सेटिंग्स';
	@override String get events => 'घटनाएँ';
	@override String get myplaylists => 'मेरी प्लेलिस्ट';
	@override String get website => 'वेबसाइट';
	@override String get hymns => 'भजन';
	@override String get articles => 'लेख';
	@override String get notes => 'टिप्पणियाँ';
	@override String get donate => 'दान करें';
	@override String get savenotetitle => 'नोट शीर्षक';
	@override String get nonotesfound => 'कोई नोट नहीं मिला';
	@override String get newnote => 'नया';
	@override String get deletenote => 'नोट हटाएँ';
	@override String get deletenotehint => 'क्या आप यह नोट हटाना चाहते हैं? इस क्रिया को उलटा नहीं किया जा सकता.';
	@override String get bookmarks => 'बुकमार्क';
	@override String get socialplatforms => 'सामाजिक मंच';
	@override List<String> get onboardingpagetitles => [
		'आपकी दैनिक रोशनी',
		'एक खाता बनाएँ',
		'साझा करें',
		'अद्यतन रहें',
	];
	@override List<String> get onboardingpagehints => [
		'Find daily illumination from God’s word through devotionals and podcasts',
		'Access inspirational content, build your personal library and bring God’s word with you anywhere',
		'Share or read inspiring testimonies from around the world. प्रार्थना अनुरोध साझा करें और समय पर सहायता पाएं',
		'Know what God is saying for the season, stay updated about events and discover ways to join the movement',
	];
	@override String get next => 'अगला';
	@override String get done => 'आरंभ करें';
	@override String get quitapp => 'ऐप छोड़ें!';
	@override String get quitappwarning => 'क्या आप ऐप बंद करना चाहते हैं?';
	@override String get quitappaudiowarning => 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.';
	@override String get ok => 'ठीक है';
	@override String get retry => 'पुनः प्रयास करें';
	@override String get oops => 'उफ़!';
	@override String get save => 'सहेजें';
	@override String get cancel => 'रद्द करें';
	@override String get error => 'त्रुटि';
	@override String get success => 'सफलता';
	@override String get skip => 'छोड़ें';
	@override String get skiplogin => 'लॉगिन छोड़ें';
	@override String get skipregister => 'पंजीकरण छोड़ें';
	@override String get dataloaderror => 'Could not load requested data at the moment, check your data connection and click to retry.';
	@override String get suggestedforyou => 'आपके लिए सुझाव दिया गया है';
	@override String get videomessages => 'वीडियो संदेश';
	@override String get audiomessages => 'ऑडियो संदेश';
	@override String get devotionals => 'भक्तिमय';
	@override String get categories => 'श्रेणियाँ';
	@override String get category => 'श्रेणी';
	@override String get videos => 'वीडियो';
	@override String get audios => 'ऑडियो';
	@override String get biblebooks => 'बाइबिल';
	@override String get audiobible => 'ऑडियो बाइबिल';
	@override String get livestreams => 'लाइवस्ट्रीम';
	@override String get radio => 'रेडियो';
	@override String get allitems => 'सभी आइटम';
	@override String get emptyplaylist => 'कोई प्लेलिस्ट नहीं';
	@override String get notsupported => 'समर्थित नहीं';
	@override String get cleanupresources => 'संसाधनों की सफाई';
	@override String get grantstoragepermission => 'कृपया जारी रखने के लिए भंडारण तक पहुंच की अनुमति दें';
	@override String get sharefiletitle => 'देखें या सुनें';
	@override String get sharefilebody => 'योर डेली लाइट ऐप के माध्यम से, अभी डाउनलोड करें';
	@override String get sharetext => 'असीमित ऑडियो और वीडियो स्ट्रीमिंग का आनंद लें';
	@override String get sharetexthint => 'वीडियो और ऑडियो स्ट्रीमिंग प्लेटफ़ॉर्म से जुड़ें जो आपको दुनिया भर की लाखों फ़ाइलें देखने और सुनने की सुविधा देता है। अभी डाउनलोड करें';
	@override String get download => 'डाउनलोड करें';
	@override String get addplaylist => 'प्लेलिस्ट में जोड़ें';
	@override String get bookmark => 'बुकमार्क';
	@override String get unbookmark => 'बुकमार्क हटाएँ';
	@override String get share => 'साझा करें';
	@override String get deletemedia => 'फ़ाइल हटाएँ';
	@override String get deletemediahint => 'क्या आप इस डाउनलोड की गई फ़ाइल को हटाना चाहते हैं? इस एक्शन को वापस नहीं किया जा सकता।';
	@override String get searchhint => 'ऑडियो और वीडियो संदेश खोजें';
	@override String get performingsearch => 'ऑडियो और वीडियो खोज रहे हैं';
	@override String get nosearchresult => 'कोई परिणाम नहीं मिला';
	@override String get nosearchresulthint => 'अधिक सामान्य कीवर्ड इनपुट करने का प्रयास करें';
	@override String get addtoplaylist => 'प्लेलिस्ट में जोड़ें';
	@override String get newplaylist => 'नई प्लेलिस्ट';
	@override String get playlistitm => 'प्लेलिस्ट';
	@override String get mediaaddedtoplaylist => 'मीडिया को प्लेलिस्ट में जोड़ा गया.';
	@override String get mediaremovedfromplaylist => 'मीडिया को प्लेलिस्ट से हटा दिया गया';
	@override String get clearplaylistmedias => 'सभी मीडिया साफ़ करें';
	@override String get deletePlayList => 'प्लेलिस्ट हटाएँ';
	@override String get clearplaylistmediashint => 'आगे बढ़ें और इस प्लेलिस्ट से सभी मीडिया हटा दें?';
	@override String get deletePlayListhint => 'आगे बढ़ें और इस प्लेलिस्ट को हटा दें और सभी मीडिया को साफ़ कर दें?';
	@override String get comments => 'टिप्पणियाँ';
	@override String get replies => 'उत्तर';
	@override String get reply => 'उत्तर';
	@override String get logintoaddcomment => 'टिप्पणी जोड़ने के लिए लॉगिन करें';
	@override String get logintoreply => 'उत्तर देने के लिए लॉगिन करें';
	@override String get writeamessage => 'एक संदेश लिखें...';
	@override String get nocomments => 'कोई टिप्पणी नहीं मिली \n पुनः प्रयास करने के लिए क्लिक करें';
	@override String get errormakingcomments => 'इस समय टिप्पणी करने की प्रक्रिया नहीं की जा सकती..';
	@override String get errordeletingcomments => 'फिलहाल इस टिप्पणी को हटाया नहीं जा सकता..';
	@override String get erroreditingcomments => 'फिलहाल इस टिप्पणी को संपादित नहीं किया जा सकता..';
	@override String get errorloadingmorecomments => 'इस समय अधिक टिप्पणियाँ लोड नहीं की जा सकती..';
	@override String get deletingcomment => 'टिप्पणी हटाई जा रही है';
	@override String get editingcomment => 'टिप्पणी संपादित करना';
	@override String get deletecommentalert => 'टिप्पणी हटाएँ';
	@override String get editcommentalert => 'टिप्पणी संपादित करें';
	@override String get deletecommentalerttext => 'क्या आप यह टिप्पणी हटाना चाहते हैं? इस क्रिया को पूर्ववत नहीं किया जा सकता';
	@override String get loadmore => 'अधिक लोड करें';
	@override String get messages => 'संदेश';
	@override String get guestuser => 'अतिथि उपयोगकर्ता';
	@override String get fullname => 'पूरा नाम';
	@override String get emailaddress => 'ईमेल पता';
	@override String get password => 'पासवर्ड';
	@override String get repeatpassword => 'पासवर्ड दोहराएँ';
	@override String get register => 'रजिस्टर करें';
	@override String get login => 'लॉग इन करें';
	@override String get logout => 'लॉगआउट करें';
	@override String get logoutfromapp => 'ऐप से लॉगआउट करें?';
	@override String get logoutfromapphint => 'यदि आप लॉग इन नहीं हैं तो आप लेखों और वीडियो को लाइक या टिप्पणी नहीं कर पाएंगे।';
	@override String get gotologin => 'लॉगइन पर जाएं';
	@override String get resetpassword => 'पासवर्ड रीसेट करें';
	@override String get logintoaccount => 'क्या आपके पास पहले से ही एक खाता है? लॉग इन करें';
	@override String get emptyfielderrorhint => 'आपको सभी फ़ील्ड भरने होंगे';
	@override String get invalidemailerrorhint => 'आपको एक वैध ईमेल पता दर्ज करना होगा';
	@override String get passwordsdontmatch => 'पासवर्ड मेल नहीं खाते';
	@override String get processingpleasewait => 'प्रसंस्करण हो रहा है, कृपया प्रतीक्षा करें...';
	@override String get createaccount => 'एक खाता बनाएं';
	@override String get forgotpassword => 'पासवर्ड भूल गए?';
	@override String get orloginwith => 'या इसके साथ लॉगिन करें';
	@override String get facebook => 'फेसबुक';
	@override String get google => 'गूगल';
	@override String get moreoptions => 'अधिक विकल्प';
	@override String get about => 'हमारे बारे में';
	@override String get privacy => 'गोपनीयता नीति';
	@override String get terms => 'ऐप की शर्तें';
	@override String get rate => 'रेट ऐप';
	@override String get version => 'संस्करण';
	@override String get pulluploadmore => 'भार ऊपर खींचो';
	@override String get loadfailedretry => 'लोड विफल! पुनः प्रयास करें पर क्लिक करें!';
	@override String get releaseloadmore => 'अधिक लोड करने के लिए रिलीज़ करें';
	@override String get nomoredata => 'कोई और डेटा नहीं';
	@override String get errorReportingComment => 'त्रुटि रिपोर्टिंग टिप्पणी';
	@override String get reportingComment => 'रिपोर्टिंग टिप्पणी';
	@override String get reportcomment => 'रिपोर्ट विकल्प';
	@override List<String> get reportCommentsList => [
		'अवांछित व्यावसायिक सामग्री या स्पैम',
		'अश्लीलता या स्पष्ट यौन सामग्री',
		'अभद्र भाषा या ग्राफिक हिंसा',
		'उत्पीड़न या धमकाना',
	];
	@override String get bookmarksMedia => 'मेरे बुकमार्क';
	@override String get noitemstodisplay => 'प्रदर्शित करने के लिए कोई आइटम नहीं';
	@override String get loginrequired => 'लॉगिन आवश्यक';
	@override String get loginrequiredhint => 'इस प्लेटफ़ॉर्म पर सदस्यता लेने के लिए, आपको लॉग इन करना होगा। अभी एक निःशुल्क खाता बनाएं या अपने मौजूदा खाते में लॉग इन करें।';
	@override String get subscriptions => 'ऐप सदस्यता';
	@override String get subscribe => 'सदस्यता लें';
	@override String get subscribehint => 'सदस्यता आवश्यक है';
	@override String get playsubscriptionrequiredhint => 'इस मीडिया को सुनने या देखने से पहले आपको सदस्यता लेनी होगी।';
	@override String get previewsubscriptionrequiredhint => 'आप इस मीडिया के लिए अनुमत पूर्वावलोकन अवधि तक पहुंच गए हैं। इस मीडिया को सुनना या देखना जारी रखने के लिए आपको सदस्यता लेनी होगी।';
	@override String get copiedtoclipboard => 'क्लिपबोर्ड पर कॉपी किया गया';
	@override String get downloadbible => 'बाइबिल डाउनलोड करें';
	@override String get downloadversion => 'डाउनलोड करें';
	@override String get downloading => 'डाउनलोड हो रहा है';
	@override String get failedtodownload => 'डाउनलोड करने में विफल';
	@override String get pleaseclicktoretry => 'कृपया पुनः प्रयास करने के लिए क्लिक करें।';
	@override String get of => 'का';
	@override String get nobibleversionshint => 'प्रदर्शित करने के लिए कोई बाइबिल डेटा नहीं है, कम से कम एक बाइबिल संस्करण डाउनलोड करने के लिए नीचे दिए गए बटन पर क्लिक करें।';
	@override String get downloaded => 'डाउनलोड किया गया';
	@override String get enteremailaddresstoresetpassword => 'अपना पासवर्ड रीसेट करने के लिए अपना ईमेल दर्ज करें';
	@override String get backtologin => 'लॉगइन पर वापस जाएँ';
	@override String get signintocontinue => 'जारी रखने के लिए साइन इन करें';
	@override String get signin => 'एस आई जी एन आई एन';
	@override String get signinforanaccount => 'किसी खाते के लिए साइन अप करें?';
	@override String get alreadyhaveanaccount => 'क्या आपके पास पहले से ही एक खाता है?';
	@override String get updateprofile => 'प्रोफ़ाइल अपडेट करें';
	@override String get updateprofilehint => 'आरंभ करने के लिए, कृपया अपना प्रोफ़ाइल पृष्ठ अपडेट करें, इससे हमें आपको अन्य लोगों से जोड़ने में मदद मिलेगी';
	@override String get autoplayvideos => 'ऑटोप्ले वीडियो';
	@override String get gosocial => 'सामाजिक हो जाओ';
	@override String get searchbible => 'बाइबिल खोजें';
	@override String get filtersearchoptions => 'खोज विकल्प फ़िल्टर करें';
	@override String get narrowdownsearch => 'अधिक सटीक परिणाम के लिए खोज को सीमित करने के लिए नीचे दिए गए फ़िल्टर बटन का उपयोग करें।';
	@override String get searchbibleversion => 'बाइबिल संस्करण खोजें';
	@override String get searchbiblebook => 'बाइबिल पुस्तक खोजें';
	@override String get search => 'खोजें';
	@override String get setBibleBook => 'बाइबल पुस्तक सेट करें';
	@override String get oldtestament => 'पुराना नियम';
	@override String get newtestament => 'नया नियम';
	@override String get limitresults => 'परिणाम सीमित करें';
	@override String get setfilters => 'फ़िल्टर सेट करें';
	@override String get bibletranslator => 'बाइबिल अनुवादक';
	@override String get chapter => 'अध्याय';
	@override String get verse => 'छंद';
	@override String get translate => 'अनुवाद करें';
	@override String get bibledownloadinfo => 'बाइबिल डाउनलोड शुरू हो गया है, डाउनलोड पूरा होने तक कृपया इस पेज को बंद न करें।';
	@override String get received => 'प्राप्त';
	@override String get outoftotal => 'कुल में से';
	@override String get set => 'सेट';
	@override String get selectColor => 'रंग चुनें';
	@override String get switchbibleversion => 'बाइबिल संस्करण बदलें';
	@override String get switchbiblebook => 'बाइबिल पुस्तक बदलें';
	@override String get gotosearch => 'अध्याय पर जाएँ';
	@override String get changefontsize => 'फ़ॉन्ट आकार बदलें';
	@override String get font => 'फ़ॉन्ट';
	@override String get readchapter => 'अध्याय पढ़ें';
	@override String get showhighlightedverse => 'हाइलाइट किए गए छंद दिखाएं';
	@override String get downloadmoreversions => 'अधिक संस्करण डाउनलोड करें';
	@override String get suggestedusers => 'उपयोगकर्ताओं को अनुसरण करने का सुझाव दिया';
	@override String get unfollow => 'अनफ़ॉलो करें';
	@override String get follow => 'अनुसरण करें';
	@override String get searchforpeople => 'लोगों को खोजें';
	@override String get viewpost => 'पोस्ट देखें';
	@override String get viewprofile => 'प्रोफ़ाइल देखें';
	@override String get mypins => 'मेरे पिन';
	@override String get viewpinnedposts => 'पिन किए गए पोस्ट देखें';
	@override String get personal => 'निजी';
	@override String get update => 'अद्यतन करें';
	@override String get phonenumber => 'फ़ोन नंबर';
	@override String get showmyphonenumber => 'उपयोगकर्ताओं को मेरा फ़ोन नंबर दिखाएँ';
	@override String get dateofbirth => 'जन्मतिथि';
	@override String get showmyfulldateofbirth => 'मेरा स्टेटस देखने वाले लोगों को मेरी पूरी जन्मतिथि दिखाएँ';
	@override String get notifications => 'सूचनाएं';
	@override String get notifywhenuserfollowsme => 'जब कोई उपयोगकर्ता मेरा अनुसरण करे तो मुझे सूचित करें';
	@override String get notifymewhenusercommentsonmypost => 'जब उपयोगकर्ता मेरी पोस्ट पर टिप्पणी करें तो मुझे सूचित करें';
	@override String get notifymewhenuserlikesmypost => 'जब उपयोगकर्ता मेरी पोस्ट पसंद करें तो मुझे सूचित करें';
	@override String get churchsocial => 'चर्च सामाजिक';
	@override String get shareyourthoughts => 'अपने विचार साझा करें';
	@override String get readmore => '...और पढ़ें';
	@override String get less => 'कम';
	@override String get couldnotprocess => 'Could not process requested action.';
	@override String get pleaseselectprofilephoto => 'Please select a profile photo to upload';
	@override String get pleaseselectprofilecover => 'Please select a cover photo to upload';
	@override String get updateprofileerrorhint => 'आगे बढ़ने से पहले आपको अपना नाम, जन्मतिथि, लिंग, फ़ोन और स्थान भरना होगा।';
	@override String get gender => 'लिंग';
	@override String get male => 'पुरुष';
	@override String get female => 'स्त्री';
	@override String get dob => 'जन्म तिथि';
	@override String get location => 'वर्तमान स्थान';
	@override String get qualification => 'योग्यता';
	@override String get aboutme => 'मेरे बारे में';
	@override String get facebookprofilelink => 'फेसबुक प्रोफ़ाइल लिंक';
	@override String get twitterprofilelink => 'ट्विटर प्रोफ़ाइल लिंक';
	@override String get linkdln => 'लिंक्डएलएन प्रोफ़ाइल लिंक';
	@override String get likes => 'पसंद है';
	@override String get likess => 'जैसे';
	@override String get pinnedposts => 'मेरी पिन की गई पोस्ट';
	@override String get unpinpost => 'पोस्ट अनपिन करें';
	@override String get unpinposthint => 'क्या आप इस पोस्ट को अपनी पिन की गई पोस्ट से हटाना चाहते हैं?';
	@override String get postdetails => 'पोस्ट विवरण';
	@override String get posts => 'पोस्ट';
	@override String get followers => 'अनुयायी';
	@override String get followings => 'अनुसरण';
	@override String get my => 'मेरा';
	@override String get edit => 'संपादित करें';
	@override String get delete => 'हटाएँ';
	@override String get deletepost => 'पोस्ट हटाएँ';
	@override String get deleteposthint => 'क्या आप इस पोस्ट को हटाना चाहते हैं? कुछ उपयोगकर्ता फ़ीड पर पोस्ट अभी भी दिखाई दे सकती हैं.';
	@override String get maximumallowedsizehint => 'अधिकतम अनुमत फ़ाइल अपलोड पहुंच गई';
	@override String get maximumuploadsizehint => 'चयनित फ़ाइल अनुमत अपलोड फ़ाइल आकार सीमा से अधिक है।';
	@override String get makeposterror => 'इस समय पोस्ट करने में असमर्थ, कृपया पुनः प्रयास करने के लिए क्लिक करें।';
	@override String get makepost => 'पोस्ट करें';
	@override String get selectfile => 'फ़ाइल चुनें';
	@override String get images => 'छवियाँ';
	@override String get shareYourThoughtsNow => 'अपने विचार साझा करें...';
	@override String get photoviewer => 'फोटो देखने वाला';
	@override String get nochatsavailable => 'कोई वार्तालाप उपलब्ध नहीं है \n चैट करने के लिए उपयोगकर्ताओं का चयन करने के लिए \n के नीचे जोड़ें आइकन पर क्लिक करें';
	@override String get typing => 'टाइपिंग...';
	@override String get photo => 'फ़ोटो';
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफ़लाइन';
	@override String get lastseen => 'अंतिम बार देखा गया';
	@override String get deleteselectedhint => 'यह क्रिया चयनित संदेशों को हटा देगी.  कृपया ध्यान दें कि यह केवल बातचीत के आपके पक्ष को हटाता है, \n संदेश अभी भी आपके साझेदार डिवाइस पर दिखाई देंगे।';
	@override String get deleteselected => 'चयनित हटाएँ';
	@override String get unabletofetchconversation => '\n के साथ आपकी बातचीत \n लाने में असमर्थ';
	@override String get loadmoreconversation => 'अधिक वार्तालाप लोड करें';
	@override String get sendyourfirstmessage => 'अपना पहला संदेश \n पर भेजें';
	@override String get unblock => 'अनब्लॉक करें';
	@override String get block => 'ब्लॉक';
	@override String get writeyourmessage => 'अपना संदेश लिखें...';
	@override String get clearconversation => 'स्पष्ट बातचीत';
	@override String get clearconversationhintone => 'इस क्रिया से आपकी सारी बातचीत साफ़ हो जाएगी';
	@override String get clearconversationhinttwo => '. __एनएल__ कृपया ध्यान दें कि यह केवल बातचीत के आपके पक्ष को हटाता है, संदेश अभी भी आपके साझेदार चैट पर दिखाई देंगे।';
	@override String get facebookloginerror => 'लॉगिन प्रक्रिया में कुछ गड़बड़ी हुई. __एनएल__, यह वह त्रुटि है जो फेसबुक ने हमें दी है';
	@override String get mylibrary => 'मेरी लाइब्रेरी';
	@override String get prayer_request => 'प्रार्थना अनुरोध या गवाही';
	@override String get mySubscription => 'मेरी सदस्यता';
	@override String get giveandpart => 'देना और साझेदारी';
	@override String get follow_us => 'हमें फॉलो करें';
	@override String get profile => 'प्रोफाइल';
	@override String get no_phone => 'कोई फ़ोन नहीं';
	@override String get no_address => 'कोई पता नहीं';
	@override String get changepwd => 'पासवर्ड बदलें';
	@override String get help_support => 'सहायता और समर्थन';
	@override String get quest_logout => 'क्या आप ऐप से लॉगआउट करना चाहते हैं?';
	@override String get no => 'नहीं';
	@override String get yes => 'हाँ';
	@override String get enjoy_using => 'प्रयोग का आनंद लें';
	@override String get tap_rate => 'ऐप स्टोर पर स्टार रेट पर टैप करें';
	@override String get please_rate => 'कृपया अपनी रेटिंग दर्ज करें';
	@override String get submit => 'सबमिट करें';
	@override String get select_email => 'लिखने के लिए ईमेल ऐप चुनें';
	@override String get open_mail => 'मेल ऐप खोलें';
	@override String get no_mailer => 'कोई मेल ऐप्स इंस्टॉल नहीं है';
	@override String get login_request => 'अनुरोध देखने के लिए लॉगिन करें';
	@override String get empty => 'ख़ाली';
	@override String get send_prayer => 'कोई आइटम नहीं मिला \n एक नया प्रार्थना अनुरोध या गवाही भेजें';
	@override String get podcast => 'पॉडकास्ट';
	@override String get new_prayer_req => 'नया प्रार्थना अनुरोध या गवाही';
	@override String get read_more => 'और पढ़ें';
	@override String get details => 'विवरण';
	@override String get added_bookmark => 'बुकमार्क में जोड़ा गया';
	@override String get removed_bookmark => 'बुकमार्क से हटा दिया गया';
	@override String get delete_account => 'खाता हटाएँ';
	@override String get appDescriptionSupport => 'लाइटहाउस ग्लोबल मिशन को दान देने के माध्यम से आपकी साझेदारी हमें दुनिया भर में उनके जीवन बदलने वाले शब्द और पवित्र आत्मा की चमत्कारी कार्य शक्ति को लाने में भगवान के आह्वान को पूरा करने में और अधिक सक्षम बनाती है। और आपके प्रत्येक बलिदान को प्रभु द्वारा प्रचुर मात्रा में पुरस्कृत किया जाएगा और गुणा के साथ फिर से भर दिया जाएगा, जैसा कि उन्होंने अपने वचन से गारंटी दी है (पवित्रशास्त्र संदर्भ: मार्क 10:29-30, ल्यूक 6:38)।';
	@override String get giving_via_paypal => 'पेपैल के माध्यम से दे रहे हैं';
	@override String get click_to_give => 'देने के लिए क्लिक करें';
	@override String get additional_giving => 'अतिरिक्त विकल्प दे रहे हैं';
	@override String get email => 'ईमेल';
	@override String get aboutcontent_para_1 => 'लाइटहाउस ग्लोबल मिशन राष्ट्रों में यीशु मसीह की रोशनी लाने के लिए ईश्वर के आह्वान को पूरा कर रहा है। आपकी दैनिक प्रकाश भक्ति उन तरीकों में से एक है जिसके द्वारा हम यीशु मसीह के सुसमाचार और ईश्वर के ज्ञानवर्धक वचन को दुनिया भर के लोगों तक पहुंचाने के इस आह्वान को पूरा कर रहे हैं। यह भक्ति, मसीह में विजयी और पूर्ण जीवन के लिए व्यक्तियों तक प्रतिदिन ईश्वर के वचन पहुंचाती है, जिससे उन्हें ईश्वर के ज्ञान में वृद्धि करने, पवित्र आत्मा की शक्ति में चलने, अपने जीवन के उद्देश्य की खोज करने और अपने जीवन के लिए ईश्वर के आह्वान को पूरा करने में सक्षम बनाया जाता है।';
	@override String get aboutcontent_para_2 => 'हमें खुशी है कि आप योर डेली लाइट ऐप के साथ जुड़कर आपके पोषण और आध्यात्मिक विकास के लिए ईश्वर के वचनों की दैनिक खुराक तक मुफ्त पहुंच प्रदान कर रहे हैं। हम आपको अपने जीवन में इस भक्ति के प्रभाव को साझा करने, दूसरों को ऐप डाउनलोड करने के लिए आमंत्रित करने और भगवान की महिमा के लिए अधिक लोगों तक पहुंचने में हमारी मदद करने में योगदान देने के लिए भी प्रोत्साहित करते हैं। एप्लिकेशन में सीधे शेयर बटन दबाएं और दूसरों को आज ही ऐप डाउनलोड करने के लिए आमंत्रित करें।';
	@override String get aboutcontent_para_3 => 'एप्लिकेशन होम अनुभाग पर, आपको ईश्वर क्या कह रहा है, इसके मौसमी भविष्यवाणी संदेश भी मिलेंगे, मंत्रालय की घटनाओं के साथ अपडेट रहें, वास्तविक जीवन की गवाही पढ़ें और लाइटहाउस ग्लोबल मिशनों के माध्यम से ईश्वर जो कर रहा है उसका हिस्सा बनने के अवसरों की खोज करें।';
	@override String get aboutcontent_para_4 => 'आप गवाही और प्रार्थना अनुभाग का उपयोग करके अपनी गवाही भी साझा कर सकते हैं और प्रार्थना अनुरोध सबमिट कर सकते हैं। हमें आपके जीवन में आपके दैनिक प्रकाश के प्रभाव के बारे में पढ़कर और आपकी ज़रूरत के क्षेत्रों में आपके साथ प्रार्थना करके खुशी होगी। बिल्ट-इन बुक स्टोर से, आप सीधे अपने विकास में तेजी लाने के लिए प्रासंगिक सामग्री पा सकते हैं और प्राप्त कर सकते हैं।';
	@override String get aboutcontent_para_5 => 'आपका डेली लाइट ऐप केवल वित्तीय साझेदारी के माध्यम से आप जैसे व्यक्तियों की उदारता से वैश्विक दर्शकों के लिए मुफ़्त और सुलभ बनाया गया है। हमारे पास मंत्रालय के कई अन्य रास्ते भी हैं जहां हर उपहार एक अंतर बनाता है। आप भी इस मंत्रालय को देकर इस मिशन से जुड़ सकते हैं. और ईश्वर जो अपने उद्देश्य के लिए हर बलिदान का प्रतिफल देने की गारंटी देता है, वह आपको आपके उपहार को कई गुना बढ़ाकर और विविध आशीषों से पुरस्कृत करेगा। आपका दान कई जिंदगियों में बदलाव लाएगा। दान देने के तरीके देखने के लिए दान और साझेदारी अनुभाग का उपयोग करें।';
	@override String get aboutcontent_para_6a => 'लाइटहाउस ग्लोबल मिशन के बारे में अधिक जानें';
	@override String get aboutcontent_para_6b => 'या';
	@override String get aboutcontent_para_7a => 'हमारे न्यूज़लेटर की सदस्यता लें';
	@override String get aboutcontent_para_7b => 'अद्यतन रहने के लिए और भगवान जो पूरा कर रहा है उसमें शामिल होने के लिए।';
	@override String get aboutcontent_para_8a => 'आप पादरी साइमन से यहां भी संपर्क कर सकते हैं:';
	@override String get apptagline => 'दैनिक रोशनी और आध्यात्मिक विकास के लिए भक्ति ऐप';
	@override String get seebankdetails => 'बैंक हस्तांतरण विवरण देखें';
	@override String get via_bank => 'बैंक के माध्यम से';
	@override String get bank_details => 'बैंक हस्तांतरण विवरण';
	@override String get account_name => 'खाता नाम';
	@override String get bank => 'किनारा';
	@override String get iban => 'आईबीएएन';
	@override String get myProfile => 'मेरी प्रोफाइल';
}

// Path: <root>
class _StringsIt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIt.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsIt _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Seleziona lingua';
	@override String get chooseapplanguage => 'Scegli la lingua dell\'app';
	@override String get nightmode => 'Modalità notturna';
	@override String get initializingapp => 'inizializzazione...';
	@override String get home => 'Casa';
	@override String get branches => 'Rami';
	@override String get inbox => 'Posta in arrivo';
	@override String get downloads => 'Download';
	@override String get settings => 'Impostazioni';
	@override String get events => 'Eventi';
	@override String get myplaylists => 'Le mie playlist';
	@override String get website => 'Sito web';
	@override String get hymns => 'Inni';
	@override String get articles => 'Articoli';
	@override String get notes => 'Note';
	@override String get donate => 'Dona';
	@override String get savenotetitle => 'Titolo della nota';
	@override String get nonotesfound => 'Nessuna nota trovata';
	@override String get newnote => 'Nuovo';
	@override String get deletenote => 'Elimina nota';
	@override String get deletenotehint => 'Vuoi eliminare questa nota? Questa azione non può essere annullata.';
	@override String get bookmarks => 'Segnalibri';
	@override String get socialplatforms => 'Piattaforme sociali';
	@override List<String> get onboardingpagetitles => [
		'LA TUA LUCE QUOTIDIANA',
		'CREA UN ACCOUNT',
		'CONDIVIDI',
		'RIMANI AGGIORNATO',
	];
	@override List<String> get onboardingpagehints => [
		'Trova l\'illuminazione quotidiana dalla Parola di Dio attraverso devozionali e podcast',
		'Accedi a contenuti stimolanti, costruisci la tua libreria personale e porta la parola di Dio con te ovunque',
		'Condividi o leggi testimonianze stimolanti da tutto il mondo. Condividi le richieste di preghiera e trova supporto tempestivo',
		'Scopri cosa Dio dice per la stagione, rimani aggiornato sugli eventi e scopri modi per unirti al movimento',
	];
	@override String get next => 'AVANTI';
	@override String get done => 'Inizia';
	@override String get quitapp => 'Esci dall\'app!';
	@override String get quitappwarning => 'Desideri chiudere l\'app?';
	@override String get quitappaudiowarning => 'Stai attualmente riproducendo un audio, chiudendo l\'app si interromperà la riproduzione audio. Se non desideri interrompere la riproduzione, minimizza semplicemente l\'app con il pulsante centrale o fai clic sul pulsante Ok per uscire subito dall\'app.';
	@override String get ok => 'Ok';
	@override String get retry => 'RIPROVARE';
	@override String get oops => 'Ops!';
	@override String get save => 'Salva';
	@override String get cancel => 'Annulla';
	@override String get error => 'Errore';
	@override String get success => 'Successo';
	@override String get skip => 'Salta';
	@override String get skiplogin => 'Salta l\'accesso';
	@override String get skipregister => 'Salta la registrazione';
	@override String get dataloaderror => 'Impossibile caricare i dati richiesti al momento, controlla la connessione dati e fai clic per riprovare.';
	@override String get suggestedforyou => 'Suggerito per te';
	@override String get videomessages => 'Messaggi video';
	@override String get audiomessages => 'Messaggi audio';
	@override String get devotionals => 'Devozionali';
	@override String get categories => 'Categorie';
	@override String get category => 'Categoria';
	@override String get videos => 'Video';
	@override String get audios => 'Audio';
	@override String get biblebooks => 'Bibbia';
	@override String get audiobible => 'Bibbia audio';
	@override String get livestreams => 'Livestream';
	@override String get radio => 'Radio';
	@override String get allitems => 'Tutti gli articoli';
	@override String get emptyplaylist => 'Nessuna playlist';
	@override String get notsupported => 'Non supportato';
	@override String get cleanupresources => 'Ripulire le risorse';
	@override String get grantstoragepermission => 'Concedere l\'autorizzazione di accesso allo spazio di archiviazione per continuare';
	@override String get sharefiletitle => 'Guarda o ascolta';
	@override String get sharefilebody => 'Tramite l\'app Your Daily Light, scaricala ora su';
	@override String get sharetext => 'Goditi lo streaming audio e video illimitato';
	@override String get sharetexthint => 'Unisciti alla piattaforma di streaming video e audio che ti consente di guardare e ascoltare milioni di file da tutto il mondo. Scarica ora su';
	@override String get download => 'Scarica';
	@override String get addplaylist => 'Aggiungi alla playlist';
	@override String get bookmark => 'Segnalibro';
	@override String get unbookmark => 'Annulla segnalibro';
	@override String get share => 'Condividi';
	@override String get deletemedia => 'Elimina file';
	@override String get deletemediahint => 'Desideri eliminare questo file scaricato? Questa azione non può essere annullata.';
	@override String get searchhint => 'Cerca messaggi audio e video';
	@override String get performingsearch => 'Ricerca di audio e video';
	@override String get nosearchresult => 'Nessun risultato trovato';
	@override String get nosearchresulthint => 'Prova a inserire una parola chiave più generale';
	@override String get addtoplaylist => 'Aggiungi alla playlist';
	@override String get newplaylist => 'Nuova playlist';
	@override String get playlistitm => 'Playlist';
	@override String get mediaaddedtoplaylist => 'File multimediali aggiunti alla playlist.';
	@override String get mediaremovedfromplaylist => 'File multimediali rimossi dalla playlist';
	@override String get clearplaylistmedias => 'Cancella tutti i media';
	@override String get deletePlayList => 'Elimina playlist';
	@override String get clearplaylistmediashint => 'Vuoi procedere e rimuovere tutti i contenuti multimediali da questa playlist?';
	@override String get deletePlayListhint => 'Vuoi procedere ed eliminare questa playlist e cancellare tutti i contenuti multimediali?';
	@override String get comments => 'Commenti';
	@override String get replies => 'Risposte';
	@override String get reply => 'Rispondi';
	@override String get logintoaddcomment => 'Accedi per aggiungere un commento';
	@override String get logintoreply => 'Accedi per rispondere';
	@override String get writeamessage => 'Scrivi un messaggio...';
	@override String get nocomments => 'Nessun commento trovato \n fai clic per riprovare';
	@override String get errormakingcomments => 'Impossibile elaborare i commenti al momento..';
	@override String get errordeletingcomments => 'Impossibile eliminare questo commento al momento..';
	@override String get erroreditingcomments => 'Impossibile modificare questo commento al momento..';
	@override String get errorloadingmorecomments => 'Impossibile caricare altri commenti al momento..';
	@override String get deletingcomment => 'Eliminazione commento';
	@override String get editingcomment => 'Modifica del commento';
	@override String get deletecommentalert => 'Elimina commento';
	@override String get editcommentalert => 'Modifica commento';
	@override String get deletecommentalerttext => 'Desideri eliminare questo commento? Questa azione non può essere annullata';
	@override String get loadmore => 'caricare di più';
	@override String get messages => 'Messaggi';
	@override String get guestuser => 'Utente ospite';
	@override String get fullname => 'Nome completo';
	@override String get emailaddress => 'Indirizzo e-mail';
	@override String get password => 'Parola d\'ordine';
	@override String get repeatpassword => 'Ripeti password';
	@override String get register => 'Registrati';
	@override String get login => 'Accedi';
	@override String get logout => 'Esci';
	@override String get logoutfromapp => 'Disconnettersi dall\'app?';
	@override String get logoutfromapphint => 'Non potrai mettere mi piace o commentare articoli e video se non hai effettuato l\'accesso.';
	@override String get gotologin => 'Vai su Accedi';
	@override String get resetpassword => 'Reimposta password';
	@override String get logintoaccount => 'Hai già un account? Accedi';
	@override String get emptyfielderrorhint => 'È necessario compilare tutti i campi';
	@override String get invalidemailerrorhint => 'È necessario inserire un indirizzo email valido';
	@override String get passwordsdontmatch => 'Le password non corrispondono';
	@override String get processingpleasewait => 'Elaborazione in corso. Attendi...';
	@override String get createaccount => 'Crea un account';
	@override String get forgotpassword => 'Password dimenticata?';
	@override String get orloginwith => 'Oppure accedi con';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Più opzioni';
	@override String get about => 'Chi siamo';
	@override String get privacy => 'Informativa sulla privacy';
	@override String get terms => 'Termini dell\'app';
	@override String get rate => 'Valuta l\'app';
	@override String get version => 'Versione';
	@override String get pulluploadmore => 'tirare su il carico';
	@override String get loadfailedretry => 'Caricamento non riuscito! Fare clic su Riprova!';
	@override String get releaseloadmore => 'rilasciare per caricare altro';
	@override String get nomoredata => 'Niente più dati';
	@override String get errorReportingComment => 'Commento sulla segnalazione degli errori';
	@override String get reportingComment => 'Segnalazione commento';
	@override String get reportcomment => 'Opzioni di rapporto';
	@override List<String> get reportCommentsList => [
		'Contenuti commerciali indesiderati o spam',
		'Pornografia o materiale sessuale esplicito',
		'Incitamento all\'odio o violenza esplicita',
		'Molestie o bullismo',
	];
	@override String get bookmarksMedia => 'I miei segnalibri';
	@override String get noitemstodisplay => 'Nessun elemento da visualizzare';
	@override String get loginrequired => 'Accesso richiesto';
	@override String get loginrequiredhint => 'Per iscriverti a questa piattaforma, devi essere loggato. Crea subito un account gratuito o accedi al tuo account esistente.';
	@override String get subscriptions => 'Abbonamenti all\'app';
	@override String get subscribe => 'ISCRIVITI';
	@override String get subscribehint => 'Abbonamento richiesto';
	@override String get playsubscriptionrequiredhint => 'È necessario abbonarsi prima di poter ascoltare o guardare questo contenuto multimediale.';
	@override String get previewsubscriptionrequiredhint => 'Hai raggiunto la durata dell\'anteprima consentita per questo supporto. Devi iscriverti per continuare ad ascoltare o guardare questo media.';
	@override String get copiedtoclipboard => 'Copiato negli appunti';
	@override String get downloadbible => 'Scarica Bibbia';
	@override String get downloadversion => 'Scarica';
	@override String get downloading => 'Download in corso';
	@override String get failedtodownload => 'Impossibile scaricare';
	@override String get pleaseclicktoretry => 'Fare clic per riprovare.';
	@override String get of => 'Di';
	@override String get nobibleversionshint => 'Non ci sono dati biblici da visualizzare, fai clic sul pulsante in basso per scaricare almeno una versione della Bibbia.';
	@override String get downloaded => 'Scaricato';
	@override String get enteremailaddresstoresetpassword => 'Inserisci la tua email per reimpostare la password';
	@override String get backtologin => 'TORNA ALL\'ACCESSO';
	@override String get signintocontinue => 'Accedi per continuare';
	@override String get signin => 'S I G N I N';
	@override String get signinforanaccount => 'REGISTRARE UN ACCOUNT?';
	@override String get alreadyhaveanaccount => 'Hai già un account?';
	@override String get updateprofile => 'Aggiorna profilo';
	@override String get updateprofilehint => 'Per iniziare, aggiorna la pagina del tuo profilo, questo ci aiuterà a metterti in contatto con altre persone';
	@override String get autoplayvideos => 'Video con riproduzione automatica';
	@override String get gosocial => 'Diventa sociale';
	@override String get searchbible => 'Cerca Bibbia';
	@override String get filtersearchoptions => 'Filtra le opzioni di ricerca';
	@override String get narrowdownsearch => 'Utilizza il pulsante filtro qui sotto per restringere la ricerca e ottenere un risultato più preciso.';
	@override String get searchbibleversion => 'Cerca la versione della Bibbia';
	@override String get searchbiblebook => 'Cerca il libro della Bibbia';
	@override String get search => 'Cerca';
	@override String get setBibleBook => 'Impostare il libro della Bibbia';
	@override String get oldtestament => 'Antico Testamento';
	@override String get newtestament => 'Nuovo Testamento';
	@override String get limitresults => 'Limitare i risultati';
	@override String get setfilters => 'Imposta filtri';
	@override String get bibletranslator => 'Traduttore della Bibbia';
	@override String get chapter => 'Capitolo';
	@override String get verse => 'Versetto';
	@override String get translate => 'tradurre';
	@override String get bibledownloadinfo => 'Download della Bibbia avviato. Non chiudere questa pagina fino al termine del download.';
	@override String get received => 'ricevuto';
	@override String get outoftotal => 'fuori totale';
	@override String get set => 'IMPOSTARE';
	@override String get selectColor => 'Seleziona Colore';
	@override String get switchbibleversion => 'Cambia versione della Bibbia';
	@override String get switchbiblebook => 'Cambia libro biblico';
	@override String get gotosearch => 'Vai al capitolo';
	@override String get changefontsize => 'Modifica dimensione carattere';
	@override String get font => 'Carattere';
	@override String get readchapter => 'Leggi il capitolo';
	@override String get showhighlightedverse => 'Mostra i versi evidenziati';
	@override String get downloadmoreversions => 'Scarica più versioni';
	@override String get suggestedusers => 'Utenti suggeriti da seguire';
	@override String get unfollow => 'Smetti di seguire';
	@override String get follow => 'Segui';
	@override String get searchforpeople => 'Cerca persone';
	@override String get viewpost => 'Visualizza messaggio';
	@override String get viewprofile => 'Visualizza profilo';
	@override String get mypins => 'I miei Pin';
	@override String get viewpinnedposts => 'Visualizza i post fissati';
	@override String get personal => 'Personale';
	@override String get update => 'Aggiorna';
	@override String get phonenumber => 'Numero di telefono';
	@override String get showmyphonenumber => 'Mostra il mio numero di telefono agli utenti';
	@override String get dateofbirth => 'Data di nascita';
	@override String get showmyfulldateofbirth => 'Mostra la mia data di nascita completa alle persone che visualizzano il mio stato';
	@override String get notifications => 'Notifiche';
	@override String get notifywhenuserfollowsme => 'Avvisami quando un utente mi segue';
	@override String get notifymewhenusercommentsonmypost => 'Avvisami quando gli utenti commentano il mio post';
	@override String get notifymewhenuserlikesmypost => 'Avvisami quando agli utenti piace il mio post';
	@override String get churchsocial => 'Chiesa Sociale';
	@override String get shareyourthoughts => 'Condividi i tuoi pensieri';
	@override String get readmore => '...Leggi di più';
	@override String get less => 'Meno';
	@override String get couldnotprocess => 'Impossibile elaborare l\'azione richiesta.';
	@override String get pleaseselectprofilephoto => 'Seleziona una foto del profilo da caricare';
	@override String get pleaseselectprofilecover => 'Seleziona una foto di copertina da caricare';
	@override String get updateprofileerrorhint => 'Devi inserire il tuo nome, data di nascita, sesso, telefono e posizione prima di poter procedere.';
	@override String get gender => 'Genere';
	@override String get male => 'Maschio';
	@override String get female => 'Femmina';
	@override String get dob => 'Data di nascita';
	@override String get location => 'Posizione attuale';
	@override String get qualification => 'Qualificazione';
	@override String get aboutme => 'Su di me';
	@override String get facebookprofilelink => 'Collegamento al profilo Facebook';
	@override String get twitterprofilelink => 'Collegamento al profilo Twitter';
	@override String get linkdln => 'Collegamento al profilo Linkedln';
	@override String get likes => 'Mi piace';
	@override String get likess => 'Mi piace/i';
	@override String get pinnedposts => 'I miei post fissati';
	@override String get unpinpost => 'Sblocca il messaggio';
	@override String get unpinposthint => 'Desideri rimuovere questo post dai tuoi post fissati?';
	@override String get postdetails => 'Dettagli del messaggio';
	@override String get posts => 'Messaggi';
	@override String get followers => 'Seguaci';
	@override String get followings => 'Seguenti';
	@override String get my => 'Mio';
	@override String get edit => 'Modifica';
	@override String get delete => 'Elimina';
	@override String get deletepost => 'Elimina messaggio';
	@override String get deleteposthint => 'Desideri eliminare questo post? I post possono ancora apparire sui feed di alcuni utenti.';
	@override String get maximumallowedsizehint => 'È stato raggiunto il caricamento massimo di file consentito';
	@override String get maximumuploadsizehint => 'Il file selezionato supera il limite di dimensioni del file di caricamento consentito.';
	@override String get makeposterror => 'Impossibile pubblicare il post al momento, fare clic per riprovare.';
	@override String get makepost => 'Crea post';
	@override String get selectfile => 'Seleziona File';
	@override String get images => 'Immagini';
	@override String get shareYourThoughtsNow => 'Condividi i tuoi pensieri...';
	@override String get photoviewer => 'Visualizzatore di foto';
	@override String get nochatsavailable => 'Nessuna conversazione disponibile \n Fai clic sull\'icona di aggiunta sotto \n per selezionare gli utenti con cui chattare';
	@override String get typing => 'Digitando...';
	@override String get photo => 'Foto';
	@override String get online => 'In linea';
	@override String get offline => 'Non in linea';
	@override String get lastseen => 'Visto l\'ultima volta';
	@override String get deleteselectedhint => 'Questa azione eliminerà i messaggi selezionati.  Tieni presente che questo eliminerà solo la tua parte della conversazione, \n i messaggi continueranno a essere visualizzati sul dispositivo del tuo partner.';
	@override String get deleteselected => 'Elimina selezionato';
	@override String get unabletofetchconversation => 'Impossibile recuperare \n la tua conversazione con \n';
	@override String get loadmoreconversation => 'Carica più conversazioni';
	@override String get sendyourfirstmessage => 'Invia il tuo primo messaggio a \n';
	@override String get unblock => 'Sblocca';
	@override String get block => 'Blocca';
	@override String get writeyourmessage => 'Scrivi il tuo messaggio...';
	@override String get clearconversation => 'Conversazione chiara';
	@override String get clearconversationhintone => 'Questa azione cancellerà tutta la conversazione con';
	@override String get clearconversationhinttwo => '. \n Tieni presente che questa operazione elimina solo la tua parte della conversazione, i messaggi verranno comunque visualizzati nella chat del tuo partner.';
	@override String get facebookloginerror => 'Qualcosa è andato storto durante la procedura di accesso. \n, ecco l\'errore che Facebook ci ha fornito';
	@override String get mylibrary => 'La mia biblioteca';
	@override String get prayer_request => 'Richiesta di preghiera o testimonianza';
	@override String get mySubscription => 'Il mio abbonamento';
	@override String get giveandpart => 'Donazione e partenariato';
	@override String get follow_us => 'Seguici su';
	@override String get profile => 'Profilo';
	@override String get no_phone => 'Niente telefono';
	@override String get no_address => 'Nessun indirizzo';
	@override String get changepwd => 'Cambia password';
	@override String get help_support => 'Aiuto e supporto';
	@override String get quest_logout => 'Vuoi disconnetterti dall\'app?';
	@override String get no => 'No';
	@override String get yes => 'SÌ';
	@override String get enjoy_using => 'Divertiti ad usare';
	@override String get tap_rate => 'Tocca una stella per valutarlo sull\'App Store';
	@override String get please_rate => 'Inserisci la tua valutazione';
	@override String get submit => 'presentare';
	@override String get select_email => 'Seleziona l\'app di posta elettronica per comporre';
	@override String get open_mail => 'Apri l\'applicazione di posta';
	@override String get no_mailer => 'Nessuna app di posta installata';
	@override String get login_request => 'Accedi per visualizzare la richiesta';
	@override String get empty => 'Vuoto';
	@override String get send_prayer => 'Nessun elemento trovato \n Invia una nuova richiesta di preghiera o testimonianza';
	@override String get podcast => 'Podcast';
	@override String get new_prayer_req => 'Nuova richiesta di preghiera o testimonianza';
	@override String get read_more => 'LEGGI DI PIÙ';
	@override String get details => 'Dettagli';
	@override String get added_bookmark => 'Aggiunto ai segnalibri';
	@override String get removed_bookmark => 'Rimosso dai segnalibri';
	@override String get delete_account => 'Elimina account';
	@override String get appDescriptionSupport => 'La tua collaborazione attraverso le donazioni a Lighthouse Global Missions ci consente di realizzare di più nell’adempimento della chiamata di Dio nel portare la Sua parola che cambia la vita e la potenza miracolosa dello Spirito Santo in tutto il mondo. E ogni tuo sacrificio sarà riccamente ricompensato e riempito con moltiplicazione dal Signore, proprio come Egli ha garantito con la Sua parola (Riferimenti scritturali: Marco 10:29-30, Luca 6:38).';
	@override String get giving_via_paypal => 'Donare tramite PayPal';
	@override String get click_to_give => 'Clicca per donare';
	@override String get additional_giving => 'Ulteriori opzioni di donazione';
	@override String get email => 'E-mail';
	@override String get aboutcontent_para_1 => 'Lighthouse Global Missions sta adempiendo alla chiamata di Dio di portare la luce di Gesù Cristo alle nazioni. Il tuo devozionale Daily Light è uno dei modi in cui stiamo adempiendo a questa chiamata a portare il Vangelo di Gesù Cristo e la parola illuminante di Dio alle persone di tutto il mondo. Questo devozionale porta quotidianamente la parola di Dio agli individui per una vita vittoriosa e appagante in Cristo, consentendo loro di crescere nella conoscenza di Dio, camminare nella potenza dello Spirito Santo, scoprire lo scopo della loro vita e soddisfare la chiamata di Dio per le loro vite.';
	@override String get aboutcontent_para_2 => 'Siamo lieti di averti a bordo dell’app Your Daily Light, garantendoti l’accesso gratuito a una dose quotidiana della parola di Dio per il tuo nutrimento e sviluppo spirituale. Ti incoraggiamo anche a condividere l\'impatto di questa devozione nella tua vita, invitare altri a scaricare l\'app e contribuire ad aiutarci a raggiungere più persone per la gloria di Dio. Premi direttamente il pulsante di condivisione nell\'applicazione e invita altri a scaricare l\'app oggi stesso.';
	@override String get aboutcontent_para_3 => 'Nella sezione iniziale dell\'applicazione troverai anche messaggi profetici stagionali su ciò che Dio sta dicendo, rimani aggiornato con gli eventi del ministero, leggi testimonianze di vita reale e scopri opportunità per essere parte di ciò che Dio sta facendo attraverso Lighthouse Global Missions.';
	@override String get aboutcontent_para_4 => 'Puoi anche condividere le tue testimonianze e inviare richieste di preghiera utilizzando la sezione testimonianze e preghiere. Saremo lieti di leggere l\'impatto della Tua Luce Quotidiana nella tua vita e di pregare con te nelle aree di bisogno. Dalla libreria integrata, puoi trovare e ottenere direttamente materiali pertinenti per accelerare la tua crescita.';
	@override String get aboutcontent_para_5 => 'La tua app Daily Light è resa gratuita e accessibile a un pubblico globale solo grazie alla generosità di persone come te attraverso una partnership finanziaria. Abbiamo anche molte altre vie di ministero in cui ogni dono fa la differenza. Anche tu puoi unirti a questa missione donando a questo ministero. E Dio, che garantisce di premiare ogni sacrificio per il Suo scopo, ti ricompenserà riccamente con una moltiplicazione del tuo dono e con diverse benedizioni. La tua donazione farà la differenza in molte vite. Utilizza la sezione Donazioni e partnership per vedere come donare.';
	@override String get aboutcontent_para_6a => 'Scopri di più sulle missioni globali Lighthouse su';
	@override String get aboutcontent_para_6b => 'O';
	@override String get aboutcontent_para_7a => 'Iscriviti alla nostra newsletter su';
	@override String get aboutcontent_para_7b => 'per rimanere aggiornato e lasciarsi coinvolgere da ciò che Dio sta realizzando.';
	@override String get aboutcontent_para_8a => 'Puoi anche metterti in contatto con il pastore Simon a:';
	@override String get apptagline => 'App devozionale per l\'illuminazione quotidiana e la crescita spirituale';
	@override String get seebankdetails => 'Vedi i dettagli del bonifico bancario';
	@override String get via_bank => 'tramite Banca';
	@override String get bank_details => 'Dettagli bonifico bancario';
	@override String get account_name => 'Nome utente';
	@override String get bank => 'Banca';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Il mio profilo';
}

// Path: <root>
class _StringsPt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsPt _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Selecione o idioma';
	@override String get chooseapplanguage => 'Escolha o idioma do aplicativo';
	@override String get nightmode => 'Modo noturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Página inicial';
	@override String get branches => 'Filiais';
	@override String get inbox => 'Caixa de entrada';
	@override String get downloads => 'Transferências';
	@override String get settings => 'Configurações';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Minhas listas de reprodução';
	@override String get website => 'Site';
	@override String get hymns => 'Hinos';
	@override String get articles => 'Artigos';
	@override String get notes => 'Notas';
	@override String get donate => 'Doe';
	@override String get savenotetitle => 'Título da nota';
	@override String get nonotesfound => 'Nenhuma nota encontrada';
	@override String get newnote => 'Novo';
	@override String get deletenote => 'Excluir nota';
	@override String get deletenotehint => 'Deseja excluir esta nota? Esta ação não pode ser revertida.';
	@override String get bookmarks => 'Favoritos';
	@override String get socialplatforms => 'Plataformas Sociais';
	@override List<String> get onboardingpagetitles => [
		'SUA LUZ DIÁRIA',
		'CRIAR UMA CONTA',
		'COMPARTILHE',
		'MANTENHA-SE ATUALIZADO',
	];
	@override List<String> get onboardingpagehints => [
		'Encontre iluminação diária da palavra de Deus por meio de devocionais e podcasts',
		'Acesse conteúdo inspirador, construa sua biblioteca pessoal e leve a palavra de Deus com você para qualquer lugar',
		'Compartilhe ou leia testemunhos inspiradores de todo o mundo. Compartilhe pedidos de oração e encontre apoio oportuno',
		'Saiba o que Deus está dizendo para a temporada, fique atualizado sobre os acontecimentos e descubra maneiras de se juntar ao movimento',
	];
	@override String get next => 'PRÓXIMO';
	@override String get done => 'Comece';
	@override String get quitapp => 'Saia do aplicativo!';
	@override String get quitappwarning => 'Deseja fechar o aplicativo?';
	@override String get quitappaudiowarning => 'Você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, basta minimizar o aplicativo com o botão central ou clicar no botão OK para sair do aplicativo agora.';
	@override String get ok => 'Ok';
	@override String get retry => 'TENTAR DE NOVO';
	@override String get oops => 'Ops!';
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get error => 'Erro';
	@override String get success => 'Sucesso';
	@override String get skip => 'Pular';
	@override String get skiplogin => 'Pular login';
	@override String get skipregister => 'Pular registro';
	@override String get dataloaderror => 'Não foi possível carregar os dados solicitados no momento. Verifique sua conexão de dados e clique para tentar novamente.';
	@override String get suggestedforyou => 'Sugerido para você';
	@override String get videomessages => 'Mensagens de vídeo';
	@override String get audiomessages => 'Mensagens de áudio';
	@override String get devotionals => 'Devocionais';
	@override String get categories => 'Categorias';
	@override String get category => 'Categoria';
	@override String get videos => 'Vídeos';
	@override String get audios => 'Áudios';
	@override String get biblebooks => 'Bíblia';
	@override String get audiobible => 'Bíblia em Áudio';
	@override String get livestreams => 'Transmissões ao vivo';
	@override String get radio => 'Rádio';
	@override String get allitems => 'Todos os itens';
	@override String get emptyplaylist => 'Sem listas de reprodução';
	@override String get notsupported => 'Não compatível';
	@override String get cleanupresources => 'Limpando recursos';
	@override String get grantstoragepermission => 'Conceda permissão de acesso ao armazenamento para continuar';
	@override String get sharefiletitle => 'Assistir ou ouvir';
	@override String get sharefilebody => 'Através do seu aplicativo Daily Light, baixe agora em';
	@override String get sharetext => 'Desfrute de streaming ilimitado de áudio e vídeo';
	@override String get sharetexthint => 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em';
	@override String get download => 'Baixar';
	@override String get addplaylist => 'Adicionar à lista de reprodução';
	@override String get bookmark => 'Marcador';
	@override String get unbookmark => 'Cancelar marcação';
	@override String get share => 'Compartilhar';
	@override String get deletemedia => 'Excluir arquivo';
	@override String get deletemediahint => 'Deseja excluir este arquivo baixado? Esta ação não pode ser desfeita.';
	@override String get searchhint => 'Pesquisar mensagens de áudio e vídeo';
	@override String get performingsearch => 'Pesquisando Áudios e Vídeos';
	@override String get nosearchresult => 'Nenhum resultado encontrado';
	@override String get nosearchresulthint => 'Tente inserir uma palavra-chave mais geral';
	@override String get addtoplaylist => 'Adicionar à lista de reprodução';
	@override String get newplaylist => 'Nova lista de reprodução';
	@override String get playlistitm => 'Lista de reprodução';
	@override String get mediaaddedtoplaylist => 'Mídia adicionada à lista de reprodução.';
	@override String get mediaremovedfromplaylist => 'Mídia removida da playlist';
	@override String get clearplaylistmedias => 'Limpar todas as mídias';
	@override String get deletePlayList => 'Excluir lista de reprodução';
	@override String get clearplaylistmediashint => 'Quer remover todas as mídias desta playlist?';
	@override String get deletePlayListhint => 'Vá em frente e exclua esta playlist e limpe todas as mídias?';
	@override String get comments => 'Comentários';
	@override String get replies => 'Respostas';
	@override String get reply => 'Responder';
	@override String get logintoaddcomment => 'Faça login para adicionar um comentário';
	@override String get logintoreply => 'Faça login para responder';
	@override String get writeamessage => 'Escreva uma mensagem...';
	@override String get nocomments => 'Nenhum comentário encontrado \n clique para tentar novamente';
	@override String get errormakingcomments => 'Não é possível processar comentários no momento.';
	@override String get errordeletingcomments => 'Não é possível excluir este comentário no momento..';
	@override String get erroreditingcomments => 'Não é possível editar este comentário no momento.';
	@override String get errorloadingmorecomments => 'Não é possível carregar mais comentários no momento.';
	@override String get deletingcomment => 'Excluindo comentário';
	@override String get editingcomment => 'Editando comentário';
	@override String get deletecommentalert => 'Excluir comentário';
	@override String get editcommentalert => 'Editar comentário';
	@override String get deletecommentalerttext => 'Deseja excluir este comentário? Esta ação não pode ser desfeita';
	@override String get loadmore => 'carregar mais';
	@override String get messages => 'Mensagens';
	@override String get guestuser => 'Usuário convidado';
	@override String get fullname => 'Nome Completo';
	@override String get emailaddress => 'Endereço de e-mail';
	@override String get password => 'Senha';
	@override String get repeatpassword => 'Repetir senha';
	@override String get register => 'Cadastre-se';
	@override String get login => 'Entrar';
	@override String get logout => 'Sair';
	@override String get logoutfromapp => 'Sair do aplicativo?';
	@override String get logoutfromapphint => 'Você não poderá curtir ou comentar artigos e vídeos se não estiver logado.';
	@override String get gotologin => 'Vá para Entrar';
	@override String get resetpassword => 'Redefinir senha';
	@override String get logintoaccount => 'Já tem uma conta? Entrar';
	@override String get emptyfielderrorhint => 'Você precisa preencher todos os campos';
	@override String get invalidemailerrorhint => 'Você precisa inserir um endereço de e-mail válido';
	@override String get passwordsdontmatch => 'As senhas não coincidem';
	@override String get processingpleasewait => 'Processando, aguarde...';
	@override String get createaccount => 'Crie uma conta';
	@override String get forgotpassword => 'Esqueceu a senha?';
	@override String get orloginwith => 'Ou faça login com';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mais opções';
	@override String get about => 'Sobre nós';
	@override String get privacy => 'Política de Privacidade';
	@override String get terms => 'Termos do aplicativo';
	@override String get rate => 'Avaliar aplicativo';
	@override String get version => 'Versão';
	@override String get pulluploadmore => 'puxar carga';
	@override String get loadfailedretry => 'Falha ao carregar! Clique em tentar novamente!';
	@override String get releaseloadmore => 'solte para carregar mais';
	@override String get nomoredata => 'Não há mais dados';
	@override String get errorReportingComment => 'Comentário sobre relatório de erros';
	@override String get reportingComment => 'Comentário de relatório';
	@override String get reportcomment => 'Opções de relatório';
	@override List<String> get reportCommentsList => [
		'Conteúdo comercial indesejado ou spam',
		'Pornografia ou material sexual explícito',
		'Discurso de ódio ou violência gráfica',
		'Assédio ou intimidação',
	];
	@override String get bookmarksMedia => 'Meus favoritos';
	@override String get noitemstodisplay => 'Nenhum item para exibir';
	@override String get loginrequired => 'Login obrigatório';
	@override String get loginrequiredhint => 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login na sua conta existente.';
	@override String get subscriptions => 'Assinaturas de aplicativos';
	@override String get subscribe => 'ASSINAR';
	@override String get subscribehint => 'Assinatura necessária';
	@override String get playsubscriptionrequiredhint => 'Você precisa se inscrever antes de poder ouvir ou assistir esta mídia.';
	@override String get previewsubscriptionrequiredhint => 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.';
	@override String get copiedtoclipboard => 'Copiado para a área de transferência';
	@override String get downloadbible => 'Baixar Bíblia';
	@override String get downloadversion => 'Baixar';
	@override String get downloading => 'Baixando';
	@override String get failedtodownload => 'Falha ao baixar';
	@override String get pleaseclicktoretry => 'Clique para tentar novamente.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.';
	@override String get downloaded => 'Baixado';
	@override String get enteremailaddresstoresetpassword => 'Digite seu e-mail para redefinir sua senha';
	@override String get backtologin => 'VOLTAR AO LOGIN';
	@override String get signintocontinue => 'Faça login para continuar';
	@override String get signin => 'S I G N I N';
	@override String get signinforanaccount => 'INSCREVER-SE PARA UMA CONTA?';
	@override String get alreadyhaveanaccount => 'Já tem uma conta?';
	@override String get updateprofile => 'Atualizar perfil';
	@override String get updateprofilehint => 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas';
	@override String get autoplayvideos => 'Vídeos de reprodução automática';
	@override String get gosocial => 'Socialize';
	@override String get searchbible => 'Pesquisar Bíblia';
	@override String get filtersearchoptions => 'Filtrar opções de pesquisa';
	@override String get narrowdownsearch => 'Use o botão de filtro abaixo para restringir a pesquisa e obter um resultado mais preciso.';
	@override String get searchbibleversion => 'Pesquisar versão da Bíblia';
	@override String get searchbiblebook => 'Pesquisar Livro Bíblico';
	@override String get search => 'Pesquisar';
	@override String get setBibleBook => 'Definir livro bíblico';
	@override String get oldtestament => 'Antigo Testamento';
	@override String get newtestament => 'Novo Testamento';
	@override String get limitresults => 'Limitar resultados';
	@override String get setfilters => 'Definir filtros';
	@override String get bibletranslator => 'Tradutor da Bíblia';
	@override String get chapter => 'Capítulo';
	@override String get verse => 'Versículo';
	@override String get translate => 'traduzir';
	@override String get bibledownloadinfo => 'O download da Bíblia foi iniciado. Por favor, não feche esta página até que o download seja concluído.';
	@override String get received => 'recebido';
	@override String get outoftotal => 'do total';
	@override String get set => 'DEFINIR';
	@override String get selectColor => 'Selecione a cor';
	@override String get switchbibleversion => 'Mudar versão da Bíblia';
	@override String get switchbiblebook => 'Trocar livro bíblico';
	@override String get gotosearch => 'Ir para o capítulo';
	@override String get changefontsize => 'Alterar tamanho da fonte';
	@override String get font => 'Fonte';
	@override String get readchapter => 'Leia o capítulo';
	@override String get showhighlightedverse => 'Mostrar versículos destacados';
	@override String get downloadmoreversions => 'Baixe mais versões';
	@override String get suggestedusers => 'Usuários sugeridos para seguir';
	@override String get unfollow => 'Deixar de seguir';
	@override String get follow => 'Siga';
	@override String get searchforpeople => 'Procure pessoas';
	@override String get viewpost => 'Ver postagem';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Meus alfinetes';
	@override String get viewpinnedposts => 'Ver postagens fixadas';
	@override String get personal => 'Pessoal';
	@override String get update => 'Atualizar';
	@override String get phonenumber => 'Número de telefone';
	@override String get showmyphonenumber => 'Mostrar meu número de telefone aos usuários';
	@override String get dateofbirth => 'Data de Nascimento';
	@override String get showmyfulldateofbirth => 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status';
	@override String get notifications => 'Notificações';
	@override String get notifywhenuserfollowsme => 'Notificar-me quando um usuário me seguir';
	@override String get notifymewhenusercommentsonmypost => 'Notificar-me quando os usuários comentarem minha postagem';
	@override String get notifymewhenuserlikesmypost => 'Notifique-me quando os usuários gostarem da minha postagem';
	@override String get churchsocial => 'Igreja Social';
	@override String get shareyourthoughts => 'Compartilhe seus pensamentos';
	@override String get readmore => '...Leia mais';
	@override String get less => 'Menos';
	@override String get couldnotprocess => 'Não foi possível processar a ação solicitada.';
	@override String get pleaseselectprofilephoto => 'Selecione uma foto de perfil para enviar';
	@override String get pleaseselectprofilecover => 'Selecione uma foto de capa para enviar';
	@override String get updateprofileerrorhint => 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de prosseguir.';
	@override String get gender => 'Gênero';
	@override String get male => 'Masculino';
	@override String get female => 'Feminino';
	@override String get dob => 'Data de nascimento';
	@override String get location => 'Localização atual';
	@override String get qualification => 'Qualificação';
	@override String get aboutme => 'Sobre mim';
	@override String get facebookprofilelink => 'Link do perfil do Facebook';
	@override String get twitterprofilelink => 'Link do perfil do Twitter';
	@override String get linkdln => 'Link do perfil do LinkedIn';
	@override String get likes => 'Curtidas';
	@override String get likess => 'Gosto(s)';
	@override String get pinnedposts => 'Minhas postagens fixadas';
	@override String get unpinpost => 'Liberar postagem';
	@override String get unpinposthint => 'Deseja remover esta postagem de suas postagens fixadas?';
	@override String get postdetails => 'Detalhes da postagem';
	@override String get posts => 'Postagens';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Seguidores';
	@override String get my => 'Meu';
	@override String get edit => 'Editar';
	@override String get delete => 'Excluir';
	@override String get deletepost => 'Excluir postagem';
	@override String get deleteposthint => 'Deseja excluir esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.';
	@override String get maximumallowedsizehint => 'Máximo permitido de upload de arquivos atingido';
	@override String get maximumuploadsizehint => 'O arquivo selecionado excede o limite permitido de tamanho de arquivo para upload.';
	@override String get makeposterror => 'Não é possível postar no momento. Clique para tentar novamente.';
	@override String get makepost => 'Fazer postagem';
	@override String get selectfile => 'Selecione o arquivo';
	@override String get images => 'Imagens';
	@override String get shareYourThoughtsNow => 'Compartilhe seus pensamentos ...';
	@override String get photoviewer => 'Visualizador de fotos';
	@override String get nochatsavailable => 'Nenhuma conversa disponível \n Clique no ícone de adição abaixo \n para selecionar usuários com quem conversar';
	@override String get typing => 'Digitando...';
	@override String get photo => 'Foto';
	@override String get online => 'On-line';
	@override String get offline => 'Off-line';
	@override String get lastseen => 'Visto pela última vez';
	@override String get deleteselectedhint => 'Esta ação excluirá as mensagens selecionadas.  Observe que isso exclui apenas o seu lado da conversa. \n as mensagens ainda serão exibidas no dispositivo do seu parceiro.';
	@override String get deleteselected => 'Excluir selecionado';
	@override String get unabletofetchconversation => 'Não foi possível buscar \n sua conversa com \n';
	@override String get loadmoreconversation => 'Carregar mais conversas';
	@override String get sendyourfirstmessage => 'Envie sua primeira mensagem para \n';
	@override String get unblock => 'Desbloquear';
	@override String get block => 'Bloquear';
	@override String get writeyourmessage => 'Escreva sua mensagem...';
	@override String get clearconversation => 'Conversa clara';
	@override String get clearconversationhintone => 'Esta ação limpará toda a sua conversa com';
	@override String get clearconversationhinttwo => '. \n Observe que isso exclui apenas o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo do seu parceiro.';
	@override String get facebookloginerror => 'Algo deu errado com o processo de login. \n, aqui está o erro que o Facebook nos deu';
	@override String get mylibrary => 'Minha biblioteca';
	@override String get prayer_request => 'Pedido de Oração ou Testemunho';
	@override String get mySubscription => 'Minha assinatura';
	@override String get giveandpart => 'Doação e Parceria';
	@override String get follow_us => 'Siga-nos em';
	@override String get profile => 'Perfil';
	@override String get no_phone => 'Sem telefone';
	@override String get no_address => 'Sem endereço';
	@override String get changepwd => 'Alterar senha';
	@override String get help_support => 'Ajuda e suporte';
	@override String get quest_logout => 'Deseja sair do aplicativo?';
	@override String get no => 'Não';
	@override String get yes => 'SIM';
	@override String get enjoy_using => 'Aproveite o uso';
	@override String get tap_rate => 'Toque em uma estrela e avalie-o na App Store';
	@override String get please_rate => 'Por favor, insira sua classificação';
	@override String get submit => 'enviar';
	@override String get select_email => 'Selecione o aplicativo de e-mail para escrever';
	@override String get open_mail => 'Abra o aplicativo Mail';
	@override String get no_mailer => 'Nenhum aplicativo de e-mail instalado';
	@override String get login_request => 'Faça login para visualizar a solicitação';
	@override String get empty => 'Vazio';
	@override String get send_prayer => 'Nenhum item encontrado \n Envie um novo pedido de oração ou testemunho';
	@override String get podcast => 'Podcast';
	@override String get new_prayer_req => 'Novo Pedido de Oração ou Testemunho';
	@override String get read_more => 'LEIA MAIS';
	@override String get details => 'Detalhes';
	@override String get added_bookmark => 'Adicionado aos favoritos';
	@override String get removed_bookmark => 'Removido dos favoritos';
	@override String get delete_account => 'Excluir conta';
	@override String get appDescriptionSupport => 'A sua parceria através de doações à Lighthouse Global Missions permite-nos realizar mais no cumprimento do chamado de Deus ao levar a Sua palavra transformadora de vidas e o poder milagroso do Espírito Santo ao redor do mundo. E todos os seus sacrifícios serão ricamente recompensados ​​e reabastecidos com multiplicação pelo Senhor, assim como Ele garantiu por Sua palavra (Referências das Escrituras: Marcos 10:29-30, Lucas 6:38).';
	@override String get giving_via_paypal => 'Doando via PayPal';
	@override String get click_to_give => 'Clique para dar';
	@override String get additional_giving => 'Opções adicionais de doação';
	@override String get email => 'E-mail';
	@override String get aboutcontent_para_1 => 'A Lighthouse Global Missions está cumprindo o chamado de Deus para levar a Luz de Jesus Cristo às nações. Seu devocional Daily Light é uma das maneiras pelas quais estamos cumprindo esse chamado de levar o Evangelho de Jesus Cristo e a palavra iluminadora de Deus a indivíduos em todo o mundo. Este devocional leva a palavra de Deus diariamente aos indivíduos para uma vida vitoriosa e plena em Cristo, permitindo-lhes crescer no conhecimento de Deus, andar no poder do Espírito Santo, descobrir o propósito de sua vida e cumprir o chamado de Deus para suas vidas.';
	@override String get aboutcontent_para_2 => 'Estamos felizes por você ter aderido ao aplicativo Your Daily Light, concedendo-lhe acesso gratuito a uma dose diária da palavra de Deus para sua nutrição e desenvolvimento espiritual. Também encorajamos você a compartilhar o impacto deste devocional em sua vida, convidar outras pessoas a baixar o aplicativo e contribuir para nos ajudar a alcançar mais pessoas para a glória de Deus. Clique diretamente no botão de compartilhamento no aplicativo e convide outras pessoas para baixar o aplicativo hoje mesmo.';
	@override String get aboutcontent_para_3 => 'Na seção inicial do aplicativo, você também encontrará mensagens proféticas sazonais sobre o que Deus está dizendo, ficará atualizado com os eventos do ministério, lerá testemunhos da vida real e descobrirá oportunidades de fazer parte do que Deus está fazendo por meio do Lighthouse Global Missions.';
	@override String get aboutcontent_para_4 => 'Você também pode compartilhar seu testemunho e enviar pedidos de oração usando a seção de testemunhos e orações. Teremos o maior prazer em ler sobre o impacto da Sua Luz Diária em sua vida e em orar com você em suas áreas de necessidade. Na livraria integrada, você pode encontrar e obter diretamente materiais relevantes para acelerar seu crescimento.';
	@override String get aboutcontent_para_5 => 'Seu aplicativo Daily Light só é gratuito e acessível a um público global pela generosidade de indivíduos como você por meio de parceria financeira. Também temos muitos outros caminhos de ministério onde cada doação faz a diferença. Você também pode se juntar a esta missão doando para este ministério. E Deus, que garante recompensar cada sacrifício para o Seu propósito, irá recompensá-lo ricamente com uma multiplicação da sua dádiva e com diversas bênçãos. Sua doação fará a diferença em muitas vidas. Use a seção Doações e Parcerias para ver maneiras de doar.';
	@override String get aboutcontent_para_6a => 'Saiba mais sobre as Missões Globais da Lighthouse em';
	@override String get aboutcontent_para_6b => 'ou';
	@override String get aboutcontent_para_7a => 'Assine nossa Newsletter em';
	@override String get aboutcontent_para_7b => 'para se manter atualizado e se envolver com o que Deus está realizando.';
	@override String get aboutcontent_para_8a => 'Você também pode entrar em contato com o Pastor Simon em:';
	@override String get apptagline => 'App Devocional para Iluminação Diária e Crescimento Espiritual';
	@override String get seebankdetails => 'Veja detalhes da transferência bancária';
	@override String get via_bank => 'através do banco';
	@override String get bank_details => 'Detalhes da transferência bancária';
	@override String get account_name => 'Nome da conta';
	@override String get bank => 'Banco';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Meu perfil';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => 'Выберите язык';
	@override String get chooseapplanguage => 'Выберите язык приложения';
	@override String get nightmode => 'Ночной режим';
	@override String get initializingapp => 'инициализация...';
	@override String get home => 'Главная';
	@override String get branches => 'Филиалы';
	@override String get inbox => 'Входящие';
	@override String get downloads => 'Загрузки';
	@override String get settings => 'Настройки';
	@override String get events => 'События';
	@override String get myplaylists => 'Мои плейлисты';
	@override String get website => 'Веб-сайт';
	@override String get hymns => 'Гимны';
	@override String get articles => 'Статьи';
	@override String get notes => 'Примечания';
	@override String get donate => 'Пожертвовать';
	@override String get savenotetitle => 'Название заметки';
	@override String get nonotesfound => 'Заметки не найдены';
	@override String get newnote => 'Новый';
	@override String get deletenote => 'Удалить заметку';
	@override String get deletenotehint => 'Вы хотите удалить эту заметку? Это действие невозможно отменить.';
	@override String get bookmarks => 'Закладки';
	@override String get socialplatforms => 'Социальные платформы';
	@override List<String> get onboardingpagetitles => [
		'ВАШ ЕЖЕДНЕВНЫЙ СВЕТ',
		'СОЗДАТЬ АККАУНТ',
		'ПОДЕЛИТЬСЯ',
		'БУДЬТЕ В АКТУАЛЬНОСТИ',
	];
	@override List<String> get onboardingpagehints => [
		'Ежедневно находите озарение в Божьем слове через молитвы и подкасты.',
		'Получите доступ к вдохновляющему контенту, создайте свою личную библиотеку и носите слово Божье с собой куда угодно.',
		'Поделитесь или прочитайте вдохновляющие свидетельства со всего мира. Поделитесь молитвенными просьбами и найдите своевременную поддержку',
		'Узнайте, что Бог говорит об этом сезоне, будьте в курсе событий и найдите способы присоединиться к движению.',
	];
	@override String get next => 'СЛЕДУЮЩИЙ';
	@override String get done => 'Начать';
	@override String get quitapp => 'Выйдите из приложения!';
	@override String get quitappwarning => 'Вы хотите закрыть приложение?';
	@override String get quitappaudiowarning => 'В настоящее время вы воспроизводите звук, выход из приложения остановит воспроизведение звука. Если вы не хотите останавливать воспроизведение, просто сверните приложение с помощью центральной кнопки или нажмите кнопку «ОК», чтобы выйти из приложения сейчас.';
	@override String get ok => 'ок';
	@override String get retry => 'ПОВТОРИТЬ';
	@override String get oops => 'Ой!';
	@override String get save => 'Сохранить';
	@override String get cancel => 'Отмена';
	@override String get error => 'Ошибка';
	@override String get success => 'Успех';
	@override String get skip => 'Пропустить';
	@override String get skiplogin => 'Пропустить вход';
	@override String get skipregister => 'Пропустить регистрацию';
	@override String get dataloaderror => 'В данный момент не удалось загрузить запрошенные данные. Проверьте подключение к данным и нажмите, чтобы повторить попытку.';
	@override String get suggestedforyou => 'Предлагается для вас';
	@override String get videomessages => 'Видеосообщения';
	@override String get audiomessages => 'Аудио сообщения';
	@override String get devotionals => 'Молитвы';
	@override String get categories => 'Категории';
	@override String get category => 'Категория';
	@override String get videos => 'Видео';
	@override String get audios => 'Аудиозаписи';
	@override String get biblebooks => 'Библия';
	@override String get audiobible => 'Аудио Библия';
	@override String get livestreams => 'Прямые трансляции';
	@override String get radio => 'Радио';
	@override String get allitems => 'Все предметы';
	@override String get emptyplaylist => 'Нет плейлистов';
	@override String get notsupported => 'Не поддерживается';
	@override String get cleanupresources => 'Очистка ресурсов';
	@override String get grantstoragepermission => 'Пожалуйста, предоставьте разрешение на доступ к хранилищу, чтобы продолжить.';
	@override String get sharefiletitle => 'Смотрите или слушайте';
	@override String get sharefilebody => 'Через приложение Your Daily Light загрузите сейчас на';
	@override String get sharetext => 'Наслаждайтесь неограниченной потоковой передачей аудио и видео';
	@override String get sharetexthint => 'Присоединяйтесь к платформе потокового видео и аудио, которая позволяет вам смотреть и слушать миллионы файлов со всего мира. Загрузите сейчас на';
	@override String get download => 'Скачать';
	@override String get addplaylist => 'Добавить в плейлист';
	@override String get bookmark => 'Закладка';
	@override String get unbookmark => 'Удалить из закладок';
	@override String get share => 'Поделиться';
	@override String get deletemedia => 'Удалить файл';
	@override String get deletemediahint => 'Вы хотите удалить этот загруженный файл? Это действие невозможно отменить.';
	@override String get searchhint => 'Поиск аудио и видео сообщений';
	@override String get performingsearch => 'Поиск аудио и видео';
	@override String get nosearchresult => 'Результаты не найдены';
	@override String get nosearchresulthint => 'Попробуйте ввести более общее ключевое слово';
	@override String get addtoplaylist => 'Добавить в плейлист';
	@override String get newplaylist => 'Новый плейлист';
	@override String get playlistitm => 'Плейлист';
	@override String get mediaaddedtoplaylist => 'Медиафайл добавлен в плейлист.';
	@override String get mediaremovedfromplaylist => 'Медиафайл удален из плейлиста';
	@override String get clearplaylistmedias => 'Очистить все носители';
	@override String get deletePlayList => 'Удалить плейлист';
	@override String get clearplaylistmediashint => 'Удалить все медиафайлы из этого плейлиста?';
	@override String get deletePlayListhint => 'Удалить этот плейлист и очистить все медиафайлы?';
	@override String get comments => 'Комментарии';
	@override String get replies => 'Ответы';
	@override String get reply => 'Ответить';
	@override String get logintoaddcomment => 'Войдите, чтобы добавить комментарий';
	@override String get logintoreply => 'Войдите, чтобы ответить';
	@override String get writeamessage => 'Напишите сообщение...';
	@override String get nocomments => 'Комментарии не найдены \n нажмите, чтобы повторить попытку';
	@override String get errormakingcomments => 'В данный момент не могу обработать комментарий..';
	@override String get errordeletingcomments => 'Сейчас невозможно удалить этот комментарий..';
	@override String get erroreditingcomments => 'Сейчас невозможно редактировать этот комментарий..';
	@override String get errorloadingmorecomments => 'На данный момент невозможно загрузить больше комментариев..';
	@override String get deletingcomment => 'Удаление комментария';
	@override String get editingcomment => 'Редактирование комментария';
	@override String get deletecommentalert => 'Удалить комментарий';
	@override String get editcommentalert => 'Редактировать комментарий';
	@override String get deletecommentalerttext => 'Вы хотите удалить этот комментарий? Это действие нельзя отменить.';
	@override String get loadmore => 'загрузить больше';
	@override String get messages => 'Сообщения';
	@override String get guestuser => 'Гость пользователь';
	@override String get fullname => 'Полное имя';
	@override String get emailaddress => 'Адрес электронной почты';
	@override String get password => 'Пароль';
	@override String get repeatpassword => 'Повторите пароль';
	@override String get register => 'Зарегистрироваться';
	@override String get login => 'Войти';
	@override String get logout => 'Выход из системы';
	@override String get logoutfromapp => 'Выйти из приложения?';
	@override String get logoutfromapphint => 'Вы не сможете ставить лайки или комментировать статьи и видео, если не вошли в систему.';
	@override String get gotologin => 'Перейти к входу';
	@override String get resetpassword => 'Сбросить пароль';
	@override String get logintoaccount => 'У вас уже есть аккаунт? Войти';
	@override String get emptyfielderrorhint => 'Вам необходимо заполнить все поля';
	@override String get invalidemailerrorhint => 'Вам необходимо ввести действующий адрес электронной почты';
	@override String get passwordsdontmatch => 'Пароли не совпадают';
	@override String get processingpleasewait => 'Обработка. Пожалуйста, подождите...';
	@override String get createaccount => 'Создать учетную запись';
	@override String get forgotpassword => 'Забыли пароль?';
	@override String get orloginwith => 'Или войдите через';
	@override String get facebook => 'Фейсбук';
	@override String get google => 'Гугл';
	@override String get moreoptions => 'Дополнительные параметры';
	@override String get about => 'О нас';
	@override String get privacy => 'Политика конфиденциальности';
	@override String get terms => 'Условия использования приложения';
	@override String get rate => 'Оцените приложение';
	@override String get version => 'Версия';
	@override String get pulluploadmore => 'подтянуть груз';
	@override String get loadfailedretry => 'Не удалось загрузить! Нажмите «Повторить».';
	@override String get releaseloadmore => 'отпустите, чтобы загрузить больше';
	@override String get nomoredata => 'Больше нет данных';
	@override String get errorReportingComment => 'Комментарий к отчету об ошибках';
	@override String get reportingComment => 'Сообщение о комментарии';
	@override String get reportcomment => 'Параметры отчета';
	@override List<String> get reportCommentsList => [
		'Нежелательный коммерческий контент или спам',
		'Порнография или материалы откровенно сексуального характера',
		'Разжигание ненависти или изображения насилия',
		'Преследование или издевательство',
	];
	@override String get bookmarksMedia => 'Мои закладки';
	@override String get noitemstodisplay => 'Нет элементов для отображения';
	@override String get loginrequired => 'Требуется вход';
	@override String get loginrequiredhint => 'Чтобы подписаться на эту платформу, вам необходимо войти в систему. Создайте бесплатную учетную запись сейчас или войдите в существующую учетную запись.';
	@override String get subscriptions => 'Подписки на приложения';
	@override String get subscribe => 'ПОДПИСАТЬСЯ';
	@override String get subscribehint => 'Требуется подписка';
	@override String get playsubscriptionrequiredhint => 'Вам необходимо подписаться, прежде чем вы сможете слушать или смотреть это медиа.';
	@override String get previewsubscriptionrequiredhint => 'Вы достигли разрешенной продолжительности предварительного просмотра для этого медиафайла. Вам необходимо подписаться, чтобы продолжать слушать или смотреть это медиа.';
	@override String get copiedtoclipboard => 'Скопировано в буфер обмена';
	@override String get downloadbible => 'Скачать Библию';
	@override String get downloadversion => 'Скачать';
	@override String get downloading => 'Загрузка';
	@override String get failedtodownload => 'Не удалось скачать';
	@override String get pleaseclicktoretry => 'Пожалуйста, нажмите, чтобы повторить попытку.';
	@override String get of => 'Из';
	@override String get nobibleversionshint => 'Нет библейских данных для отображения. Нажмите кнопку ниже, чтобы загрузить хотя бы одну версию Библии.';
	@override String get downloaded => 'Скачано';
	@override String get enteremailaddresstoresetpassword => 'Введите адрес электронной почты, чтобы сбросить пароль';
	@override String get backtologin => 'НАЗАД К ВХОДУ';
	@override String get signintocontinue => 'Войдите, чтобы продолжить';
	@override String get signin => 'С И Г Н И Н';
	@override String get signinforanaccount => 'ЗАРЕГИСТРИРОВАТЬ СЧЕТ?';
	@override String get alreadyhaveanaccount => 'У вас уже есть аккаунт?';
	@override String get updateprofile => 'Обновить профиль';
	@override String get updateprofilehint => 'Для начала обновите страницу своего профиля, это поможет нам связать вас с другими людьми.';
	@override String get autoplayvideos => 'Автовоспроизведение видео';
	@override String get gosocial => 'Станьте социальным';
	@override String get searchbible => 'Поиск в Библии';
	@override String get filtersearchoptions => 'Фильтровать параметры поиска';
	@override String get narrowdownsearch => 'Используйте кнопку фильтра ниже, чтобы сузить поиск и получить более точный результат.';
	@override String get searchbibleversion => 'Поиск по версии Библии';
	@override String get searchbiblebook => 'Поиск в библейской книге';
	@override String get search => 'Поиск';
	@override String get setBibleBook => 'Установить Библейскую книгу';
	@override String get oldtestament => 'Ветхий Завет';
	@override String get newtestament => 'Новый Завет';
	@override String get limitresults => 'Ограничить результаты';
	@override String get setfilters => 'Установить фильтры';
	@override String get bibletranslator => 'Переводчик Библии';
	@override String get chapter => 'Глава';
	@override String get verse => 'Стих';
	@override String get translate => 'перевести';
	@override String get bibledownloadinfo => 'Загрузка Библии началась. Пожалуйста, не закрывайте эту страницу, пока загрузка не будет завершена.';
	@override String get received => 'получил';
	@override String get outoftotal => 'из общего количества';
	@override String get set => 'НАБОР';
	@override String get selectColor => 'Выберите цвет';
	@override String get switchbibleversion => 'Переключить версию Библии';
	@override String get switchbiblebook => 'Переключить Библию';
	@override String get gotosearch => 'Перейти к главе';
	@override String get changefontsize => 'Изменить размер шрифта';
	@override String get font => 'Шрифт';
	@override String get readchapter => 'Читать главу';
	@override String get showhighlightedverse => 'Показать выделенные стихи';
	@override String get downloadmoreversions => 'Скачать больше версий';
	@override String get suggestedusers => 'Рекомендуемые пользователи на подписку';
	@override String get unfollow => 'Отписаться';
	@override String get follow => 'Следовать';
	@override String get searchforpeople => 'Поиск людей';
	@override String get viewpost => 'Посмотреть сообщение';
	@override String get viewprofile => 'Посмотреть профиль';
	@override String get mypins => 'Мои пины';
	@override String get viewpinnedposts => 'Просмотр закрепленных сообщений';
	@override String get personal => 'Персональный';
	@override String get update => 'Обновить';
	@override String get phonenumber => 'Номер телефона';
	@override String get showmyphonenumber => 'Показывать мой номер телефона пользователям';
	@override String get dateofbirth => 'Дата рождения';
	@override String get showmyfulldateofbirth => 'Показывать мою полную дату рождения людям, просматривающим мой статус';
	@override String get notifications => 'Уведомления';
	@override String get notifywhenuserfollowsme => 'Уведомлять меня, когда пользователь следует за мной';
	@override String get notifymewhenusercommentsonmypost => 'Сообщать мне, когда пользователи комментируют мою публикацию';
	@override String get notifymewhenuserlikesmypost => 'Сообщите мне, когда пользователям понравится мой пост';
	@override String get churchsocial => 'Церковь Социальная';
	@override String get shareyourthoughts => 'Поделитесь своими мыслями';
	@override String get readmore => '...Читать далее';
	@override String get less => 'Меньше';
	@override String get couldnotprocess => 'Не удалось обработать запрошенное действие.';
	@override String get pleaseselectprofilephoto => 'Пожалуйста, выберите фотографию профиля для загрузки';
	@override String get pleaseselectprofilecover => 'Пожалуйста, выберите обложку для загрузки';
	@override String get updateprofileerrorhint => 'Прежде чем продолжить, вам необходимо указать свое имя, дату рождения, пол, телефон и местоположение.';
	@override String get gender => 'Пол';
	@override String get male => 'Мужской';
	@override String get female => 'Женский';
	@override String get dob => 'Дата рождения';
	@override String get location => 'Текущее местоположение';
	@override String get qualification => 'Квалификация';
	@override String get aboutme => 'Обо мне';
	@override String get facebookprofilelink => 'Ссылка на профиль Facebook';
	@override String get twitterprofilelink => 'Ссылка на профиль в Твиттере';
	@override String get linkdln => 'Ссылка на профиль Linkedln';
	@override String get likes => 'Нравится';
	@override String get likess => 'Нравится(а)';
	@override String get pinnedposts => 'Мои закрепленные сообщения';
	@override String get unpinpost => 'Открепить публикацию';
	@override String get unpinposthint => 'Вы хотите удалить эту публикацию из своих закрепленных публикаций?';
	@override String get postdetails => 'Подробности публикации';
	@override String get posts => 'Сообщения';
	@override String get followers => 'Последователи';
	@override String get followings => 'Подписки';
	@override String get my => 'Мой';
	@override String get edit => 'Редактировать';
	@override String get delete => 'Удалить';
	@override String get deletepost => 'Удалить сообщение';
	@override String get deleteposthint => 'Вы хотите удалить этот пост? Сообщения по-прежнему могут появляться в лентах некоторых пользователей.';
	@override String get maximumallowedsizehint => 'Достигнут максимально допустимый уровень загрузки файлов';
	@override String get maximumuploadsizehint => 'Выбранный файл превышает разрешенный размер загружаемого файла.';
	@override String get makeposterror => 'В данный момент невозможно опубликовать сообщение. Нажмите, чтобы повторить попытку.';
	@override String get makepost => 'Сделать публикацию';
	@override String get selectfile => 'Выберите файл';
	@override String get images => 'Изображения';
	@override String get shareYourThoughtsNow => 'Поделитесь своими мыслями...';
	@override String get photoviewer => 'Просмотр фотографий';
	@override String get nochatsavailable => 'Нет доступных разговоров \n Нажмите значок добавления под \n, чтобы выбрать пользователей для общения в чате.';
	@override String get typing => 'Ввод...';
	@override String get photo => 'Фото';
	@override String get online => 'Онлайн';
	@override String get offline => 'Оффлайн';
	@override String get lastseen => 'Последний визит';
	@override String get deleteselectedhint => 'Это действие приведет к удалению выбранных сообщений.  Обратите внимание, что при этом будет удалена только ваша часть разговора, \n сообщения по-прежнему будут отображаться на устройстве вашего партнера.';
	@override String get deleteselected => 'Удалить выбранное';
	@override String get unabletofetchconversation => 'Невозможно получить \n ваш разговор с \n.';
	@override String get loadmoreconversation => 'Загрузить больше разговоров';
	@override String get sendyourfirstmessage => 'Отправьте свое первое сообщение на адрес \n';
	@override String get unblock => 'Разблокировать';
	@override String get block => 'Блокировать';
	@override String get writeyourmessage => 'Напишите свое сообщение...';
	@override String get clearconversation => 'Чистый разговор';
	@override String get clearconversationhintone => 'Это действие очистит весь ваш разговор с';
	@override String get clearconversationhinttwo => '. \n Обратите внимание, что при этом будет удалена только ваша сторона разговора, сообщения по-прежнему будут отображаться в чате ваших партнеров.';
	@override String get facebookloginerror => 'Что-то пошло не так в процессе входа в систему. \n, вот ошибка, которую нам дал Facebook';
	@override String get mylibrary => 'Моя библиотека';
	@override String get prayer_request => 'Молитвенная просьба или свидетельство';
	@override String get mySubscription => 'Моя подписка';
	@override String get giveandpart => 'Дарение и партнерство';
	@override String get follow_us => 'Следуйте за нами';
	@override String get profile => 'Профиль';
	@override String get no_phone => 'Нет телефона';
	@override String get no_address => 'Нет адреса';
	@override String get changepwd => 'Изменить пароль';
	@override String get help_support => 'Помощь и поддержка';
	@override String get quest_logout => 'Вы хотите выйти из приложения?';
	@override String get no => 'Нет';
	@override String get yes => 'ДА';
	@override String get enjoy_using => 'Наслаждайтесь использованием';
	@override String get tap_rate => 'Нажмите звездочку, оцените его в App Store.';
	@override String get please_rate => 'Пожалуйста, введите свой рейтинг';
	@override String get submit => 'отправить';
	@override String get select_email => 'Выберите почтовое приложение для создания';
	@override String get open_mail => 'Открыть почтовое приложение';
	@override String get no_mailer => 'Почтовые приложения не установлены';
	@override String get login_request => 'Войдите, чтобы просмотреть запрос';
	@override String get empty => 'Пустой';
	@override String get send_prayer => 'Товар не найден \n Отправить новую молитвенную просьбу или свидетельство';
	@override String get podcast => 'Подкаст';
	@override String get new_prayer_req => 'Новая молитвенная просьба или свидетельство';
	@override String get read_more => 'ЧИТАТЬ ДАЛЬШЕ';
	@override String get details => 'Подробности';
	@override String get added_bookmark => 'Добавлено в закладки';
	@override String get removed_bookmark => 'Удалено из закладки';
	@override String get delete_account => 'Удалить аккаунт';
	@override String get appDescriptionSupport => 'Ваше партнерство посредством пожертвований глобальным миссиям Lighthouse позволяет нам добиться большего в исполнении Божьего призыва и нести Его слово, меняющее жизнь, и чудотворную силу Святого Духа по всему миру. И каждая ваша жертва будет щедро вознаграждена и дополнена умножением от Господа, как Он и гарантировал Своим словом (Ссылки на Священные Писания: Марка 10:29-30, Луки 6:38).';
	@override String get giving_via_paypal => 'Отдача через PayPal';
	@override String get click_to_give => 'Нажмите, чтобы дать';
	@override String get additional_giving => 'Дополнительные возможности дарения';
	@override String get email => 'Электронная почта';
	@override String get aboutcontent_para_1 => 'Глобальные миссии Lighthouse исполняют Божий призыв нести Свет Иисуса Христа народам. Ваше молитвенное занятие «Ежедневный свет» — это один из способов, с помощью которого мы выполняем этот призыв донести Евангелие Иисуса Христа и просветляющее слово Божье до людей по всему миру. Этот молитвенный час ежедневно приносит людям слово Божье для победоносной и полноценной жизни во Христе, позволяя им возрастать в познании Бога, ходить в силе Святого Духа, открывать свою жизненную цель и выполнять Божий призыв к своей жизни.';
	@override String get aboutcontent_para_2 => 'Мы рады, что вы присоединились к приложению Your Daily Light, предоставляющему вам бесплатный доступ к ежедневной порции Слова Божьего для вашего питания и духовного развития. Мы также призываем вас поделиться влиянием этого молитвенного письма на вашу жизнь, пригласить других загрузить приложение и внести свой вклад в то, чтобы помочь нам привлечь больше людей во славу Божью. Нажмите кнопку «Поделиться» в приложении и предложите другим загрузить приложение сегодня.';
	@override String get aboutcontent_para_3 => 'В главном разделе приложения вы также найдете сезонные пророческие послания о том, что говорит Бог, будете в курсе событий служения, прочитаете свидетельства из реальной жизни и откроете для себя возможности стать частью того, что делает Бог через глобальные миссии Lighthouse.';
	@override String get aboutcontent_para_4 => 'Вы также можете поделиться своими свидетельствами и подать молитвенные просьбы, используя раздел «Свидетельства и молитвы». Мы будем рады прочитать о влиянии Вашего ежедневного света на вашу жизнь и помолиться вместе с вами в тех областях, где вы нуждаетесь. Во встроенном книжном магазине вы можете напрямую найти и получить соответствующие материалы, которые ускорят ваш рост.';
	@override String get aboutcontent_para_5 => 'Ваше приложение Daily Light стало бесплатным и доступным для глобальной аудитории только благодаря щедрости таких людей, как вы, благодаря финансовому партнерству. У нас также есть много других направлений служения, где каждый дар имеет значение. Вы тоже можете присоединиться к этой миссии, пожертвовав деньги этому служению. И Бог, гарантирующий вознаграждение за каждую жертву ради Своей цели, щедро вознаградит вас умножением вашего дара и разнообразными благословениями. Ваше пожертвование изменит жизнь многих людей. Используйте раздел «Пожертвования и партнерство», чтобы узнать, как сделать пожертвование.';
	@override String get aboutcontent_para_6a => 'Узнайте больше о глобальных миссиях Lighthouse на сайте';
	@override String get aboutcontent_para_6b => 'или';
	@override String get aboutcontent_para_7a => 'Подпишитесь на нашу рассылку по адресу';
	@override String get aboutcontent_para_7b => 'чтобы оставаться в курсе и участвовать в том, что совершает Бог.';
	@override String get aboutcontent_para_8a => 'Вы также можете связаться с пастором Саймоном по адресу:';
	@override String get apptagline => 'Благочестивое приложение для ежедневного просветления и духовного роста';
	@override String get seebankdetails => 'Посмотреть детали банковского перевода';
	@override String get via_bank => 'через банк';
	@override String get bank_details => 'Детали банковского перевода';
	@override String get account_name => 'Имя учетной записи';
	@override String get bank => 'Банк';
	@override String get iban => 'IBAN';
	@override String get myProfile => 'Мой профиль';
}

// Path: <root>
class _StringsZh implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsZh _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Your Daily Light';
	@override String get appname_label => 'Your Daily Light';
	@override String get selectlanguage => '选择语言';
	@override String get chooseapplanguage => '选择应用程序语言';
	@override String get nightmode => '夜间模式';
	@override String get initializingapp => '正在初始化...';
	@override String get home => '首页';
	@override String get branches => '分支机构';
	@override String get inbox => '收件箱';
	@override String get downloads => '下载';
	@override String get settings => '设置';
	@override String get events => '活动';
	@override String get myplaylists => '我的播放列表';
	@override String get website => '网站';
	@override String get hymns => '赞美诗';
	@override String get articles => '文章';
	@override String get notes => '注释';
	@override String get donate => '捐赠';
	@override String get savenotetitle => '注释标题';
	@override String get nonotesfound => '没有找到注释';
	@override String get newnote => '新';
	@override String get deletenote => '删除注释';
	@override String get deletenotehint => '您想删除此注释吗？此操作无法撤消。';
	@override String get bookmarks => '书签';
	@override String get socialplatforms => '社交平台';
	@override List<String> get onboardingpagetitles => [
		'您的日常照明',
		'创建帐户',
		'分享',
		'及时了解最新动态',
	];
	@override List<String> get onboardingpagehints => [
		'通过灵修和播客从上帝的话语中寻找每日的启发',
		'访问鼓舞人心的内容，建立您的个人图书馆，并将上帝的话语带到任何地方',
		'分享或阅读来自世界各地的鼓舞人心的见证。分享祈祷请求并寻求及时的支持',
		'了解上帝对这个季节的看法，及时了解最新事件并寻找加入运动的方法',
	];
	@override String get next => '下一个';
	@override String get done => '开始使用';
	@override String get quitapp => '退出应用程序！';
	@override String get quitappwarning => '您想关闭该应用程序吗？';
	@override String get quitappaudiowarning => '您当前正在播放音频，退出应用程序将停止音频播放。如果您不想停止播放，只需使用中心按钮最小化应用程序或单击“确定”按钮立即退出应用程序。';
	@override String get ok => '好的';
	@override String get retry => '重试';
	@override String get oops => '哎呀！';
	@override String get save => '保存';
	@override String get cancel => '取消';
	@override String get error => '错误';
	@override String get success => '成功';
	@override String get skip => '跳过';
	@override String get skiplogin => '跳过登录';
	@override String get skipregister => '跳过注册';
	@override String get dataloaderror => '目前无法加载请求的数据，请检查您的数据连接并单击重试。';
	@override String get suggestedforyou => '为您推荐';
	@override String get videomessages => '视频留言';
	@override String get audiomessages => '音频消息';
	@override String get devotionals => '灵修';
	@override String get categories => '类别';
	@override String get category => '类别';
	@override String get videos => '视频';
	@override String get audios => '音频';
	@override String get biblebooks => '圣经';
	@override String get audiobible => '音频圣经';
	@override String get livestreams => '直播';
	@override String get radio => '收音机';
	@override String get allitems => '所有项目';
	@override String get emptyplaylist => '没有播放列表';
	@override String get notsupported => '不支持';
	@override String get cleanupresources => '清理资源';
	@override String get grantstoragepermission => '请授予访问存储权限才能继续';
	@override String get sharefiletitle => '观看或收听';
	@override String get sharefilebody => '通过您的 Daily Light 应用程序，立即下载：';
	@override String get sharetext => '享受无限的音频和视频流';
	@override String get sharetexthint => '加入视频和音频流平台，让您观看和收听来自世界各地的数百万个文件。立即下载';
	@override String get download => '下载';
	@override String get addplaylist => '添加到播放列表';
	@override String get bookmark => '书签';
	@override String get unbookmark => '取消书签';
	@override String get share => '分享';
	@override String get deletemedia => '删除文件';
	@override String get deletemediahint => '您想删除这个下载的文件吗？此操作无法撤消。';
	@override String get searchhint => '搜索音频和视频消息';
	@override String get performingsearch => '搜索音频和视频';
	@override String get nosearchresult => '没有找到结果';
	@override String get nosearchresulthint => '尝试输入更通用的关键字';
	@override String get addtoplaylist => '添加到播放列表';
	@override String get newplaylist => '新播放列表';
	@override String get playlistitm => '播放列表';
	@override String get mediaaddedtoplaylist => '媒体已添加到播放列表。';
	@override String get mediaremovedfromplaylist => '媒体已从播放列表中删除';
	@override String get clearplaylistmedias => '清除所有媒体';
	@override String get deletePlayList => '删除播放列表';
	@override String get clearplaylistmediashint => '继续从该播放列表中删除所有媒体吗？';
	@override String get deletePlayListhint => '继续删除此播放列表并清除所有媒体吗？';
	@override String get comments => '评论';
	@override String get replies => '回复';
	@override String get reply => '回复';
	@override String get logintoaddcomment => '登录以添加评论';
	@override String get logintoreply => '登录后回复';
	@override String get writeamessage => '写留言...';
	@override String get nocomments => '未找到评论 \n 点击重试';
	@override String get errormakingcomments => '目前无法处理评论..';
	@override String get errordeletingcomments => '暂时无法删除此评论..';
	@override String get erroreditingcomments => '目前无法编辑此评论..';
	@override String get errorloadingmorecomments => '目前无法加载更多评论..';
	@override String get deletingcomment => '删除评论';
	@override String get editingcomment => '编辑评论';
	@override String get deletecommentalert => '删除评论';
	@override String get editcommentalert => '编辑评论';
	@override String get deletecommentalerttext => '您想删除这条评论吗？此操作无法撤消';
	@override String get loadmore => '加载更多';
	@override String get messages => '留言';
	@override String get guestuser => '访客用户';
	@override String get fullname => '全名';
	@override String get emailaddress => '电子邮件地址';
	@override String get password => '密码';
	@override String get repeatpassword => '重复密码';
	@override String get register => '注册';
	@override String get login => '登录';
	@override String get logout => '退出';
	@override String get logoutfromapp => '从应用程序注销？';
	@override String get logoutfromapphint => '如果您未登录，您将无法对文章和视频进行点赞或评论。';
	@override String get gotologin => '前往登录';
	@override String get resetpassword => '重置密码';
	@override String get logintoaccount => '已经有帐户？登录';
	@override String get emptyfielderrorhint => '您需要填写所有字段';
	@override String get invalidemailerrorhint => '您需要输入有效的电子邮件地址';
	@override String get passwordsdontmatch => '密码不匹配';
	@override String get processingpleasewait => '处理中，请稍候...';
	@override String get createaccount => '创建帐户';
	@override String get forgotpassword => '忘记密码？';
	@override String get orloginwith => '或登录';
	@override String get facebook => '脸书';
	@override String get google => '谷歌';
	@override String get moreoptions => '更多选择';
	@override String get about => '关于我们';
	@override String get privacy => '隐私政策';
	@override String get terms => '应用条款';
	@override String get rate => '评价应用程序';
	@override String get version => '版本';
	@override String get pulluploadmore => '拉起负载';
	@override String get loadfailedretry => '加载失败！点击重试！';
	@override String get releaseloadmore => '释放以加载更多';
	@override String get nomoredata => '没有更多数据';
	@override String get errorReportingComment => '错误报告评论';
	@override String get reportingComment => '举报评论';
	@override String get reportcomment => '报告选项';
	@override List<String> get reportCommentsList => [
		'不需要的商业内容或垃圾邮件',
		'色情或露骨的性内容',
		'仇恨言论或暴力画面',
		'骚扰或欺凌',
	];
	@override String get bookmarksMedia => '我的书签';
	@override String get noitemstodisplay => '没有可显示的项目';
	@override String get loginrequired => '需要登录';
	@override String get loginrequiredhint => '要在此平台上订阅，您需要登录。立即创建免费帐户或登录您现有的帐户。';
	@override String get subscriptions => '应用程序订阅';
	@override String get subscribe => '订阅';
	@override String get subscribehint => '需要订阅';
	@override String get playsubscriptionrequiredhint => '您需要先订阅才能收听或观看此媒体。';
	@override String get previewsubscriptionrequiredhint => '您已达到该媒体允许的预览持续时间。您需要订阅才能继续收听或观看此媒体。';
	@override String get copiedtoclipboard => '已复制到剪贴板';
	@override String get downloadbible => '下载圣经';
	@override String get downloadversion => '下载';
	@override String get downloading => '正在下载';
	@override String get failedtodownload => '下载失败';
	@override String get pleaseclicktoretry => '请点击重试。';
	@override String get of => '的';
	@override String get nobibleversionshint => '没有可显示的圣经数据，请点击下面的按钮下载至少一个圣经版本。';
	@override String get downloaded => '已下载';
	@override String get enteremailaddresstoresetpassword => '输入您的电子邮件以重置密码';
	@override String get backtologin => '返回登录';
	@override String get signintocontinue => '登录以继续';
	@override String get signin => '登录';
	@override String get signinforanaccount => '注册帐户？';
	@override String get alreadyhaveanaccount => '已经有帐户？';
	@override String get updateprofile => '更新个人资料';
	@override String get updateprofilehint => '首先，请更新您的个人资料页面，这将帮助我们将您与其他人联系起来';
	@override String get autoplayvideos => '自动播放视频';
	@override String get gosocial => '走向社交';
	@override String get searchbible => '搜索圣经';
	@override String get filtersearchoptions => '过滤搜索选项';
	@override String get narrowdownsearch => '使用下面的过滤按钮缩小搜索范围以获得更精确的结果。';
	@override String get searchbibleversion => '搜寻圣经版本';
	@override String get searchbiblebook => '搜索圣经书';
	@override String get search => '搜索';
	@override String get setBibleBook => '圣经书集';
	@override String get oldtestament => '旧约';
	@override String get newtestament => '新约';
	@override String get limitresults => '限制结果';
	@override String get setfilters => '设置过滤器';
	@override String get bibletranslator => '圣经翻译';
	@override String get chapter => '章';
	@override String get verse => '诗歌';
	@override String get translate => '翻译';
	@override String get bibledownloadinfo => '圣经下载已开始，下载完成之前请不要关闭此页面。';
	@override String get received => '收到';
	@override String get outoftotal => '总计中';
	@override String get set => '设定';
	@override String get selectColor => '选择颜色';
	@override String get switchbibleversion => '切换圣经版本';
	@override String get switchbiblebook => '切换圣经书';
	@override String get gotosearch => '前往章节';
	@override String get changefontsize => '更改字体大小';
	@override String get font => '字体';
	@override String get readchapter => '阅读章节';
	@override String get showhighlightedverse => '显示突出显示的经文';
	@override String get downloadmoreversions => '下载更多版本';
	@override String get suggestedusers => '建议用户关注';
	@override String get unfollow => '取消关注';
	@override String get follow => '关注';
	@override String get searchforpeople => '寻找人';
	@override String get viewpost => '查看帖子';
	@override String get viewprofile => '查看资料';
	@override String get mypins => '我的图钉';
	@override String get viewpinnedposts => '查看固定帖子';
	@override String get personal => '个人';
	@override String get update => '更新';
	@override String get phonenumber => '电话号码';
	@override String get showmyphonenumber => '向用户显示我的电话号码';
	@override String get dateofbirth => '出生日期';
	@override String get showmyfulldateofbirth => '向查看我状态的人显示我的完整出生日期';
	@override String get notifications => '通知';
	@override String get notifywhenuserfollowsme => '当用户关注我时通知我';
	@override String get notifymewhenusercommentsonmypost => '当用户评论我的帖子时通知我';
	@override String get notifymewhenuserlikesmypost => '当用户喜欢我的帖子时通知我';
	@override String get churchsocial => '教会社交';
	@override String get shareyourthoughts => '分享您的想法';
	@override String get readmore => '...阅读更多';
	@override String get less => '少';
	@override String get couldnotprocess => '无法处理请求的操作。';
	@override String get pleaseselectprofilephoto => '请选择要上传的个人资料照片';
	@override String get pleaseselectprofilecover => '请选择要上传的封面照片';
	@override String get updateprofileerrorhint => '您需要填写您的姓名、出生日期、性别、电话和位置，然后才能继续。';
	@override String get gender => '性别';
	@override String get male => '男';
	@override String get female => '女';
	@override String get dob => '出生日期';
	@override String get location => '当前位置';
	@override String get qualification => '资质';
	@override String get aboutme => '关于我';
	@override String get facebookprofilelink => 'Facebook 个人资料链接';
	@override String get twitterprofilelink => '推特个人资料链接';
	@override String get linkdln => 'LinkedIn 个人资料链接';
	@override String get likes => '喜欢';
	@override String get likess => '喜欢';
	@override String get pinnedposts => '我的固定帖子';
	@override String get unpinpost => '取消固定帖子';
	@override String get unpinposthint => '您想从您的固定帖子中删除此帖子吗？';
	@override String get postdetails => '帖子详情';
	@override String get posts => '帖子';
	@override String get followers => '追随者';
	@override String get followings => '关注者';
	@override String get my => '我的';
	@override String get edit => '编辑';
	@override String get delete => '删除';
	@override String get deletepost => '删除帖子';
	@override String get deleteposthint => '您想删除此帖子吗？帖子仍然可以出现在某些用户的源上。';
	@override String get maximumallowedsizehint => '已达到允许的最大文件上传数';
	@override String get maximumuploadsizehint => '所选文件超出了允许的上传文件大小限制。';
	@override String get makeposterror => '暂时无法发帖，请点击重试。';
	@override String get makepost => '发帖';
	@override String get selectfile => '选择文件';
	@override String get images => '图片';
	@override String get shareYourThoughtsNow => '分享您的想法...';
	@override String get photoviewer => '照片浏览器';
	@override String get nochatsavailable => '没有可用的对话 \n 单击 \n 下面的添加图标以选择与之聊天的用户';
	@override String get typing => '正在打字...';
	@override String get photo => '照片';
	@override String get online => '在线';
	@override String get offline => '离线';
	@override String get lastseen => '最后出现';
	@override String get deleteselectedhint => '此操作将删除选定的消息。  请注意，这只会删除您这边的对话，\n 消息仍会显示在您合作伙伴的设备上。';
	@override String get deleteselected => '删除所选内容';
	@override String get unabletofetchconversation => '无法获取 \n 您与 \n 的对话';
	@override String get loadmoreconversation => '加载更多对话';
	@override String get sendyourfirstmessage => '将您的第一条消息发送至 \n';
	@override String get unblock => '解锁';
	@override String get block => '块';
	@override String get writeyourmessage => '写下您的留言...';
	@override String get clearconversation => '清晰的对话';
	@override String get clearconversationhintone => '此操作将清除您与';
	@override String get clearconversationhinttwo => '。 \n 请注意，这只会删除您这边的对话，消息仍会显示在您的合作伙伴聊天中。';
	@override String get facebookloginerror => '登录过程出现问题。 \n ，这是 Facebook 给我们的错误';
	@override String get mylibrary => '我的图书馆';
	@override String get prayer_request => '祷告请求或见证';
	@override String get mySubscription => '我的订阅';
	@override String get giveandpart => '捐赠与伙伴关系';
	@override String get follow_us => '关注我们';
	@override String get profile => '公司简介';
	@override String get no_phone => '没有电话';
	@override String get no_address => '无地址';
	@override String get changepwd => '更改密码';
	@override String get help_support => '帮助与支持';
	@override String get quest_logout => '您想从应用程序中退出吗？';
	@override String get no => '否';
	@override String get yes => '是的';
	@override String get enjoy_using => '享受使用';
	@override String get tap_rate => '在 App Store 上点击星级';
	@override String get please_rate => '请输入您的评分';
	@override String get submit => '提交';
	@override String get select_email => '选择要撰写的电子邮件应用程序';
	@override String get open_mail => '打开邮件应用程序';
	@override String get no_mailer => '未安装邮件应用程序';
	@override String get login_request => '登录查看请求';
	@override String get empty => '空';
	@override String get send_prayer => '未找到任何物品 \n 发送新的祷告请求或见证';
	@override String get podcast => '播客';
	@override String get new_prayer_req => '新的祷告请求或见证';
	@override String get read_more => '了解更多';
	@override String get details => '详情';
	@override String get added_bookmark => '已添加至书签';
	@override String get removed_bookmark => '已从书签中删除';
	@override String get delete_account => '删除帐户';
	@override String get appDescriptionSupport => '您通过对灯塔全球宣教的捐助而建立的伙伴关系，使我们能够在履行上帝的召唤方面取得更多成就，将他改变生命的话语和圣灵的奇迹工作力量带到世界各地。你的每一次牺牲都会得到主的丰盛回报和倍增，正如他所保证的那样（经文参考：马可福音10：29-30，路加福音6：38）。';
	@override String get giving_via_paypal => '通过 PayPal 捐赠';
	@override String get click_to_give => '点击给予';
	@override String get additional_giving => '额外的捐赠选项';
	@override String get email => '电子邮件';
	@override String get aboutcontent_para_1 => '灯塔全球宣教正在履行上帝的召唤，将耶稣基督的光带给各国。您的每日光明灵修是我们履行这一号召的方式之一，将耶稣基督的福音和上帝的启发性话语带给全球各地的人们。这种灵修每天将神的话语带给个人，让他们在基督里过得胜和充实的生活，使他们能够在神的知识上成长，行在圣灵的能力中，发现他们的人生目的，并实现神对他们生命的呼召。';
	@override String get aboutcontent_para_2 => '我们很高兴您使用“每日之光”应用程序，让您免费获得每日神的话语，以获取滋养和灵性发展。我们还鼓励您分享这种灵修对您生活的影响，邀请其他人下载该应用程序，并为帮助我们接触更多人以荣耀上帝而做出贡献。立即点击应用程序中的共享按钮并邀请其他人下载该应用程序。';
	@override String get aboutcontent_para_3 => '在应用程序主页部分，您还可以找到上帝所说的季节性预言信息，随时了解事工活动的最新动态，阅读现实生活中的见证，并发现机会参与上帝通过灯塔全球宣教所做的事情。';
	@override String get aboutcontent_para_4 => '您还可以使用见证和祈祷部分分享您的见证并提交祈祷请求。我们将很高兴了解您每日之光对您生活的影响，并在您需要的领域与您一起祈祷。从内置的书店，你可以直接找到并获取相关材料，加速你的成长。';
	@override String get aboutcontent_para_5 => '只有像您这样的个人通过财务合作伙伴慷慨解囊，您的 Daily Light 应用程序才能免费向全球受众开放。我们还有许多其他的事工途径，每项恩赐都会发挥作用。你也可以通过向这个事工捐款来加入这个使命。上帝保证会奖赏为他的目的所做的每一次牺牲，他会丰富地奖赏你，使你的恩赐成倍增加，并获得不同的祝福。您的奉献将会改变许多人的生活。使用“捐赠和合作伙伴关系”部分查看捐赠方式。';
	@override String get aboutcontent_para_6a => '了解有关灯塔全球使命的更多信息：';
	@override String get aboutcontent_para_6b => '或者';
	@override String get aboutcontent_para_7a => '订阅我们的时事通讯：';
	@override String get aboutcontent_para_7b => '保持更新并参与上帝正在成就的事情。';
	@override String get aboutcontent_para_8a => '您也可以通过以下方式与西蒙牧师联系：';
	@override String get apptagline => '用于日常照明和精神成长的虔诚应用程序';
	@override String get seebankdetails => '查看银行转账详情';
	@override String get via_bank => '通过银行';
	@override String get bank_details => '银行转账详情';
	@override String get account_name => '帐户名称';
	@override String get bank => '银行';
	@override String get iban => '国际银行账号';
	@override String get myProfile => '我的个人资料';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
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
			'onboardingpagetitles.0': 'YOUR DAILY LIGHT ',
			'onboardingpagetitles.1': 'CREATE AN ACCOUNT',
			'onboardingpagetitles.2': 'SHARE ',
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
			'sharefilebody': 'Via Your Daily Light App, Download now at ',
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
			'mylibrary': 'My Library',
			'prayer_request': 'Prayer Request or Testimony',
			'mySubscription': 'My Subscription',
			'giveandpart': 'Giving and Partnership',
			'follow_us': 'Follow us on',
			'profile': 'Profile',
			'no_phone': 'No Phone',
			'no_address': 'No address',
			'changepwd': 'Change Password',
			'help_support': 'Help and Support',
			'quest_logout': 'Do you want to logout from the app?',
			'no': 'No',
			'yes': 'YES',
			'enjoy_using': 'Enjoy Using ',
			'tap_rate': 'Tap a star rate it on the App Store ',
			'please_rate': 'Please Enter Your Rating ',
			'submit': 'submit',
			'select_email': 'Select email app to compose',
			'open_mail': 'Open Mail Appe',
			'no_mailer': 'No mail apps installed',
			'login_request': 'Login to View Request',
			'empty': 'Empty',
			'send_prayer': 'No Item Found \n Send a New Prayer Request or Testimony',
			'podcast': 'PodCast',
			'new_prayer_req': 'New Prayer Request or Testimony',
			'read_more': 'READ MORE',
			'details': 'Details',
			'added_bookmark': 'Added to Bookmark',
			'removed_bookmark': 'Removed from Bookmark',
			'delete_account': 'Delete Account',
			'appDescriptionSupport': 'Your partnership through giving to Lighthouse Global Missions enables us to accomplish more in fulfilling God’s call in bringing His life changing word and the miracle working power of the Holy Spirit around the world. And your every sacrifice will be richly rewarded and replenished with multiplication by the Lord, even as He guaranteed by His word (Scripture References: Mark 10:29-30, Luke 6:38).',
			'giving_via_paypal': 'Giving via PayPal',
			'click_to_give': 'Click to Give',
			'additional_giving': 'Additional giving options',
			'email': 'Email',
			'aboutcontent_para_1': 'Lighthouse Global Missions is fulfilling God’s call to bring the Light of Jesus Christ to the nations. Your Daily Light devotional is one of the ways by which we are fulfilling this call to bring the Gospel of Jesus Christ and the illuminating word of God to individuals across the globe. This devotional brings God’s word daily, to individuals for a victorious and a fulfilling life in Christ, enabling them to grow in the knowledge of God, walk in the power of the Holy Spirit, discover their life purpose and fulfill God’s call for their lives.',
			'aboutcontent_para_2': 'We are glad to have you get on board with Your Daily Light app, granting you free access to a daily dose of God’s word for your nourishment and spiritual development. We also encourage you to share the impact of this devotional in your life, invite others to download the app, and contribute to helping us reach more people for the glory of God. Directly hit the share button in the application and invite others to download the app today.',
			'aboutcontent_para_3': 'On the application home section, you will also find seasonal prophetic messages of what God is saying, stay updated with ministry events, read real life testimonies and discover opportunities to be part of what God is doing through Lighthouse Global Missions.',
			'aboutcontent_para_4': 'You can also share your testimonies and submit prayer requests using the testimony and prayers section. We will be glad to read about the impact of Your Daily Light in your life, and to pray with you in your areas of need. From the built in book store, you can directly find and get relevant materials to accelerate your growth.',
			'aboutcontent_para_5': 'Your Daily Light app is only made free and accessible to a global audience by the generosity of individuals like you through financial partnership. We also have many other avenues of ministry where every gift makes a difference. You too can join this mission by giving to this ministry. And God who guarantees to reward every sacrifice for His purpose will richly reward you with a multiplication of your gift and with diverse blessings. Your giving will make a difference in many lives. Use the Giving and Partnership section to see ways to donate.',
			'aboutcontent_para_6a': 'Learn more about Lighthouse Global Missions at ',
			'aboutcontent_para_6b': 'or',
			'aboutcontent_para_7a': 'Subscribe to our Newsletter at ',
			'aboutcontent_para_7b': 'to stay updated and get involved with what God is accomplishing.',
			'aboutcontent_para_8a': 'You can also get in touch with Pastor Simon at:',
			'apptagline': 'Devotional App for Daily Illumination and Spiritual Growth',
			'seebankdetails': 'See bank transfer details',
			'via_bank': 'via Bank',
			'bank_details': 'Bank Transfer Details',
			'account_name': 'Account Name',
			'bank': 'Bank',
			'iban': 'IBAN',
			'myProfile': 'My Profile',
		};
	}
}

extension on _StringsDe {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Sprache auswählen',
			'chooseapplanguage': 'Wählen Sie App-Sprache',
			'nightmode': 'Nacht-Modus',
			'initializingapp': 'Initialisierung...',
			'home': 'Heim',
			'branches': 'Geäst',
			'inbox': 'Posteingang',
			'downloads': 'Downloads',
			'settings': 'Einstellungen',
			'events': 'Veranstaltungen',
			'myplaylists': 'Meine Playlists',
			'website': 'Webseite',
			'hymns': 'Hymnen',
			'articles': 'Artikel',
			'notes': 'Anmerkungen',
			'donate': 'Spenden',
			'savenotetitle': 'Notiztitel',
			'nonotesfound': 'Keine Notizen gefunden',
			'newnote': 'Neu',
			'deletenote': 'Notiz löschen',
			'deletenotehint': 'Möchten Sie diese Notiz löschen? ',
			'bookmarks': 'Lesezeichen',
			'socialplatforms': 'Soziale Plattformen',
			'onboardingpagetitles.0': 'DEIN TÄGLICHES LICHT ',
			'onboardingpagetitles.1': 'EIN KONTO ERSTELLEN',
			'onboardingpagetitles.2': 'Teilen ',
			'onboardingpagetitles.3': ' AUF DEM LAUFENDEN BLEIBEN ',
			'onboardingpagehints.0': 'Finden Sie tägliche Erleuchtung durch Gottes Wort durch Andachten und Podcasts',
			'onboardingpagehints.1': 'Greifen Sie auf inspirierende Inhalte zu, bauen Sie Ihre persönliche Bibliothek auf und nehmen Sie Gottes Wort überallhin mit',
			'onboardingpagehints.2': 'Teilen oder lesen Sie inspirierende Zeugnisse aus der ganzen Welt. ',
			'onboardingpagehints.3': 'Erfahren Sie, was Gott für diese Saison sagt, bleiben Sie über Ereignisse auf dem Laufenden und entdecken Sie Möglichkeiten, sich der Bewegung anzuschließen',
			'next': 'NÄCHSTE',
			'done': 'Loslegen',
			'quitapp': 'Beenden Sie die App!',
			'quitappwarning': 'Möchten Sie die App schließen?',
			'quitappaudiowarning': 'Sie spielen gerade eine Audiodatei ab. Wenn Sie die App beenden, wird die Audiowiedergabe gestoppt. ',
			'ok': 'Ja',
			'retry': 'WIEDERHOLEN',
			'oops': 'Ups!',
			'save': 'Speichern',
			'cancel': 'Nein',
			'error': 'Fehler',
			'success': 'Erfolg',
			'skip': 'Überspringen',
			'skiplogin': 'Login überspringen',
			'skipregister': 'Registrierung überspringen',
			'dataloaderror': 'Die angeforderten Daten konnten derzeit nicht geladen werden. Überprüfen Sie Ihre Datenverbindung und klicken Sie, um es erneut zu versuchen.',
			'suggestedforyou': 'Für Sie empfohlen',
			'videomessages': 'Videobotschaften',
			'audiomessages': 'Audio-Nachrichten',
			'devotionals': 'Andachten',
			'categories': 'Kategorien',
			'category': 'Kategorie',
			'videos': 'Videos',
			'audios': 'Audios',
			'biblebooks': 'Bibel',
			'audiobible': 'Audio-Bibel',
			'livestreams': 'Live-Streams',
			'radio': 'Radio',
			'allitems': 'Alle Elemente',
			'emptyplaylist': 'Keine Playlists',
			'notsupported': 'Nicht unterstützt',
			'cleanupresources': 'Ressourcen bereinigen',
			'grantstoragepermission': 'Bitte erteilen Sie die Erlaubnis zum Zugriff auf den Speicher, um fortzufahren',
			'sharefiletitle': 'Anschauen oder anhören ',
			'sharefilebody': 'Laden Sie es jetzt über Ihre Daily Light-App herunter unter ',
			'sharetext': 'Genießen Sie unbegrenztes Audio- und Video-Streaming',
			'sharetexthint': 'Treten Sie der Video- und Audio-Streaming-Plattform bei, mit der Sie Millionen von Dateien aus der ganzen Welt ansehen und anhören können. ',
			'download': 'Herunterladen',
			'addplaylist': 'Zur Wiedergabeliste hinzufügen',
			'bookmark': 'Lesezeichen',
			'unbookmark': 'Lesezeichen aufheben',
			'share': 'Teilen',
			'deletemedia': 'Datei löschen',
			'deletemediahint': 'Möchten Sie diese heruntergeladene Datei löschen? ',
			'searchhint': 'Suchen Sie nach Audio- und Videonachrichten',
			'performingsearch': 'Suche nach Audios und Videos',
			'nosearchresult': 'Keine Ergebnisse gefunden',
			'nosearchresulthint': 'Versuchen Sie, ein allgemeineres Schlüsselwort einzugeben',
			'addtoplaylist': 'Zur Wiedergabeliste hinzufügen',
			'newplaylist': 'Neue Playlist',
			'playlistitm': 'Wiedergabeliste',
			'mediaaddedtoplaylist': 'Medien zur Playlist hinzugefügt.',
			'mediaremovedfromplaylist': 'Medien aus der Playlist entfernt',
			'clearplaylistmedias': 'Alle Medien löschen',
			'deletePlayList': 'Playlist löschen',
			'clearplaylistmediashint': 'Alle Medien aus dieser Playlist entfernen?',
			'deletePlayListhint': 'Möchten Sie diese Wiedergabeliste und alle Medien löschen?',
			'comments': 'Kommentare',
			'replies': 'Antworten',
			'reply': 'Antwort',
			'logintoaddcomment': 'Melden Sie sich an, um einen Kommentar hinzuzufügen',
			'logintoreply': 'Anmelden um zu Antworten',
			'writeamessage': 'Nachricht schreiben...',
			'nocomments': 'Keine Kommentare gefunden \n',
			'errormakingcomments': 'Kommentare können im Moment nicht verarbeitet werden.',
			'errordeletingcomments': 'Dieser Kommentar kann im Moment nicht gelöscht werden.',
			'erroreditingcomments': 'Dieser Kommentar kann im Moment nicht bearbeitet werden.',
			'errorloadingmorecomments': 'Im Moment können keine weiteren Kommentare geladen werden.',
			'deletingcomment': 'Kommentar wird gelöscht',
			'editingcomment': 'Kommentar bearbeiten',
			'deletecommentalert': 'Kommentar löschen',
			'editcommentalert': 'Kommentar bearbeiten',
			'deletecommentalerttext': 'Möchten Sie diesen Kommentar löschen? ',
			'loadmore': 'Mehr laden',
			'messages': 'Mitteilungen',
			'guestuser': 'Gastnutzer',
			'fullname': 'Vollständiger Name',
			'emailaddress': 'E-Mail-Adresse',
			'password': 'Passwort',
			'repeatpassword': 'Passwort wiederholen',
			'register': 'Registrieren',
			'login': 'Anmeldung',
			'logout': 'Ausloggen',
			'logoutfromapp': 'Von der App abmelden?',
			'logoutfromapphint': 'Wenn Sie nicht angemeldet sind, können Sie Artikel und Videos nicht liken oder kommentieren.',
			'gotologin': 'Gehen Sie zu Anmelden',
			'resetpassword': 'Passwort zurücksetzen',
			'logintoaccount': 'Sie haben bereits ein Konto? ',
			'emptyfielderrorhint': 'Sie müssen alle Felder ausfüllen',
			'invalidemailerrorhint': 'Sie müssen eine gültige E-Mail-Adresse eingeben',
			'passwordsdontmatch': 'Passwörter stimmen nicht überein',
			'processingpleasewait': 'Verarbeite .. Bitte warten...',
			'createaccount': 'Ein Konto erstellen',
			'forgotpassword': 'Passwort vergessen?',
			'orloginwith': 'Oder melden Sie sich an mit',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Mehr Optionen',
			'about': 'Über uns',
			'privacy': 'Datenschutzrichtlinie',
			'terms': 'App-Bedingungen',
			'rate': 'Bewertung App',
			'version': 'Ausführung',
			'pulluploadmore': 'Last hochziehen',
			'loadfailedretry': 'Laden fehlgeschlagen! Klicken Sie auf „Wiederholen“!',
			'releaseloadmore': 'loslassen, um mehr zu laden',
			'nomoredata': 'Keine Daten mehr',
			'errorReportingComment': 'Kommentar zur Fehlerberichterstattung',
			'reportingComment': 'Meldekommentar',
			'reportcomment': 'Berichtsoptionen',
			'reportCommentsList.0': 'Unerwünschter kommerzieller Inhalt oder Spam',
			'reportCommentsList.1': 'Pornografie oder sexuell explizites Material',
			'reportCommentsList.2': 'Hassrede oder drastische Gewalt',
			'reportCommentsList.3': 'Belästigung oder Mobbing',
			'bookmarksMedia': 'Meine Lesezeichen',
			'noitemstodisplay': 'Keine anzuzeigenden Elemente vorhanden',
			'loginrequired': 'Anmeldung erforderlich',
			'loginrequiredhint': 'Um sich auf dieser Plattform anzumelden, müssen Sie angemeldet sein. Erstellen Sie jetzt ein kostenloses Konto oder melden Sie sich bei Ihrem bestehenden Konto an.',
			'subscriptions': 'App-Abonnements',
			'subscribe': 'ABONNIEREN',
			'subscribehint': 'Abonnement erforderlich',
			'playsubscriptionrequiredhint': 'Sie müssen sich anmelden, bevor Sie diese Medien anhören oder ansehen können.',
			'previewsubscriptionrequiredhint': 'Sie haben die zulässige Vorschaudauer für dieses Medium erreicht. ',
			'copiedtoclipboard': 'In die Zwischenablage kopiert',
			'downloadbible': 'Bibel herunterladen',
			'downloadversion': 'Herunterladen',
			'downloading': 'wird heruntergeladen',
			'failedtodownload': 'Download fehlgeschlagen',
			'pleaseclicktoretry': 'Bitte klicken Sie, um es erneut zu versuchen.',
			'of': 'Von',
			'nobibleversionshint': 'Es sind keine Bibeldaten vorhanden. Klicken Sie auf die Schaltfläche unten, um mindestens eine Bibelversion herunterzuladen.',
			'downloaded': 'Heruntergeladen',
			'enteremailaddresstoresetpassword': 'Geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen',
			'backtologin': 'ZURÜCK ZUR ANMELDUNG',
			'signintocontinue': 'Melden Sie sich an, um fortzufahren',
			'signin': 'ANMELDEN',
			'signinforanaccount': 'FÜR EINEN ACCOUNT ANMELDEN?',
			'alreadyhaveanaccount': 'Sie haben bereits ein Konto?',
			'updateprofile': 'Profil aktualisieren',
			'updateprofilehint': 'Bitte aktualisieren Sie zunächst Ihre Profilseite. Dies wird uns dabei helfen, Sie mit anderen Menschen in Kontakt zu bringen',
			'autoplayvideos': 'AutoPlay-Videos',
			'gosocial': 'Gehen Sie sozial',
			'searchbible': 'Bibel durchsuchen',
			'filtersearchoptions': 'Suchoptionen filtern',
			'narrowdownsearch': 'Verwenden Sie die Filterschaltfläche unten, um die Suche einzugrenzen und ein genaueres Ergebnis zu erhalten.',
			'searchbibleversion': 'Bibelversion suchen',
			'searchbiblebook': 'Bibelbuch durchsuchen',
			'search': 'Suchen',
			'setBibleBook': 'Bibelbuch einstellen',
			'oldtestament': 'Altes Testament',
			'newtestament': 'Neues Testament',
			'limitresults': 'Ergebnisse begrenzen',
			'setfilters': 'Filter festlegen',
			'bibletranslator': 'Bibelübersetzer',
			'chapter': ' Kapitel ',
			'verse': ' Vers ',
			'translate': 'übersetzen',
			'bibledownloadinfo': 'Bibel-Download gestartet. Bitte schließen Sie diese Seite nicht, bis der Download abgeschlossen ist.',
			'received': 'erhalten',
			'outoftotal': 'insgesamt',
			'set': 'SATZ',
			'selectColor': 'Wähle Farbe',
			'switchbibleversion': 'Wechseln Sie die Bibelversion',
			'switchbiblebook': 'Bibelbuch wechseln',
			'gotosearch': 'Gehe zum Kapitel',
			'changefontsize': 'Schriftgröße ändern',
			'font': 'Schriftart',
			'readchapter': 'Kapitel lesen',
			'showhighlightedverse': 'Hervorgehobene Verse anzeigen',
			'downloadmoreversions': 'Laden Sie weitere Versionen herunter',
			'suggestedusers': 'Empfohlene Benutzer zum Folgen',
			'unfollow': 'Nicht mehr folgen',
			'follow': 'Folgen',
			'searchforpeople': 'Suche nach Personen',
			'viewpost': 'Beitrag anzeigen',
			'viewprofile': 'Profil anzeigen',
			'mypins': 'Meine Pins',
			'viewpinnedposts': 'Angepinnte Beiträge anzeigen',
			'personal': 'persönlich',
			'update': 'Aktualisieren',
			'phonenumber': 'Telefonnummer',
			'showmyphonenumber': 'Benutzern meine Telefonnummer anzeigen',
			'dateofbirth': 'Geburtsdatum',
			'showmyfulldateofbirth': 'Den Leuten, die meinen Status ansehen, mein vollständiges Geburtsdatum anzeigen',
			'notifications': 'Benachrichtigungen',
			'notifywhenuserfollowsme': 'Benachrichtigen Sie mich, wenn mir ein Benutzer folgt',
			'notifymewhenusercommentsonmypost': 'Benachrichtigen Sie mich, wenn Benutzer meinen Beitrag kommentieren',
			'notifymewhenuserlikesmypost': 'Benachrichtigen Sie mich, wenn Benutzern mein Beitrag gefällt',
			'churchsocial': 'Kirchensozial',
			'shareyourthoughts': 'Teile deine Gedanken',
			'readmore': '...Mehr lesen',
			'less': ' Weniger',
			'couldnotprocess': 'Die angeforderte Aktion konnte nicht verarbeitet werden.',
			'pleaseselectprofilephoto': 'Bitte wählen Sie ein Profilfoto zum Hochladen aus',
			'pleaseselectprofilecover': 'Bitte wählen Sie ein Titelbild zum Hochladen aus',
			'updateprofileerrorhint': 'Sie müssen Ihren Namen, Ihr Geburtsdatum, Ihr Geschlecht, Ihre Telefonnummer und Ihren Standort eingeben, bevor Sie fortfahren können.',
			'gender': 'Geschlecht',
			'male': 'Männlich',
			'female': 'Weiblich',
			'dob': 'Geburtsdatum',
			'location': 'Aktueller Standort',
			'qualification': 'Qualifikation',
			'aboutme': 'Über mich',
			'facebookprofilelink': 'Facebook-Profillink',
			'twitterprofilelink': 'Twitter-Profillink',
			'linkdln': 'Linkedln-Profillink',
			'likes': 'Likes',
			'likess': 'Likes)',
			'pinnedposts': 'Meine angepinnten Beiträge',
			'unpinpost': 'Beitrag entfernen',
			'unpinposthint': 'Möchten Sie diesen Beitrag aus Ihren angepinnten Beiträgen entfernen?',
			'postdetails': 'Beitragsdetails',
			'posts': 'Beiträge',
			'followers': 'Anhänger',
			'followings': 'Folgendes',
			'my': 'Mein',
			'edit': 'Bearbeiten',
			'delete': 'Löschen',
			'deletepost': 'Beitrag entfernen',
			'deleteposthint': 'Möchten Sie diesen Beitrag löschen? ',
			'maximumallowedsizehint': 'Maximal zulässiger Datei-Upload erreicht',
			'maximumuploadsizehint': 'Die ausgewählte Datei überschreitet die zulässige Dateigrößenbeschränkung für den Upload.',
			'makeposterror': 'Das Verfassen des Beitrags ist im Moment nicht möglich. Bitte klicken Sie, um es erneut zu versuchen.',
			'makepost': 'Beitrag erstellen',
			'selectfile': 'Datei aussuchen',
			'images': 'Bilder',
			'shareYourThoughtsNow': 'Teile deine Gedanken ...',
			'photoviewer': 'Fotobetrachter',
			'nochatsavailable': 'Keine Gespräche verfügbar \n ',
			'typing': 'Tippen...',
			'photo': 'Foto',
			'online': 'Online',
			'offline': 'Offline',
			'lastseen': 'Zuletzt gesehen',
			'deleteselectedhint': 'Durch diese Aktion werden die ausgewählten Nachrichten gelöscht.  ',
			'deleteselected': 'Ausgewählte löschen',
			'unabletofetchconversation': 'Abruf nicht möglich \n \n',
			'loadmoreconversation': 'Laden Sie weitere Konversationen',
			'sendyourfirstmessage': 'Senden Sie Ihre erste Nachricht an \n',
			'unblock': 'Entsperren ',
			'block': 'Block',
			'writeyourmessage': 'Schreibe deine Nachricht...',
			'clearconversation': 'Klare Unterhaltung',
			'clearconversationhintone': 'Durch diese Aktion werden alle Ihre Gespräche gelöscht ',
			'clearconversationhinttwo': '.\n  ',
			'facebookloginerror': 'Beim Anmeldevorgang ist ein Fehler aufgetreten.\n',
			'mylibrary': 'Meine Bibliothek',
			'prayer_request': 'Gebetsanliegen oder Zeugnis',
			'mySubscription': 'Mein Abonnement',
			'giveandpart': 'Geben und Partnerschaft',
			'follow_us': 'Folge uns auf',
			'profile': 'Profil',
			'no_phone': 'Kein Handy',
			'no_address': 'Keine Adresse',
			'changepwd': 'Kennwort ändern',
			'help_support': 'Hilfe und Unterstützung',
			'quest_logout': 'Möchten Sie sich von der App abmelden?',
			'no': 'NEIN',
			'yes': 'JA',
			'enjoy_using': 'Viel Spaß beim Benutzen ',
			'tap_rate': 'Tippen Sie im App Store auf einen Stern und bewerten Sie es ',
			'please_rate': 'Bitte geben Sie Ihre Bewertung ein ',
			'submit': 'einreichen',
			'select_email': 'Wählen Sie die E-Mail-App zum Verfassen aus',
			'open_mail': 'Öffnen Sie die Mail-App',
			'no_mailer': 'Keine Mail-Apps installiert',
			'login_request': 'Melden Sie sich an, um die Anfrage anzuzeigen',
			'empty': 'Leer',
			'send_prayer': 'Kein Artikel gefunden \n ',
			'podcast': 'Podcast',
			'new_prayer_req': 'Neue Gebetsanliegen oder Zeugnisse',
			'read_more': 'MEHR LESEN',
			'details': 'Einzelheiten',
			'added_bookmark': 'Zum Lesezeichen hinzugefügt',
			'removed_bookmark': 'Aus Lesezeichen entfernt',
			'delete_account': 'Konto löschen',
			'appDescriptionSupport': 'Ihre Partnerschaft durch Ihre Spende an Lighthouse Global Missions ermöglicht es uns, mehr zu bewirken, indem wir Gottes Auftrag erfüllen und Sein lebensveränderndes Wort sowie die wunderwirkende Kraft des Heiligen Geistes in die ganze Welt bringen.\nUnd jedes Opfer, das Sie bringen, wird vom Herrn reich belohnt und vervielfacht, so wie Er es in Seinem Wort zugesichert hat (Bibelstellen: Markus 10,29–30; Lukas 6,38).',
			'giving_via_paypal': 'Spenden über PayPal',
			'click_to_give': 'Zum Spenden klicken',
			'additional_giving': 'Weitere Spendenoptionen',
			'email': 'E-Mail',
			'aboutcontent_para_1': 'Lighthouse Global Missions folgt Gottes Ruf, das Licht Jesu Christi zu den Völkern zu bringen. Die tägliche Andacht „Dein tägliches Licht" (orig.Your Daily Light) ist eine der Möglichkeiten, wie wir diesem Ruf folgen, um das Evangelium Jesu Christi und das erleuchtende Wort Gottes zu Menschen auf der ganzen Welt zu tragen. Diese Andacht bringt Menschen täglich Gottes Wort für ein siegreiches und erfülltes Leben in Christus, damit sie in der Erkenntnis Gottes wachsen, in der Kraft des Heiligen Geistes wandeln, ihren Lebenszweck entdecken und Gottes Ruf für ihr Leben erfüllen können.',
			'aboutcontent_para_2': 'Wir freuen uns, dass du die App „Your Daily Light“ nutzt, die dir kostenlosen Zugang zu einer täglichen Dosis von Gottes Wort für deine geistliche Nahrung und Entwicklung bietet. Wir ermutigen dich auch, die Wirkung dieser Andacht in deinem Leben mit anderen zu teilen, andere zum Herunterladen der App einzuladen und dazu beizutragen, dass wir mehr Menschen zur Ehre Gottes erreichen. Klicke direkt auf die Schaltfläche „Teilen“ in der Anwendung und lade andere ein, die App noch heute herunterzuladen.',
			'aboutcontent_para_3': 'Auf der Startseite der App findest du zudem saisonale prophetische Botschaften darüber, was Gott sagt, kannst dich über Veranstaltungen des Dienstes auf dem Laufenden halten, echte Lebenszeugnisse lesen und Möglichkeiten entdecken, Teil dessen zu sein, was Gott durch Lighthouse Global Missions tut.',
			'aboutcontent_para_4': 'Du kannst auch deine Zeugnisse teilen und Gebetsanliegen über den Bereich „Zeugnisse und Gebete” einreichen. Wir freuen uns, wenn du uns erzählst, wie „Your Daily Light” dein Leben beeinflusst hat, und beten gerne mit dir für deine Anliegen. Im integrierten Buchladen kannst du weiteres Lesematerial finden, das dein Wachstum fördert.',
			'aboutcontent_para_5': 'Die Your Daily Light App ist nur dank der Großzügigkeit von Menschen wie dir, die uns finanziell unterstützen, kostenlos und für ein weltweites Publikum zugänglich. Wir haben auch viele andere Bereiche, in denen jede Spende einen Unterschied macht. Auch du kannst dich dieser Mission anschließen, indem du für diesen Dienst spendest. Und Gott, der verspricht, jedes Opfer für seine Zwecke zu belohnen, wird dich reichlich mit einer Vervielfachung deiner Spende und mit vielfältigen Segnungen beschenken. Deine Spende wird in vielen Leben etwas bewirken. Unter „Spenden und Partnerschaft” findest du Möglichkeiten, wie du spenden kannst.',
			'aboutcontent_para_6a': 'Erfahre mehr über Lighthouse Global Missions unter ',
			'aboutcontent_para_6b': 'oder',
			'aboutcontent_para_7a': 'Abonniere unseren Newsletter unter ',
			'aboutcontent_para_7b': ' um auf dem Laufenden zu bleiben und dich an dem zu beteiligen, was Gott tut. ',
			'aboutcontent_para_8a': 'Sie können sich auch unter folgender Adresse an Pastor Simon wenden:',
			'apptagline': 'Andachts-App für tägliche Erleuchtung und geistliches Wachstum',
			'seebankdetails': 'Überweisungsdetails anzeigen',
			'via_bank': 'Über Bank',
			'bank_details': 'Überweisungsdetails',
			'account_name': 'Kontoname',
			'bank': 'Bank',
			'iban': 'IBAN',
			'myProfile': 'Mein Profil',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Seleccionar idioma',
			'chooseapplanguage': 'Elija el idioma de la aplicación',
			'nightmode': 'Modo nocturno',
			'initializingapp': 'inicializando...',
			'home': 'Inicio',
			'branches': 'Sucursales',
			'inbox': 'Bandeja de entrada',
			'downloads': 'Descargas',
			'settings': 'Configuración',
			'events': 'Eventos',
			'myplaylists': 'Mis listas de reproducción',
			'website': 'Sitio web',
			'hymns': 'Himnos',
			'articles': 'Artículos',
			'notes': 'Notas',
			'donate': 'Donar',
			'savenotetitle': 'Título de la nota',
			'nonotesfound': 'No se encontraron notas',
			'newnote': 'Nuevo',
			'deletenote': 'Eliminar nota',
			'deletenotehint': '¿Quieres eliminar esta nota? Esta acción no se puede revertir.',
			'bookmarks': 'Marcadores',
			'socialplatforms': 'Plataformas sociales',
			'onboardingpagetitles.0': 'TU LUZ DIARIA',
			'onboardingpagetitles.1': 'CREAR UNA CUENTA',
			'onboardingpagetitles.2': 'COMPARTIR',
			'onboardingpagetitles.3': 'MANTÉNGASE ACTUALIZADO',
			'onboardingpagehints.0': 'Encuentre iluminación diaria de la palabra de Dios a través de devocionales y podcasts',
			'onboardingpagehints.1': 'Acceda a contenido inspirador, cree su biblioteca personal y lleve la palabra de Dios a cualquier lugar',
			'onboardingpagehints.2': 'Comparta o lea testimonios inspiradores de todo el mundo. Comparta peticiones de oración y encuentre apoyo oportuno',
			'onboardingpagehints.3': 'Sepa lo que Dios está diciendo para la temporada, manténgase actualizado sobre los eventos y descubra formas de unirse al movimiento.',
			'next': 'SIGUIENTE',
			'done': 'Empezar',
			'quitapp': '¡Salga de la aplicación!',
			'quitappwarning': '¿Deseas cerrar la aplicación?',
			'quitappaudiowarning': 'Actualmente estás reproduciendo un audio; al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.',
			'ok': 'Ok',
			'retry': 'REINTENTAR',
			'oops': '¡Ups!',
			'save': 'Guardar',
			'cancel': 'Cancelar',
			'error': 'error',
			'success': 'Éxito',
			'skip': 'Saltar',
			'skiplogin': 'Saltar inicio de sesión',
			'skipregister': 'Saltar registro',
			'dataloaderror': 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.',
			'suggestedforyou': 'Sugerido para ti',
			'videomessages': 'Mensajes de vídeo',
			'audiomessages': 'Mensajes de audio',
			'devotionals': 'Devocionales',
			'categories': 'Categorías',
			'category': 'categoría',
			'videos': 'Vídeos',
			'audios': 'Audios',
			'biblebooks': 'Biblia',
			'audiobible': 'Biblia en audio',
			'livestreams': 'Transmisiones en vivo',
			'radio': 'Radio',
			'allitems': 'Todos los artículos',
			'emptyplaylist': 'Sin listas de reproducción',
			'notsupported': 'No compatible',
			'cleanupresources': 'Limpiando recursos',
			'grantstoragepermission': 'Otorgue permiso de acceso al almacenamiento para continuar',
			'sharefiletitle': 'Mirar o escuchar',
			'sharefilebody': 'A través de la aplicación Your Daily Light, descárgala ahora en',
			'sharetext': 'Disfrute de transmisión ilimitada de audio y video',
			'sharetexthint': 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descargar ahora en',
			'download': 'Descargar',
			'addplaylist': 'Agregar a la lista de reproducción',
			'bookmark': 'Marcador',
			'unbookmark': 'Desmarcar',
			'share': 'Compartir',
			'deletemedia': 'Eliminar archivo',
			'deletemediahint': '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.',
			'searchhint': 'Buscar mensajes de audio y vídeo',
			'performingsearch': 'Búsqueda de audios y vídeos',
			'nosearchresult': 'No se encontraron resultados',
			'nosearchresulthint': 'Intente ingresar una palabra clave más general',
			'addtoplaylist': 'Agregar a la lista de reproducción',
			'newplaylist': 'Nueva lista de reproducción',
			'playlistitm': 'Lista de reproducción',
			'mediaaddedtoplaylist': 'Medios agregados a la lista de reproducción.',
			'mediaremovedfromplaylist': 'Medios eliminados de la lista de reproducción',
			'clearplaylistmedias': 'Borrar todos los medios',
			'deletePlayList': 'Eliminar lista de reproducción',
			'clearplaylistmediashint': '¿Continuar y eliminar todos los medios de esta lista de reproducción?',
			'deletePlayListhint': '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?',
			'comments': 'Comentarios',
			'replies': 'Respuestas',
			'reply': 'Responder',
			'logintoaddcomment': 'Inicia sesión para agregar un comentario',
			'logintoreply': 'Inicia sesión para responder',
			'writeamessage': 'Escribe un mensaje...',
			'nocomments': 'No se encontraron comentarios \n haga clic para volver a intentarlo',
			'errormakingcomments': 'No se pueden procesar los comentarios en este momento.',
			'errordeletingcomments': 'No se puede eliminar este comentario en este momento.',
			'erroreditingcomments': 'No se puede editar este comentario en este momento.',
			'errorloadingmorecomments': 'No se pueden cargar más comentarios en este momento.',
			'deletingcomment': 'Eliminando comentario',
			'editingcomment': 'Editando comentario',
			'deletecommentalert': 'Eliminar comentario',
			'editcommentalert': 'Editar comentario',
			'deletecommentalerttext': '¿Quieres eliminar este comentario? Esta acción no se puede deshacer.',
			'loadmore': 'cargar más',
			'messages': 'Mensajes',
			'guestuser': 'Usuario invitado',
			'fullname': 'Nombre completo',
			'emailaddress': 'Dirección de correo electrónico',
			'password': 'Contraseña',
			'repeatpassword': 'Repetir contraseña',
			'register': 'Registrarse',
			'login': 'Iniciar sesión',
			'logout': 'Cerrar sesión',
			'logoutfromapp': '¿Cerrar sesión en la aplicación?',
			'logoutfromapphint': 'No podrás dar me gusta ni comentar artículos y videos si no estás conectado.',
			'gotologin': 'Ir a Iniciar sesión',
			'resetpassword': 'Restablecer contraseña',
			'logintoaccount': '¿Ya tienes una cuenta? Iniciar sesión',
			'emptyfielderrorhint': 'Necesitas llenar todos los campos',
			'invalidemailerrorhint': 'Debes ingresar una dirección de correo electrónico válida.',
			'passwordsdontmatch': 'Las contraseñas no coinciden',
			'processingpleasewait': 'Procesando, por favor espere...',
			'createaccount': 'Crear una cuenta',
			'forgotpassword': '¿Olvidaste tu contraseña?',
			'orloginwith': 'O inicia sesión con',
			'facebook': 'facebook',
			'google': 'google',
			'moreoptions': 'Más opciones',
			'about': 'Sobre nosotros',
			'privacy': 'Política de privacidad',
			'terms': 'Términos de la aplicación',
			'rate': 'Calificar aplicación',
			'version': 'Versión',
			'pulluploadmore': 'levantar la carga',
			'loadfailedretry': '¡Falló la carga! ¡Haga clic en Reintentar!',
			'releaseloadmore': 'suelta para cargar más',
			'nomoredata': 'No más datos',
			'errorReportingComment': 'Comentario de informe de errores',
			'reportingComment': 'Comentario de informe',
			'reportcomment': 'Opciones de informe',
			'reportCommentsList.0': 'Contenido comercial no deseado o spam',
			'reportCommentsList.1': 'Pornografía o material sexual explícito.',
			'reportCommentsList.2': 'Incitación al odio o violencia gráfica',
			'reportCommentsList.3': 'Acoso o intimidación',
			'bookmarksMedia': 'Mis marcadores',
			'noitemstodisplay': 'No hay elementos para mostrar',
			'loginrequired': 'Iniciar sesión requerido',
			'loginrequiredhint': 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.',
			'subscriptions': 'Suscripciones a aplicaciones',
			'subscribe': 'SUSCRIBIRSE',
			'subscribehint': 'Se requiere suscripción',
			'playsubscriptionrequiredhint': 'Debes suscribirte antes de poder escuchar o ver este medio.',
			'previewsubscriptionrequiredhint': 'Ha alcanzado la duración de vista previa permitida para este medio. Necesitas suscribirte para seguir escuchando o viendo este medio.',
			'copiedtoclipboard': 'Copiado al portapapeles',
			'downloadbible': 'Descargar la Biblia',
			'downloadversion': 'Descargar',
			'downloading': 'Descargando',
			'failedtodownload': 'No se pudo descargar',
			'pleaseclicktoretry': 'Por favor haga clic para volver a intentarlo.',
			'of': 'de',
			'nobibleversionshint': 'No hay datos bíblicos para mostrar, haga clic en el botón a continuación para descargar al menos una versión de la Biblia.',
			'downloaded': 'Descargado',
			'enteremailaddresstoresetpassword': 'Ingresa tu correo electrónico para restablecer tu contraseña',
			'backtologin': 'VOLVER A INICIAR SESIÓN',
			'signintocontinue': 'Inicia sesión para continuar',
			'signin': 'FIRMAR',
			'signinforanaccount': '¿REGISTRARSE PARA OBTENER UNA CUENTA?',
			'alreadyhaveanaccount': '¿Ya tienes una cuenta?',
			'updateprofile': 'Actualizar perfil',
			'updateprofilehint': 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas.',
			'autoplayvideos': 'Vídeos de reproducción automática',
			'gosocial': 'socializar',
			'searchbible': 'Buscar Biblia',
			'filtersearchoptions': 'Filtrar opciones de búsqueda',
			'narrowdownsearch': 'Utilice el botón de filtro a continuación para limitar la búsqueda y obtener un resultado más preciso.',
			'searchbibleversion': 'Buscar versión de la Biblia',
			'searchbiblebook': 'Buscar libro de la Biblia',
			'search': 'Buscar',
			'setBibleBook': 'Establecer libro de la Biblia',
			'oldtestament': 'Antiguo Testamento',
			'newtestament': 'Nuevo Testamento',
			'limitresults': 'Limitar resultados',
			'setfilters': 'Establecer filtros',
			'bibletranslator': 'Traductor de la Biblia',
			'chapter': 'Capítulo',
			'verse': 'Verso',
			'translate': 'traducir',
			'bibledownloadinfo': 'La descarga de la Biblia comenzó. No cierre esta página hasta que finalice la descarga.',
			'received': 'recibido',
			'outoftotal': 'del total',
			'set': 'CONJUNTO',
			'selectColor': 'Seleccionar color',
			'switchbibleversion': 'Cambiar versión de la Biblia',
			'switchbiblebook': 'Cambiar libro de la Biblia',
			'gotosearch': 'Ir al capítulo',
			'changefontsize': 'Cambiar tamaño de fuente',
			'font': 'fuente',
			'readchapter': 'Leer capítulo',
			'showhighlightedverse': 'Mostrar versículos resaltados',
			'downloadmoreversions': 'Descargar más versiones',
			'suggestedusers': 'Usuarios sugeridos a seguir',
			'unfollow': 'Dejar de seguir',
			'follow': 'Seguir',
			'searchforpeople': 'buscar personas',
			'viewpost': 'Ver publicación',
			'viewprofile': 'Ver perfil',
			'mypins': 'Mis pines',
			'viewpinnedposts': 'Ver publicaciones fijadas',
			'personal': 'personales',
			'update': 'Actualizar',
			'phonenumber': 'Número de teléfono',
			'showmyphonenumber': 'Mostrar mi número de teléfono a los usuarios',
			'dateofbirth': 'Fecha de nacimiento',
			'showmyfulldateofbirth': 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado',
			'notifications': 'Notificaciones',
			'notifywhenuserfollowsme': 'Notificarme cuando un usuario me sigue',
			'notifymewhenusercommentsonmypost': 'Notificarme cuando los usuarios comenten mi publicación.',
			'notifymewhenuserlikesmypost': 'Notificarme cuando a los usuarios les guste mi publicación.',
			'churchsocial': 'Iglesia Social',
			'shareyourthoughts': 'Comparte tus pensamientos',
			'readmore': '...Leer más',
			'less': 'menos',
			'couldnotprocess': 'No se pudo procesar la acción solicitada.',
			'pleaseselectprofilephoto': 'Por favor seleccione una foto de perfil para cargar',
			'pleaseselectprofilecover': 'Seleccione una foto de portada para cargar',
			'updateprofileerrorhint': 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.',
			'gender': 'Género',
			'male': 'masculino',
			'female': 'Mujer',
			'dob': 'fecha de nacimiento',
			'location': 'Ubicación actual',
			'qualification': 'Calificación',
			'aboutme': 'Acerca de mí',
			'facebookprofilelink': 'Enlace de perfil de Facebook',
			'twitterprofilelink': 'Enlace al perfil de Twitter',
			'linkdln': 'Enlace de perfil de LinkedIn',
			'likes': 'Me gusta',
			'likess': 'Me gusta',
			'pinnedposts': 'Mis publicaciones fijadas',
			'unpinpost': 'Desanclar publicación',
			'unpinposthint': '¿Quieres eliminar esta publicación de tus publicaciones fijadas?',
			'postdetails': 'Detalles de la publicación',
			'posts': 'Publicaciones',
			'followers': 'Seguidores',
			'followings': 'Seguidores',
			'my': 'mi',
			'edit': 'Editar',
			'delete': 'Eliminar',
			'deletepost': 'Eliminar publicación',
			'deleteposthint': '¿Quieres eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.',
			'maximumallowedsizehint': 'Carga máxima de archivos permitida alcanzada',
			'maximumuploadsizehint': 'El archivo seleccionado excede el límite de tamaño de archivo de carga permitido.',
			'makeposterror': 'No se puede realizar una publicación en este momento, haga clic para volver a intentarlo.',
			'makepost': 'Hacer publicación',
			'selectfile': 'Seleccionar archivo',
			'images': 'Imágenes',
			'shareYourThoughtsNow': 'Comparte tus pensamientos...',
			'photoviewer': 'Visor de fotos',
			'nochatsavailable': 'No hay conversaciones disponibles \n Haga clic en el ícono Agregar debajo de \n para seleccionar usuarios con quienes chatear',
			'typing': 'Escribiendo...',
			'photo': 'Foto',
			'online': 'En línea',
			'offline': 'Sin conexión',
			'lastseen': 'Visto por última vez',
			'deleteselectedhint': 'Esta acción eliminará los mensajes seleccionados.  Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes aún se mostrarán en el dispositivo de su socio.',
			'deleteselected': 'Eliminar seleccionado',
			'unabletofetchconversation': 'No se puede recuperar \n tu conversación con \n',
			'loadmoreconversation': 'Cargar más conversaciones',
			'sendyourfirstmessage': 'Envía tu primer mensaje a \n',
			'unblock': 'Desbloquear',
			'block': 'Bloquear',
			'writeyourmessage': 'Escribe tu mensaje...',
			'clearconversation': 'Conversación clara',
			'clearconversationhintone': 'Esta acción borrará toda tu conversación con',
			'clearconversationhinttwo': '. \n Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.',
			'facebookloginerror': 'Algo salió mal con el proceso de inicio de sesión. \n, Aquí está el error que nos dio Facebook',
			'mylibrary': 'Mi biblioteca',
			'prayer_request': 'Petición de Oración o Testimonio',
			'mySubscription': 'Mi suscripción',
			'giveandpart': 'Dar y asociarse',
			'follow_us': 'Síguenos en',
			'profile': 'Perfil',
			'no_phone': 'Sin teléfono',
			'no_address': 'Sin dirección',
			'changepwd': 'Cambiar contraseña',
			'help_support': 'Ayuda y soporte',
			'quest_logout': '¿Quieres cerrar sesión en la aplicación?',
			'no': 'No',
			'yes': 'SI',
			'enjoy_using': 'Disfruta usando',
			'tap_rate': 'Toca una estrella y califícala en la App Store',
			'please_rate': 'Por favor ingrese su calificación',
			'submit': 'enviar',
			'select_email': 'Seleccione la aplicación de correo electrónico para redactar',
			'open_mail': 'Abrir aplicación de correo',
			'no_mailer': 'No hay aplicaciones de correo instaladas',
			'login_request': 'Inicie sesión para ver la solicitud',
			'empty': 'vacio',
			'send_prayer': 'No se encontró ningún artículo \n Envíe una nueva solicitud de oración o testimonio',
			'podcast': 'PodCast',
			'new_prayer_req': 'Nueva Petición de Oración o Testimonio',
			'read_more': 'LEER MÁS',
			'details': 'Detalles',
			'added_bookmark': 'Agregado al marcador',
			'removed_bookmark': 'Eliminado del marcador',
			'delete_account': 'Eliminar cuenta',
			'appDescriptionSupport': 'Su asociación a través de donaciones a Lighthouse Global Missions nos permite lograr más en el cumplimiento del llamado de Dios de llevar Su palabra que cambia vidas y el poder milagroso del Espíritu Santo en todo el mundo. Y cada uno de sus sacrificios será ricamente recompensado y repleto con multiplicación por parte del Señor, tal como lo garantizó mediante Su palabra (Referencias de las Escrituras: Marcos 10:29-30, Lucas 6:38).',
			'giving_via_paypal': 'Donar a través de PayPal',
			'click_to_give': 'Haga clic para donar',
			'additional_giving': 'Opciones de donación adicionales',
			'email': 'Correo electrónico',
			'aboutcontent_para_1': 'Lighthouse Global Missions está cumpliendo el llamado de Dios de llevar la Luz de Jesucristo a las naciones. Su devocional Daily Light es una de las formas en que estamos cumpliendo este llamado de llevar el Evangelio de Jesucristo y la palabra iluminadora de Dios a personas de todo el mundo. Este devocional trae la palabra de Dios diariamente a las personas para una vida victoriosa y plena en Cristo, permitiéndoles crecer en el conocimiento de Dios, caminar en el poder del Espíritu Santo, descubrir el propósito de su vida y cumplir el llamado de Dios para sus vidas.',
			'aboutcontent_para_2': 'Nos complace que se sume a la aplicación Your Daily Light, que le brinda acceso gratuito a una dosis diaria de la palabra de Dios para su nutrición y desarrollo espiritual. También te animamos a compartir el impacto de este devocional en tu vida, invitar a otros a descargar la aplicación y contribuir a ayudarnos a llegar a más personas para la gloria de Dios. Presione directamente el botón compartir en la aplicación e invite a otros a descargar la aplicación hoy.',
			'aboutcontent_para_3': 'En la sección de inicio de la aplicación, también encontrará mensajes proféticos estacionales de lo que Dios está diciendo, se mantendrá actualizado con los eventos del ministerio, leerá testimonios de la vida real y descubrirá oportunidades para ser parte de lo que Dios está haciendo a través de Lighthouse Global Missions.',
			'aboutcontent_para_4': 'También puede compartir sus testimonios y enviar solicitudes de oración utilizando la sección de testimonios y oraciones. Estaremos encantados de leer sobre el impacto de Tu Luz Diaria en tu vida y de orar contigo en tus áreas de necesidad. Desde la librería integrada, puede buscar y obtener directamente materiales relevantes para acelerar su crecimiento.',
			'aboutcontent_para_5': 'Su aplicación Daily Light solo es gratuita y accesible para una audiencia global gracias a la generosidad de personas como usted a través de una asociación financiera. También tenemos muchas otras vías de ministerio donde cada donativo marca la diferencia. Tú también puedes unirte a esta misión donando a este ministerio. Y Dios que garantiza recompensar cada sacrificio para Su propósito, os recompensará ricamente con una multiplicación de vuestra ofrenda y con diversas bendiciones. Tu donación marcará la diferencia en muchas vidas. Utilice la sección Donaciones y asociaciones para ver formas de donar.',
			'aboutcontent_para_6a': 'Obtenga más información sobre las misiones globales de Lighthouse en',
			'aboutcontent_para_6b': 'o',
			'aboutcontent_para_7a': 'Suscríbete a nuestro Newsletter en',
			'aboutcontent_para_7b': 'para mantenerse actualizado e involucrarse con lo que Dios está logrando.',
			'aboutcontent_para_8a': 'También puede ponerse en contacto con el Pastor Simón en:',
			'apptagline': 'Aplicación devocional para la iluminación diaria y el crecimiento espiritual',
			'seebankdetails': 'Ver detalles de transferencia bancaria',
			'via_bank': 'vía banco',
			'bank_details': 'Detalles de la transferencia bancaria',
			'account_name': 'Nombre de cuenta',
			'bank': 'Banco',
			'iban': 'IBAN',
			'myProfile': 'Mi perfil',
		};
	}
}

extension on _StringsFr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
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
			'mylibrary': 'Ma bibliothèque',
			'prayer_request': 'Demande de prière ou témoignage',
			'mySubscription': 'Mon abonnement',
			'giveandpart': 'Don et partenariat',
			'follow_us': 'Suivez-nous sur',
			'profile': 'Profil',
			'no_phone': 'Pas de téléphone',
			'no_address': 'Pas d\'adresse',
			'changepwd': 'Changer le mot de passe',
			'help_support': 'Aide et soutien',
			'quest_logout': 'Voulez-vous vous déconnecter de l\'application ?',
			'no': 'Non',
			'yes': 'OUI',
			'enjoy_using': 'Profitez de l\'utilisation ',
			'tap_rate': 'Appuyez sur une étoile et notez-le sur l\'App Store ',
			'please_rate': 'Veuillez entrer votre note ',
			'submit': 'soumettre',
			'select_email': 'Sélectionnez l\'application de messagerie à composer',
			'open_mail': 'Ouvrir l\'application Mail',
			'no_mailer': 'Aucune application de messagerie installée',
			'login_request': 'Connectez-vous pour afficher la demande',
			'empty': 'Vide',
			'send_prayer': 'Aucun élément trouvé \n ',
			'podcast': 'Podcast',
			'new_prayer_req': 'Nouvelle demande de prière ou témoignage',
			'read_more': 'EN SAVOIR PLUS',
			'details': 'Détails',
			'added_bookmark': 'Ajouté aux favoris',
			'removed_bookmark': 'Supprimé du signet',
			'delete_account': 'Supprimer le compte',
			'appDescriptionSupport': 'Votre partenariat par vos dons à Lighthouse Global Missions nous permet d’accomplir davantage l’appel de Dieu, en apportant Sa Parole qui transforme les vies et la puissance miraculeuse du Saint-Esprit à travers le monde. Et chaque sacrifice que vous faites sera richement récompensé et renouvelé avec multiplication par le Seigneur, comme Il l’a garanti dans Sa Parole (Références bibliques : Marc 10:29-30, Luc 6:38).',
			'giving_via_paypal': 'Donner via PayPal',
			'click_to_give': 'Cliquer pour donner',
			'additional_giving': 'Options de don supplémentaires',
			'email': 'E-mail',
			'aboutcontent_para_1': 'Lighthouse Global Missions répond à l\'appel de Dieu pour apporter la lumière de Jésus-Christ aux nations. Notre dévotion quotidienne « Your Daily Light » est l\'un des moyens par lesquels nous répondons à cet appel pour apporter l\'Évangile de Jésus-Christ et la parole éclairante de Dieu aux gens partout dans le monde. Cette méditation apporte chaque jour la parole de Dieu aux gens pour qu\'ils aient une vie victorieuse et épanouissante en Christ, leur permettant de grandir dans la connaissance de Dieu, de marcher dans la puissance du Saint-Esprit, de découvrir le dessein de leur vie et de répondre à l\'appel de Dieu pour leur vie.',
			'aboutcontent_para_2': 'On est heureux de vous accueillir sur l\'application Your Daily Light, qui vous donne accès gratuitement à une dose quotidienne de la parole de Dieu pour votre nourriture et votre développement spirituel. On vous encourage également à partager l\'impact de cette méditation dans votre vie, à inviter d\'autres personnes à télécharger l\'application et à contribuer à nous aider à toucher plus de gens pour la gloire de Dieu. Cliquez directement sur le bouton « Partager » dans l\'application et invitez d\'autres personnes à télécharger l\'application dès aujourd\'hui.',
			'aboutcontent_para_3': 'Dans la section d\'accueil de l\'appli, tu trouveras aussi des messages prophétiques saisonniers sur ce que Dieu dit, tu pourras te tenir au courant des événements du ministère, lire des témoignages réels et découvrir des opportunités de participer à ce que Dieu fait à travers Lighthouse Global Missions.',
			'aboutcontent_para_4': 'Tu peux aussi partager tes témoignages et envoyer des demandes de prière dans la section « Témoignages et prières ». On sera ravis de lire l\'impact de Your Daily Light dans ta vie et de prier avec toi pour tes besoins. Dans la librairie intégrée, tu peux directement trouver et obtenir des ressources pertinentes pour accélérer ta croissance.',
			'aboutcontent_para_5': 'L\'application Your Daily Light est gratuite et accessible à un public mondial grâce à la générosité de personnes comme toi qui nous soutiennent financièrement. On a aussi plein d\'autres moyens de ministère où chaque don fait une différence. Toi aussi, tu peux te joindre à cette mission en donnant à ce ministère. Et Dieu, qui garantit de récompenser chaque sacrifice pour son dessein, te récompensera généreusement en multipliant ton don et en te donnant plein de bénédictions. Ton don fera une différence dans de nombreuses vies. Consulte la section Dons et partenariat pour découvrir les différentes façons de faire un don.',
			'aboutcontent_para_6a': 'Pour en savoir plus sur Lighthouse Global Missions, rends-toi sur ',
			'aboutcontent_para_6b': 'ou ',
			'aboutcontent_para_7a': 'Abonne-toi à notre newsletter sur ',
			'aboutcontent_para_7b': 'pour rester informé et t\'impliquer dans l\'œuvre que Dieu accomplit.',
			'aboutcontent_para_8a': 'Vous pouvez également contacter le pasteur Simon à l\'adresse suivante :',
			'apptagline': 'Application de dévotion pour l’illumination quotidienne et la croissance spirituelle',
			'seebankdetails': 'Voir les détails du virement bancaire',
			'via_bank': 'via Banque',
			'bank_details': 'Détails du virement bancaire',
			'account_name': 'Nom du compte',
			'bank': 'Banque',
			'iban': 'IBAN',
			'myProfile': 'Mon profil',
		};
	}
}

extension on _StringsHi {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'भाषा चुनें',
			'chooseapplanguage': 'ऐप भाषा चुनें',
			'nightmode': 'रात्रि मोड',
			'initializingapp': 'प्रारंभ किया जा रहा है...',
			'home': 'घर',
			'branches': 'शाखाएँ',
			'inbox': 'इनबॉक्स',
			'downloads': 'डाउनलोड',
			'settings': 'सेटिंग्स',
			'events': 'घटनाएँ',
			'myplaylists': 'मेरी प्लेलिस्ट',
			'website': 'वेबसाइट',
			'hymns': 'भजन',
			'articles': 'लेख',
			'notes': 'टिप्पणियाँ',
			'donate': 'दान करें',
			'savenotetitle': 'नोट शीर्षक',
			'nonotesfound': 'कोई नोट नहीं मिला',
			'newnote': 'नया',
			'deletenote': 'नोट हटाएँ',
			'deletenotehint': 'क्या आप यह नोट हटाना चाहते हैं? इस क्रिया को उलटा नहीं किया जा सकता.',
			'bookmarks': 'बुकमार्क',
			'socialplatforms': 'सामाजिक मंच',
			'onboardingpagetitles.0': 'आपकी दैनिक रोशनी',
			'onboardingpagetitles.1': 'एक खाता बनाएँ',
			'onboardingpagetitles.2': 'साझा करें',
			'onboardingpagetitles.3': 'अद्यतन रहें',
			'onboardingpagehints.0': 'Find daily illumination from God’s word through devotionals and podcasts',
			'onboardingpagehints.1': 'Access inspirational content, build your personal library and bring God’s word with you anywhere',
			'onboardingpagehints.2': 'Share or read inspiring testimonies from around the world. प्रार्थना अनुरोध साझा करें और समय पर सहायता पाएं',
			'onboardingpagehints.3': 'Know what God is saying for the season, stay updated about events and discover ways to join the movement',
			'next': 'अगला',
			'done': 'आरंभ करें',
			'quitapp': 'ऐप छोड़ें!',
			'quitappwarning': 'क्या आप ऐप बंद करना चाहते हैं?',
			'quitappaudiowarning': 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.',
			'ok': 'ठीक है',
			'retry': 'पुनः प्रयास करें',
			'oops': 'उफ़!',
			'save': 'सहेजें',
			'cancel': 'रद्द करें',
			'error': 'त्रुटि',
			'success': 'सफलता',
			'skip': 'छोड़ें',
			'skiplogin': 'लॉगिन छोड़ें',
			'skipregister': 'पंजीकरण छोड़ें',
			'dataloaderror': 'Could not load requested data at the moment, check your data connection and click to retry.',
			'suggestedforyou': 'आपके लिए सुझाव दिया गया है',
			'videomessages': 'वीडियो संदेश',
			'audiomessages': 'ऑडियो संदेश',
			'devotionals': 'भक्तिमय',
			'categories': 'श्रेणियाँ',
			'category': 'श्रेणी',
			'videos': 'वीडियो',
			'audios': 'ऑडियो',
			'biblebooks': 'बाइबिल',
			'audiobible': 'ऑडियो बाइबिल',
			'livestreams': 'लाइवस्ट्रीम',
			'radio': 'रेडियो',
			'allitems': 'सभी आइटम',
			'emptyplaylist': 'कोई प्लेलिस्ट नहीं',
			'notsupported': 'समर्थित नहीं',
			'cleanupresources': 'संसाधनों की सफाई',
			'grantstoragepermission': 'कृपया जारी रखने के लिए भंडारण तक पहुंच की अनुमति दें',
			'sharefiletitle': 'देखें या सुनें',
			'sharefilebody': 'योर डेली लाइट ऐप के माध्यम से, अभी डाउनलोड करें',
			'sharetext': 'असीमित ऑडियो और वीडियो स्ट्रीमिंग का आनंद लें',
			'sharetexthint': 'वीडियो और ऑडियो स्ट्रीमिंग प्लेटफ़ॉर्म से जुड़ें जो आपको दुनिया भर की लाखों फ़ाइलें देखने और सुनने की सुविधा देता है। अभी डाउनलोड करें',
			'download': 'डाउनलोड करें',
			'addplaylist': 'प्लेलिस्ट में जोड़ें',
			'bookmark': 'बुकमार्क',
			'unbookmark': 'बुकमार्क हटाएँ',
			'share': 'साझा करें',
			'deletemedia': 'फ़ाइल हटाएँ',
			'deletemediahint': 'क्या आप इस डाउनलोड की गई फ़ाइल को हटाना चाहते हैं? इस एक्शन को वापस नहीं किया जा सकता।',
			'searchhint': 'ऑडियो और वीडियो संदेश खोजें',
			'performingsearch': 'ऑडियो और वीडियो खोज रहे हैं',
			'nosearchresult': 'कोई परिणाम नहीं मिला',
			'nosearchresulthint': 'अधिक सामान्य कीवर्ड इनपुट करने का प्रयास करें',
			'addtoplaylist': 'प्लेलिस्ट में जोड़ें',
			'newplaylist': 'नई प्लेलिस्ट',
			'playlistitm': 'प्लेलिस्ट',
			'mediaaddedtoplaylist': 'मीडिया को प्लेलिस्ट में जोड़ा गया.',
			'mediaremovedfromplaylist': 'मीडिया को प्लेलिस्ट से हटा दिया गया',
			'clearplaylistmedias': 'सभी मीडिया साफ़ करें',
			'deletePlayList': 'प्लेलिस्ट हटाएँ',
			'clearplaylistmediashint': 'आगे बढ़ें और इस प्लेलिस्ट से सभी मीडिया हटा दें?',
			'deletePlayListhint': 'आगे बढ़ें और इस प्लेलिस्ट को हटा दें और सभी मीडिया को साफ़ कर दें?',
			'comments': 'टिप्पणियाँ',
			'replies': 'उत्तर',
			'reply': 'उत्तर',
			'logintoaddcomment': 'टिप्पणी जोड़ने के लिए लॉगिन करें',
			'logintoreply': 'उत्तर देने के लिए लॉगिन करें',
			'writeamessage': 'एक संदेश लिखें...',
			'nocomments': 'कोई टिप्पणी नहीं मिली \n पुनः प्रयास करने के लिए क्लिक करें',
			'errormakingcomments': 'इस समय टिप्पणी करने की प्रक्रिया नहीं की जा सकती..',
			'errordeletingcomments': 'फिलहाल इस टिप्पणी को हटाया नहीं जा सकता..',
			'erroreditingcomments': 'फिलहाल इस टिप्पणी को संपादित नहीं किया जा सकता..',
			'errorloadingmorecomments': 'इस समय अधिक टिप्पणियाँ लोड नहीं की जा सकती..',
			'deletingcomment': 'टिप्पणी हटाई जा रही है',
			'editingcomment': 'टिप्पणी संपादित करना',
			'deletecommentalert': 'टिप्पणी हटाएँ',
			'editcommentalert': 'टिप्पणी संपादित करें',
			'deletecommentalerttext': 'क्या आप यह टिप्पणी हटाना चाहते हैं? इस क्रिया को पूर्ववत नहीं किया जा सकता',
			'loadmore': 'अधिक लोड करें',
			'messages': 'संदेश',
			'guestuser': 'अतिथि उपयोगकर्ता',
			'fullname': 'पूरा नाम',
			'emailaddress': 'ईमेल पता',
			'password': 'पासवर्ड',
			'repeatpassword': 'पासवर्ड दोहराएँ',
			'register': 'रजिस्टर करें',
			'login': 'लॉग इन करें',
			'logout': 'लॉगआउट करें',
			'logoutfromapp': 'ऐप से लॉगआउट करें?',
			'logoutfromapphint': 'यदि आप लॉग इन नहीं हैं तो आप लेखों और वीडियो को लाइक या टिप्पणी नहीं कर पाएंगे।',
			'gotologin': 'लॉगइन पर जाएं',
			'resetpassword': 'पासवर्ड रीसेट करें',
			'logintoaccount': 'क्या आपके पास पहले से ही एक खाता है? लॉग इन करें',
			'emptyfielderrorhint': 'आपको सभी फ़ील्ड भरने होंगे',
			'invalidemailerrorhint': 'आपको एक वैध ईमेल पता दर्ज करना होगा',
			'passwordsdontmatch': 'पासवर्ड मेल नहीं खाते',
			'processingpleasewait': 'प्रसंस्करण हो रहा है, कृपया प्रतीक्षा करें...',
			'createaccount': 'एक खाता बनाएं',
			'forgotpassword': 'पासवर्ड भूल गए?',
			'orloginwith': 'या इसके साथ लॉगिन करें',
			'facebook': 'फेसबुक',
			'google': 'गूगल',
			'moreoptions': 'अधिक विकल्प',
			'about': 'हमारे बारे में',
			'privacy': 'गोपनीयता नीति',
			'terms': 'ऐप की शर्तें',
			'rate': 'रेट ऐप',
			'version': 'संस्करण',
			'pulluploadmore': 'भार ऊपर खींचो',
			'loadfailedretry': 'लोड विफल! पुनः प्रयास करें पर क्लिक करें!',
			'releaseloadmore': 'अधिक लोड करने के लिए रिलीज़ करें',
			'nomoredata': 'कोई और डेटा नहीं',
			'errorReportingComment': 'त्रुटि रिपोर्टिंग टिप्पणी',
			'reportingComment': 'रिपोर्टिंग टिप्पणी',
			'reportcomment': 'रिपोर्ट विकल्प',
			'reportCommentsList.0': 'अवांछित व्यावसायिक सामग्री या स्पैम',
			'reportCommentsList.1': 'अश्लीलता या स्पष्ट यौन सामग्री',
			'reportCommentsList.2': 'अभद्र भाषा या ग्राफिक हिंसा',
			'reportCommentsList.3': 'उत्पीड़न या धमकाना',
			'bookmarksMedia': 'मेरे बुकमार्क',
			'noitemstodisplay': 'प्रदर्शित करने के लिए कोई आइटम नहीं',
			'loginrequired': 'लॉगिन आवश्यक',
			'loginrequiredhint': 'इस प्लेटफ़ॉर्म पर सदस्यता लेने के लिए, आपको लॉग इन करना होगा। अभी एक निःशुल्क खाता बनाएं या अपने मौजूदा खाते में लॉग इन करें।',
			'subscriptions': 'ऐप सदस्यता',
			'subscribe': 'सदस्यता लें',
			'subscribehint': 'सदस्यता आवश्यक है',
			'playsubscriptionrequiredhint': 'इस मीडिया को सुनने या देखने से पहले आपको सदस्यता लेनी होगी।',
			'previewsubscriptionrequiredhint': 'आप इस मीडिया के लिए अनुमत पूर्वावलोकन अवधि तक पहुंच गए हैं। इस मीडिया को सुनना या देखना जारी रखने के लिए आपको सदस्यता लेनी होगी।',
			'copiedtoclipboard': 'क्लिपबोर्ड पर कॉपी किया गया',
			'downloadbible': 'बाइबिल डाउनलोड करें',
			'downloadversion': 'डाउनलोड करें',
			'downloading': 'डाउनलोड हो रहा है',
			'failedtodownload': 'डाउनलोड करने में विफल',
			'pleaseclicktoretry': 'कृपया पुनः प्रयास करने के लिए क्लिक करें।',
			'of': 'का',
			'nobibleversionshint': 'प्रदर्शित करने के लिए कोई बाइबिल डेटा नहीं है, कम से कम एक बाइबिल संस्करण डाउनलोड करने के लिए नीचे दिए गए बटन पर क्लिक करें।',
			'downloaded': 'डाउनलोड किया गया',
			'enteremailaddresstoresetpassword': 'अपना पासवर्ड रीसेट करने के लिए अपना ईमेल दर्ज करें',
			'backtologin': 'लॉगइन पर वापस जाएँ',
			'signintocontinue': 'जारी रखने के लिए साइन इन करें',
			'signin': 'एस आई जी एन आई एन',
			'signinforanaccount': 'किसी खाते के लिए साइन अप करें?',
			'alreadyhaveanaccount': 'क्या आपके पास पहले से ही एक खाता है?',
			'updateprofile': 'प्रोफ़ाइल अपडेट करें',
			'updateprofilehint': 'आरंभ करने के लिए, कृपया अपना प्रोफ़ाइल पृष्ठ अपडेट करें, इससे हमें आपको अन्य लोगों से जोड़ने में मदद मिलेगी',
			'autoplayvideos': 'ऑटोप्ले वीडियो',
			'gosocial': 'सामाजिक हो जाओ',
			'searchbible': 'बाइबिल खोजें',
			'filtersearchoptions': 'खोज विकल्प फ़िल्टर करें',
			'narrowdownsearch': 'अधिक सटीक परिणाम के लिए खोज को सीमित करने के लिए नीचे दिए गए फ़िल्टर बटन का उपयोग करें।',
			'searchbibleversion': 'बाइबिल संस्करण खोजें',
			'searchbiblebook': 'बाइबिल पुस्तक खोजें',
			'search': 'खोजें',
			'setBibleBook': 'बाइबल पुस्तक सेट करें',
			'oldtestament': 'पुराना नियम',
			'newtestament': 'नया नियम',
			'limitresults': 'परिणाम सीमित करें',
			'setfilters': 'फ़िल्टर सेट करें',
			'bibletranslator': 'बाइबिल अनुवादक',
			'chapter': 'अध्याय',
			'verse': 'छंद',
			'translate': 'अनुवाद करें',
			'bibledownloadinfo': 'बाइबिल डाउनलोड शुरू हो गया है, डाउनलोड पूरा होने तक कृपया इस पेज को बंद न करें।',
			'received': 'प्राप्त',
			'outoftotal': 'कुल में से',
			'set': 'सेट',
			'selectColor': 'रंग चुनें',
			'switchbibleversion': 'बाइबिल संस्करण बदलें',
			'switchbiblebook': 'बाइबिल पुस्तक बदलें',
			'gotosearch': 'अध्याय पर जाएँ',
			'changefontsize': 'फ़ॉन्ट आकार बदलें',
			'font': 'फ़ॉन्ट',
			'readchapter': 'अध्याय पढ़ें',
			'showhighlightedverse': 'हाइलाइट किए गए छंद दिखाएं',
			'downloadmoreversions': 'अधिक संस्करण डाउनलोड करें',
			'suggestedusers': 'उपयोगकर्ताओं को अनुसरण करने का सुझाव दिया',
			'unfollow': 'अनफ़ॉलो करें',
			'follow': 'अनुसरण करें',
			'searchforpeople': 'लोगों को खोजें',
			'viewpost': 'पोस्ट देखें',
			'viewprofile': 'प्रोफ़ाइल देखें',
			'mypins': 'मेरे पिन',
			'viewpinnedposts': 'पिन किए गए पोस्ट देखें',
			'personal': 'निजी',
			'update': 'अद्यतन करें',
			'phonenumber': 'फ़ोन नंबर',
			'showmyphonenumber': 'उपयोगकर्ताओं को मेरा फ़ोन नंबर दिखाएँ',
			'dateofbirth': 'जन्मतिथि',
			'showmyfulldateofbirth': 'मेरा स्टेटस देखने वाले लोगों को मेरी पूरी जन्मतिथि दिखाएँ',
			'notifications': 'सूचनाएं',
			'notifywhenuserfollowsme': 'जब कोई उपयोगकर्ता मेरा अनुसरण करे तो मुझे सूचित करें',
			'notifymewhenusercommentsonmypost': 'जब उपयोगकर्ता मेरी पोस्ट पर टिप्पणी करें तो मुझे सूचित करें',
			'notifymewhenuserlikesmypost': 'जब उपयोगकर्ता मेरी पोस्ट पसंद करें तो मुझे सूचित करें',
			'churchsocial': 'चर्च सामाजिक',
			'shareyourthoughts': 'अपने विचार साझा करें',
			'readmore': '...और पढ़ें',
			'less': 'कम',
			'couldnotprocess': 'Could not process requested action.',
			'pleaseselectprofilephoto': 'Please select a profile photo to upload',
			'pleaseselectprofilecover': 'Please select a cover photo to upload',
			'updateprofileerrorhint': 'आगे बढ़ने से पहले आपको अपना नाम, जन्मतिथि, लिंग, फ़ोन और स्थान भरना होगा।',
			'gender': 'लिंग',
			'male': 'पुरुष',
			'female': 'स्त्री',
			'dob': 'जन्म तिथि',
			'location': 'वर्तमान स्थान',
			'qualification': 'योग्यता',
			'aboutme': 'मेरे बारे में',
			'facebookprofilelink': 'फेसबुक प्रोफ़ाइल लिंक',
			'twitterprofilelink': 'ट्विटर प्रोफ़ाइल लिंक',
			'linkdln': 'लिंक्डएलएन प्रोफ़ाइल लिंक',
			'likes': 'पसंद है',
			'likess': 'जैसे',
			'pinnedposts': 'मेरी पिन की गई पोस्ट',
			'unpinpost': 'पोस्ट अनपिन करें',
			'unpinposthint': 'क्या आप इस पोस्ट को अपनी पिन की गई पोस्ट से हटाना चाहते हैं?',
			'postdetails': 'पोस्ट विवरण',
			'posts': 'पोस्ट',
			'followers': 'अनुयायी',
			'followings': 'अनुसरण',
			'my': 'मेरा',
			'edit': 'संपादित करें',
			'delete': 'हटाएँ',
			'deletepost': 'पोस्ट हटाएँ',
			'deleteposthint': 'क्या आप इस पोस्ट को हटाना चाहते हैं? कुछ उपयोगकर्ता फ़ीड पर पोस्ट अभी भी दिखाई दे सकती हैं.',
			'maximumallowedsizehint': 'अधिकतम अनुमत फ़ाइल अपलोड पहुंच गई',
			'maximumuploadsizehint': 'चयनित फ़ाइल अनुमत अपलोड फ़ाइल आकार सीमा से अधिक है।',
			'makeposterror': 'इस समय पोस्ट करने में असमर्थ, कृपया पुनः प्रयास करने के लिए क्लिक करें।',
			'makepost': 'पोस्ट करें',
			'selectfile': 'फ़ाइल चुनें',
			'images': 'छवियाँ',
			'shareYourThoughtsNow': 'अपने विचार साझा करें...',
			'photoviewer': 'फोटो देखने वाला',
			'nochatsavailable': 'कोई वार्तालाप उपलब्ध नहीं है \n चैट करने के लिए उपयोगकर्ताओं का चयन करने के लिए \n के नीचे जोड़ें आइकन पर क्लिक करें',
			'typing': 'टाइपिंग...',
			'photo': 'फ़ोटो',
			'online': 'ऑनलाइन',
			'offline': 'ऑफ़लाइन',
			'lastseen': 'अंतिम बार देखा गया',
			'deleteselectedhint': 'यह क्रिया चयनित संदेशों को हटा देगी.  कृपया ध्यान दें कि यह केवल बातचीत के आपके पक्ष को हटाता है, \n संदेश अभी भी आपके साझेदार डिवाइस पर दिखाई देंगे।',
			'deleteselected': 'चयनित हटाएँ',
			'unabletofetchconversation': '\n के साथ आपकी बातचीत \n लाने में असमर्थ',
			'loadmoreconversation': 'अधिक वार्तालाप लोड करें',
			'sendyourfirstmessage': 'अपना पहला संदेश \n पर भेजें',
			'unblock': 'अनब्लॉक करें',
			'block': 'ब्लॉक',
			'writeyourmessage': 'अपना संदेश लिखें...',
			'clearconversation': 'स्पष्ट बातचीत',
			'clearconversationhintone': 'इस क्रिया से आपकी सारी बातचीत साफ़ हो जाएगी',
			'clearconversationhinttwo': '. __एनएल__ कृपया ध्यान दें कि यह केवल बातचीत के आपके पक्ष को हटाता है, संदेश अभी भी आपके साझेदार चैट पर दिखाई देंगे।',
			'facebookloginerror': 'लॉगिन प्रक्रिया में कुछ गड़बड़ी हुई. __एनएल__, यह वह त्रुटि है जो फेसबुक ने हमें दी है',
			'mylibrary': 'मेरी लाइब्रेरी',
			'prayer_request': 'प्रार्थना अनुरोध या गवाही',
			'mySubscription': 'मेरी सदस्यता',
			'giveandpart': 'देना और साझेदारी',
			'follow_us': 'हमें फॉलो करें',
			'profile': 'प्रोफाइल',
			'no_phone': 'कोई फ़ोन नहीं',
			'no_address': 'कोई पता नहीं',
			'changepwd': 'पासवर्ड बदलें',
			'help_support': 'सहायता और समर्थन',
			'quest_logout': 'क्या आप ऐप से लॉगआउट करना चाहते हैं?',
			'no': 'नहीं',
			'yes': 'हाँ',
			'enjoy_using': 'प्रयोग का आनंद लें',
			'tap_rate': 'ऐप स्टोर पर स्टार रेट पर टैप करें',
			'please_rate': 'कृपया अपनी रेटिंग दर्ज करें',
			'submit': 'सबमिट करें',
			'select_email': 'लिखने के लिए ईमेल ऐप चुनें',
			'open_mail': 'मेल ऐप खोलें',
			'no_mailer': 'कोई मेल ऐप्स इंस्टॉल नहीं है',
			'login_request': 'अनुरोध देखने के लिए लॉगिन करें',
			'empty': 'ख़ाली',
			'send_prayer': 'कोई आइटम नहीं मिला \n एक नया प्रार्थना अनुरोध या गवाही भेजें',
			'podcast': 'पॉडकास्ट',
			'new_prayer_req': 'नया प्रार्थना अनुरोध या गवाही',
			'read_more': 'और पढ़ें',
			'details': 'विवरण',
			'added_bookmark': 'बुकमार्क में जोड़ा गया',
			'removed_bookmark': 'बुकमार्क से हटा दिया गया',
			'delete_account': 'खाता हटाएँ',
			'appDescriptionSupport': 'लाइटहाउस ग्लोबल मिशन को दान देने के माध्यम से आपकी साझेदारी हमें दुनिया भर में उनके जीवन बदलने वाले शब्द और पवित्र आत्मा की चमत्कारी कार्य शक्ति को लाने में भगवान के आह्वान को पूरा करने में और अधिक सक्षम बनाती है। और आपके प्रत्येक बलिदान को प्रभु द्वारा प्रचुर मात्रा में पुरस्कृत किया जाएगा और गुणा के साथ फिर से भर दिया जाएगा, जैसा कि उन्होंने अपने वचन से गारंटी दी है (पवित्रशास्त्र संदर्भ: मार्क 10:29-30, ल्यूक 6:38)।',
			'giving_via_paypal': 'पेपैल के माध्यम से दे रहे हैं',
			'click_to_give': 'देने के लिए क्लिक करें',
			'additional_giving': 'अतिरिक्त विकल्प दे रहे हैं',
			'email': 'ईमेल',
			'aboutcontent_para_1': 'लाइटहाउस ग्लोबल मिशन राष्ट्रों में यीशु मसीह की रोशनी लाने के लिए ईश्वर के आह्वान को पूरा कर रहा है। आपकी दैनिक प्रकाश भक्ति उन तरीकों में से एक है जिसके द्वारा हम यीशु मसीह के सुसमाचार और ईश्वर के ज्ञानवर्धक वचन को दुनिया भर के लोगों तक पहुंचाने के इस आह्वान को पूरा कर रहे हैं। यह भक्ति, मसीह में विजयी और पूर्ण जीवन के लिए व्यक्तियों तक प्रतिदिन ईश्वर के वचन पहुंचाती है, जिससे उन्हें ईश्वर के ज्ञान में वृद्धि करने, पवित्र आत्मा की शक्ति में चलने, अपने जीवन के उद्देश्य की खोज करने और अपने जीवन के लिए ईश्वर के आह्वान को पूरा करने में सक्षम बनाया जाता है।',
			'aboutcontent_para_2': 'हमें खुशी है कि आप योर डेली लाइट ऐप के साथ जुड़कर आपके पोषण और आध्यात्मिक विकास के लिए ईश्वर के वचनों की दैनिक खुराक तक मुफ्त पहुंच प्रदान कर रहे हैं। हम आपको अपने जीवन में इस भक्ति के प्रभाव को साझा करने, दूसरों को ऐप डाउनलोड करने के लिए आमंत्रित करने और भगवान की महिमा के लिए अधिक लोगों तक पहुंचने में हमारी मदद करने में योगदान देने के लिए भी प्रोत्साहित करते हैं। एप्लिकेशन में सीधे शेयर बटन दबाएं और दूसरों को आज ही ऐप डाउनलोड करने के लिए आमंत्रित करें।',
			'aboutcontent_para_3': 'एप्लिकेशन होम अनुभाग पर, आपको ईश्वर क्या कह रहा है, इसके मौसमी भविष्यवाणी संदेश भी मिलेंगे, मंत्रालय की घटनाओं के साथ अपडेट रहें, वास्तविक जीवन की गवाही पढ़ें और लाइटहाउस ग्लोबल मिशनों के माध्यम से ईश्वर जो कर रहा है उसका हिस्सा बनने के अवसरों की खोज करें।',
			'aboutcontent_para_4': 'आप गवाही और प्रार्थना अनुभाग का उपयोग करके अपनी गवाही भी साझा कर सकते हैं और प्रार्थना अनुरोध सबमिट कर सकते हैं। हमें आपके जीवन में आपके दैनिक प्रकाश के प्रभाव के बारे में पढ़कर और आपकी ज़रूरत के क्षेत्रों में आपके साथ प्रार्थना करके खुशी होगी। बिल्ट-इन बुक स्टोर से, आप सीधे अपने विकास में तेजी लाने के लिए प्रासंगिक सामग्री पा सकते हैं और प्राप्त कर सकते हैं।',
			'aboutcontent_para_5': 'आपका डेली लाइट ऐप केवल वित्तीय साझेदारी के माध्यम से आप जैसे व्यक्तियों की उदारता से वैश्विक दर्शकों के लिए मुफ़्त और सुलभ बनाया गया है। हमारे पास मंत्रालय के कई अन्य रास्ते भी हैं जहां हर उपहार एक अंतर बनाता है। आप भी इस मंत्रालय को देकर इस मिशन से जुड़ सकते हैं. और ईश्वर जो अपने उद्देश्य के लिए हर बलिदान का प्रतिफल देने की गारंटी देता है, वह आपको आपके उपहार को कई गुना बढ़ाकर और विविध आशीषों से पुरस्कृत करेगा। आपका दान कई जिंदगियों में बदलाव लाएगा। दान देने के तरीके देखने के लिए दान और साझेदारी अनुभाग का उपयोग करें।',
			'aboutcontent_para_6a': 'लाइटहाउस ग्लोबल मिशन के बारे में अधिक जानें',
			'aboutcontent_para_6b': 'या',
			'aboutcontent_para_7a': 'हमारे न्यूज़लेटर की सदस्यता लें',
			'aboutcontent_para_7b': 'अद्यतन रहने के लिए और भगवान जो पूरा कर रहा है उसमें शामिल होने के लिए।',
			'aboutcontent_para_8a': 'आप पादरी साइमन से यहां भी संपर्क कर सकते हैं:',
			'apptagline': 'दैनिक रोशनी और आध्यात्मिक विकास के लिए भक्ति ऐप',
			'seebankdetails': 'बैंक हस्तांतरण विवरण देखें',
			'via_bank': 'बैंक के माध्यम से',
			'bank_details': 'बैंक हस्तांतरण विवरण',
			'account_name': 'खाता नाम',
			'bank': 'किनारा',
			'iban': 'आईबीएएन',
			'myProfile': 'मेरी प्रोफाइल',
		};
	}
}

extension on _StringsIt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Seleziona lingua',
			'chooseapplanguage': 'Scegli la lingua dell\'app',
			'nightmode': 'Modalità notturna',
			'initializingapp': 'inizializzazione...',
			'home': 'Casa',
			'branches': 'Rami',
			'inbox': 'Posta in arrivo',
			'downloads': 'Download',
			'settings': 'Impostazioni',
			'events': 'Eventi',
			'myplaylists': 'Le mie playlist',
			'website': 'Sito web',
			'hymns': 'Inni',
			'articles': 'Articoli',
			'notes': 'Note',
			'donate': 'Dona',
			'savenotetitle': 'Titolo della nota',
			'nonotesfound': 'Nessuna nota trovata',
			'newnote': 'Nuovo',
			'deletenote': 'Elimina nota',
			'deletenotehint': 'Vuoi eliminare questa nota? Questa azione non può essere annullata.',
			'bookmarks': 'Segnalibri',
			'socialplatforms': 'Piattaforme sociali',
			'onboardingpagetitles.0': 'LA TUA LUCE QUOTIDIANA',
			'onboardingpagetitles.1': 'CREA UN ACCOUNT',
			'onboardingpagetitles.2': 'CONDIVIDI',
			'onboardingpagetitles.3': 'RIMANI AGGIORNATO',
			'onboardingpagehints.0': 'Trova l\'illuminazione quotidiana dalla Parola di Dio attraverso devozionali e podcast',
			'onboardingpagehints.1': 'Accedi a contenuti stimolanti, costruisci la tua libreria personale e porta la parola di Dio con te ovunque',
			'onboardingpagehints.2': 'Condividi o leggi testimonianze stimolanti da tutto il mondo. Condividi le richieste di preghiera e trova supporto tempestivo',
			'onboardingpagehints.3': 'Scopri cosa Dio dice per la stagione, rimani aggiornato sugli eventi e scopri modi per unirti al movimento',
			'next': 'AVANTI',
			'done': 'Inizia',
			'quitapp': 'Esci dall\'app!',
			'quitappwarning': 'Desideri chiudere l\'app?',
			'quitappaudiowarning': 'Stai attualmente riproducendo un audio, chiudendo l\'app si interromperà la riproduzione audio. Se non desideri interrompere la riproduzione, minimizza semplicemente l\'app con il pulsante centrale o fai clic sul pulsante Ok per uscire subito dall\'app.',
			'ok': 'Ok',
			'retry': 'RIPROVARE',
			'oops': 'Ops!',
			'save': 'Salva',
			'cancel': 'Annulla',
			'error': 'Errore',
			'success': 'Successo',
			'skip': 'Salta',
			'skiplogin': 'Salta l\'accesso',
			'skipregister': 'Salta la registrazione',
			'dataloaderror': 'Impossibile caricare i dati richiesti al momento, controlla la connessione dati e fai clic per riprovare.',
			'suggestedforyou': 'Suggerito per te',
			'videomessages': 'Messaggi video',
			'audiomessages': 'Messaggi audio',
			'devotionals': 'Devozionali',
			'categories': 'Categorie',
			'category': 'Categoria',
			'videos': 'Video',
			'audios': 'Audio',
			'biblebooks': 'Bibbia',
			'audiobible': 'Bibbia audio',
			'livestreams': 'Livestream',
			'radio': 'Radio',
			'allitems': 'Tutti gli articoli',
			'emptyplaylist': 'Nessuna playlist',
			'notsupported': 'Non supportato',
			'cleanupresources': 'Ripulire le risorse',
			'grantstoragepermission': 'Concedere l\'autorizzazione di accesso allo spazio di archiviazione per continuare',
			'sharefiletitle': 'Guarda o ascolta',
			'sharefilebody': 'Tramite l\'app Your Daily Light, scaricala ora su',
			'sharetext': 'Goditi lo streaming audio e video illimitato',
			'sharetexthint': 'Unisciti alla piattaforma di streaming video e audio che ti consente di guardare e ascoltare milioni di file da tutto il mondo. Scarica ora su',
			'download': 'Scarica',
			'addplaylist': 'Aggiungi alla playlist',
			'bookmark': 'Segnalibro',
			'unbookmark': 'Annulla segnalibro',
			'share': 'Condividi',
			'deletemedia': 'Elimina file',
			'deletemediahint': 'Desideri eliminare questo file scaricato? Questa azione non può essere annullata.',
			'searchhint': 'Cerca messaggi audio e video',
			'performingsearch': 'Ricerca di audio e video',
			'nosearchresult': 'Nessun risultato trovato',
			'nosearchresulthint': 'Prova a inserire una parola chiave più generale',
			'addtoplaylist': 'Aggiungi alla playlist',
			'newplaylist': 'Nuova playlist',
			'playlistitm': 'Playlist',
			'mediaaddedtoplaylist': 'File multimediali aggiunti alla playlist.',
			'mediaremovedfromplaylist': 'File multimediali rimossi dalla playlist',
			'clearplaylistmedias': 'Cancella tutti i media',
			'deletePlayList': 'Elimina playlist',
			'clearplaylistmediashint': 'Vuoi procedere e rimuovere tutti i contenuti multimediali da questa playlist?',
			'deletePlayListhint': 'Vuoi procedere ed eliminare questa playlist e cancellare tutti i contenuti multimediali?',
			'comments': 'Commenti',
			'replies': 'Risposte',
			'reply': 'Rispondi',
			'logintoaddcomment': 'Accedi per aggiungere un commento',
			'logintoreply': 'Accedi per rispondere',
			'writeamessage': 'Scrivi un messaggio...',
			'nocomments': 'Nessun commento trovato \n fai clic per riprovare',
			'errormakingcomments': 'Impossibile elaborare i commenti al momento..',
			'errordeletingcomments': 'Impossibile eliminare questo commento al momento..',
			'erroreditingcomments': 'Impossibile modificare questo commento al momento..',
			'errorloadingmorecomments': 'Impossibile caricare altri commenti al momento..',
			'deletingcomment': 'Eliminazione commento',
			'editingcomment': 'Modifica del commento',
			'deletecommentalert': 'Elimina commento',
			'editcommentalert': 'Modifica commento',
			'deletecommentalerttext': 'Desideri eliminare questo commento? Questa azione non può essere annullata',
			'loadmore': 'caricare di più',
			'messages': 'Messaggi',
			'guestuser': 'Utente ospite',
			'fullname': 'Nome completo',
			'emailaddress': 'Indirizzo e-mail',
			'password': 'Parola d\'ordine',
			'repeatpassword': 'Ripeti password',
			'register': 'Registrati',
			'login': 'Accedi',
			'logout': 'Esci',
			'logoutfromapp': 'Disconnettersi dall\'app?',
			'logoutfromapphint': 'Non potrai mettere mi piace o commentare articoli e video se non hai effettuato l\'accesso.',
			'gotologin': 'Vai su Accedi',
			'resetpassword': 'Reimposta password',
			'logintoaccount': 'Hai già un account? Accedi',
			'emptyfielderrorhint': 'È necessario compilare tutti i campi',
			'invalidemailerrorhint': 'È necessario inserire un indirizzo email valido',
			'passwordsdontmatch': 'Le password non corrispondono',
			'processingpleasewait': 'Elaborazione in corso. Attendi...',
			'createaccount': 'Crea un account',
			'forgotpassword': 'Password dimenticata?',
			'orloginwith': 'Oppure accedi con',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Più opzioni',
			'about': 'Chi siamo',
			'privacy': 'Informativa sulla privacy',
			'terms': 'Termini dell\'app',
			'rate': 'Valuta l\'app',
			'version': 'Versione',
			'pulluploadmore': 'tirare su il carico',
			'loadfailedretry': 'Caricamento non riuscito! Fare clic su Riprova!',
			'releaseloadmore': 'rilasciare per caricare altro',
			'nomoredata': 'Niente più dati',
			'errorReportingComment': 'Commento sulla segnalazione degli errori',
			'reportingComment': 'Segnalazione commento',
			'reportcomment': 'Opzioni di rapporto',
			'reportCommentsList.0': 'Contenuti commerciali indesiderati o spam',
			'reportCommentsList.1': 'Pornografia o materiale sessuale esplicito',
			'reportCommentsList.2': 'Incitamento all\'odio o violenza esplicita',
			'reportCommentsList.3': 'Molestie o bullismo',
			'bookmarksMedia': 'I miei segnalibri',
			'noitemstodisplay': 'Nessun elemento da visualizzare',
			'loginrequired': 'Accesso richiesto',
			'loginrequiredhint': 'Per iscriverti a questa piattaforma, devi essere loggato. Crea subito un account gratuito o accedi al tuo account esistente.',
			'subscriptions': 'Abbonamenti all\'app',
			'subscribe': 'ISCRIVITI',
			'subscribehint': 'Abbonamento richiesto',
			'playsubscriptionrequiredhint': 'È necessario abbonarsi prima di poter ascoltare o guardare questo contenuto multimediale.',
			'previewsubscriptionrequiredhint': 'Hai raggiunto la durata dell\'anteprima consentita per questo supporto. Devi iscriverti per continuare ad ascoltare o guardare questo media.',
			'copiedtoclipboard': 'Copiato negli appunti',
			'downloadbible': 'Scarica Bibbia',
			'downloadversion': 'Scarica',
			'downloading': 'Download in corso',
			'failedtodownload': 'Impossibile scaricare',
			'pleaseclicktoretry': 'Fare clic per riprovare.',
			'of': 'Di',
			'nobibleversionshint': 'Non ci sono dati biblici da visualizzare, fai clic sul pulsante in basso per scaricare almeno una versione della Bibbia.',
			'downloaded': 'Scaricato',
			'enteremailaddresstoresetpassword': 'Inserisci la tua email per reimpostare la password',
			'backtologin': 'TORNA ALL\'ACCESSO',
			'signintocontinue': 'Accedi per continuare',
			'signin': 'S I G N I N',
			'signinforanaccount': 'REGISTRARE UN ACCOUNT?',
			'alreadyhaveanaccount': 'Hai già un account?',
			'updateprofile': 'Aggiorna profilo',
			'updateprofilehint': 'Per iniziare, aggiorna la pagina del tuo profilo, questo ci aiuterà a metterti in contatto con altre persone',
			'autoplayvideos': 'Video con riproduzione automatica',
			'gosocial': 'Diventa sociale',
			'searchbible': 'Cerca Bibbia',
			'filtersearchoptions': 'Filtra le opzioni di ricerca',
			'narrowdownsearch': 'Utilizza il pulsante filtro qui sotto per restringere la ricerca e ottenere un risultato più preciso.',
			'searchbibleversion': 'Cerca la versione della Bibbia',
			'searchbiblebook': 'Cerca il libro della Bibbia',
			'search': 'Cerca',
			'setBibleBook': 'Impostare il libro della Bibbia',
			'oldtestament': 'Antico Testamento',
			'newtestament': 'Nuovo Testamento',
			'limitresults': 'Limitare i risultati',
			'setfilters': 'Imposta filtri',
			'bibletranslator': 'Traduttore della Bibbia',
			'chapter': 'Capitolo',
			'verse': 'Versetto',
			'translate': 'tradurre',
			'bibledownloadinfo': 'Download della Bibbia avviato. Non chiudere questa pagina fino al termine del download.',
			'received': 'ricevuto',
			'outoftotal': 'fuori totale',
			'set': 'IMPOSTARE',
			'selectColor': 'Seleziona Colore',
			'switchbibleversion': 'Cambia versione della Bibbia',
			'switchbiblebook': 'Cambia libro biblico',
			'gotosearch': 'Vai al capitolo',
			'changefontsize': 'Modifica dimensione carattere',
			'font': 'Carattere',
			'readchapter': 'Leggi il capitolo',
			'showhighlightedverse': 'Mostra i versi evidenziati',
			'downloadmoreversions': 'Scarica più versioni',
			'suggestedusers': 'Utenti suggeriti da seguire',
			'unfollow': 'Smetti di seguire',
			'follow': 'Segui',
			'searchforpeople': 'Cerca persone',
			'viewpost': 'Visualizza messaggio',
			'viewprofile': 'Visualizza profilo',
			'mypins': 'I miei Pin',
			'viewpinnedposts': 'Visualizza i post fissati',
			'personal': 'Personale',
			'update': 'Aggiorna',
			'phonenumber': 'Numero di telefono',
			'showmyphonenumber': 'Mostra il mio numero di telefono agli utenti',
			'dateofbirth': 'Data di nascita',
			'showmyfulldateofbirth': 'Mostra la mia data di nascita completa alle persone che visualizzano il mio stato',
			'notifications': 'Notifiche',
			'notifywhenuserfollowsme': 'Avvisami quando un utente mi segue',
			'notifymewhenusercommentsonmypost': 'Avvisami quando gli utenti commentano il mio post',
			'notifymewhenuserlikesmypost': 'Avvisami quando agli utenti piace il mio post',
			'churchsocial': 'Chiesa Sociale',
			'shareyourthoughts': 'Condividi i tuoi pensieri',
			'readmore': '...Leggi di più',
			'less': 'Meno',
			'couldnotprocess': 'Impossibile elaborare l\'azione richiesta.',
			'pleaseselectprofilephoto': 'Seleziona una foto del profilo da caricare',
			'pleaseselectprofilecover': 'Seleziona una foto di copertina da caricare',
			'updateprofileerrorhint': 'Devi inserire il tuo nome, data di nascita, sesso, telefono e posizione prima di poter procedere.',
			'gender': 'Genere',
			'male': 'Maschio',
			'female': 'Femmina',
			'dob': 'Data di nascita',
			'location': 'Posizione attuale',
			'qualification': 'Qualificazione',
			'aboutme': 'Su di me',
			'facebookprofilelink': 'Collegamento al profilo Facebook',
			'twitterprofilelink': 'Collegamento al profilo Twitter',
			'linkdln': 'Collegamento al profilo Linkedln',
			'likes': 'Mi piace',
			'likess': 'Mi piace/i',
			'pinnedposts': 'I miei post fissati',
			'unpinpost': 'Sblocca il messaggio',
			'unpinposthint': 'Desideri rimuovere questo post dai tuoi post fissati?',
			'postdetails': 'Dettagli del messaggio',
			'posts': 'Messaggi',
			'followers': 'Seguaci',
			'followings': 'Seguenti',
			'my': 'Mio',
			'edit': 'Modifica',
			'delete': 'Elimina',
			'deletepost': 'Elimina messaggio',
			'deleteposthint': 'Desideri eliminare questo post? I post possono ancora apparire sui feed di alcuni utenti.',
			'maximumallowedsizehint': 'È stato raggiunto il caricamento massimo di file consentito',
			'maximumuploadsizehint': 'Il file selezionato supera il limite di dimensioni del file di caricamento consentito.',
			'makeposterror': 'Impossibile pubblicare il post al momento, fare clic per riprovare.',
			'makepost': 'Crea post',
			'selectfile': 'Seleziona File',
			'images': 'Immagini',
			'shareYourThoughtsNow': 'Condividi i tuoi pensieri...',
			'photoviewer': 'Visualizzatore di foto',
			'nochatsavailable': 'Nessuna conversazione disponibile \n Fai clic sull\'icona di aggiunta sotto \n per selezionare gli utenti con cui chattare',
			'typing': 'Digitando...',
			'photo': 'Foto',
			'online': 'In linea',
			'offline': 'Non in linea',
			'lastseen': 'Visto l\'ultima volta',
			'deleteselectedhint': 'Questa azione eliminerà i messaggi selezionati.  Tieni presente che questo eliminerà solo la tua parte della conversazione, \n i messaggi continueranno a essere visualizzati sul dispositivo del tuo partner.',
			'deleteselected': 'Elimina selezionato',
			'unabletofetchconversation': 'Impossibile recuperare \n la tua conversazione con \n',
			'loadmoreconversation': 'Carica più conversazioni',
			'sendyourfirstmessage': 'Invia il tuo primo messaggio a \n',
			'unblock': 'Sblocca',
			'block': 'Blocca',
			'writeyourmessage': 'Scrivi il tuo messaggio...',
			'clearconversation': 'Conversazione chiara',
			'clearconversationhintone': 'Questa azione cancellerà tutta la conversazione con',
			'clearconversationhinttwo': '. \n Tieni presente che questa operazione elimina solo la tua parte della conversazione, i messaggi verranno comunque visualizzati nella chat del tuo partner.',
			'facebookloginerror': 'Qualcosa è andato storto durante la procedura di accesso. \n, ecco l\'errore che Facebook ci ha fornito',
			'mylibrary': 'La mia biblioteca',
			'prayer_request': 'Richiesta di preghiera o testimonianza',
			'mySubscription': 'Il mio abbonamento',
			'giveandpart': 'Donazione e partenariato',
			'follow_us': 'Seguici su',
			'profile': 'Profilo',
			'no_phone': 'Niente telefono',
			'no_address': 'Nessun indirizzo',
			'changepwd': 'Cambia password',
			'help_support': 'Aiuto e supporto',
			'quest_logout': 'Vuoi disconnetterti dall\'app?',
			'no': 'No',
			'yes': 'SÌ',
			'enjoy_using': 'Divertiti ad usare',
			'tap_rate': 'Tocca una stella per valutarlo sull\'App Store',
			'please_rate': 'Inserisci la tua valutazione',
			'submit': 'presentare',
			'select_email': 'Seleziona l\'app di posta elettronica per comporre',
			'open_mail': 'Apri l\'applicazione di posta',
			'no_mailer': 'Nessuna app di posta installata',
			'login_request': 'Accedi per visualizzare la richiesta',
			'empty': 'Vuoto',
			'send_prayer': 'Nessun elemento trovato \n Invia una nuova richiesta di preghiera o testimonianza',
			'podcast': 'Podcast',
			'new_prayer_req': 'Nuova richiesta di preghiera o testimonianza',
			'read_more': 'LEGGI DI PIÙ',
			'details': 'Dettagli',
			'added_bookmark': 'Aggiunto ai segnalibri',
			'removed_bookmark': 'Rimosso dai segnalibri',
			'delete_account': 'Elimina account',
			'appDescriptionSupport': 'La tua collaborazione attraverso le donazioni a Lighthouse Global Missions ci consente di realizzare di più nell’adempimento della chiamata di Dio nel portare la Sua parola che cambia la vita e la potenza miracolosa dello Spirito Santo in tutto il mondo. E ogni tuo sacrificio sarà riccamente ricompensato e riempito con moltiplicazione dal Signore, proprio come Egli ha garantito con la Sua parola (Riferimenti scritturali: Marco 10:29-30, Luca 6:38).',
			'giving_via_paypal': 'Donare tramite PayPal',
			'click_to_give': 'Clicca per donare',
			'additional_giving': 'Ulteriori opzioni di donazione',
			'email': 'E-mail',
			'aboutcontent_para_1': 'Lighthouse Global Missions sta adempiendo alla chiamata di Dio di portare la luce di Gesù Cristo alle nazioni. Il tuo devozionale Daily Light è uno dei modi in cui stiamo adempiendo a questa chiamata a portare il Vangelo di Gesù Cristo e la parola illuminante di Dio alle persone di tutto il mondo. Questo devozionale porta quotidianamente la parola di Dio agli individui per una vita vittoriosa e appagante in Cristo, consentendo loro di crescere nella conoscenza di Dio, camminare nella potenza dello Spirito Santo, scoprire lo scopo della loro vita e soddisfare la chiamata di Dio per le loro vite.',
			'aboutcontent_para_2': 'Siamo lieti di averti a bordo dell’app Your Daily Light, garantendoti l’accesso gratuito a una dose quotidiana della parola di Dio per il tuo nutrimento e sviluppo spirituale. Ti incoraggiamo anche a condividere l\'impatto di questa devozione nella tua vita, invitare altri a scaricare l\'app e contribuire ad aiutarci a raggiungere più persone per la gloria di Dio. Premi direttamente il pulsante di condivisione nell\'applicazione e invita altri a scaricare l\'app oggi stesso.',
			'aboutcontent_para_3': 'Nella sezione iniziale dell\'applicazione troverai anche messaggi profetici stagionali su ciò che Dio sta dicendo, rimani aggiornato con gli eventi del ministero, leggi testimonianze di vita reale e scopri opportunità per essere parte di ciò che Dio sta facendo attraverso Lighthouse Global Missions.',
			'aboutcontent_para_4': 'Puoi anche condividere le tue testimonianze e inviare richieste di preghiera utilizzando la sezione testimonianze e preghiere. Saremo lieti di leggere l\'impatto della Tua Luce Quotidiana nella tua vita e di pregare con te nelle aree di bisogno. Dalla libreria integrata, puoi trovare e ottenere direttamente materiali pertinenti per accelerare la tua crescita.',
			'aboutcontent_para_5': 'La tua app Daily Light è resa gratuita e accessibile a un pubblico globale solo grazie alla generosità di persone come te attraverso una partnership finanziaria. Abbiamo anche molte altre vie di ministero in cui ogni dono fa la differenza. Anche tu puoi unirti a questa missione donando a questo ministero. E Dio, che garantisce di premiare ogni sacrificio per il Suo scopo, ti ricompenserà riccamente con una moltiplicazione del tuo dono e con diverse benedizioni. La tua donazione farà la differenza in molte vite. Utilizza la sezione Donazioni e partnership per vedere come donare.',
			'aboutcontent_para_6a': 'Scopri di più sulle missioni globali Lighthouse su',
			'aboutcontent_para_6b': 'O',
			'aboutcontent_para_7a': 'Iscriviti alla nostra newsletter su',
			'aboutcontent_para_7b': 'per rimanere aggiornato e lasciarsi coinvolgere da ciò che Dio sta realizzando.',
			'aboutcontent_para_8a': 'Puoi anche metterti in contatto con il pastore Simon a:',
			'apptagline': 'App devozionale per l\'illuminazione quotidiana e la crescita spirituale',
			'seebankdetails': 'Vedi i dettagli del bonifico bancario',
			'via_bank': 'tramite Banca',
			'bank_details': 'Dettagli bonifico bancario',
			'account_name': 'Nome utente',
			'bank': 'Banca',
			'iban': 'IBAN',
			'myProfile': 'Il mio profilo',
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Selecione o idioma',
			'chooseapplanguage': 'Escolha o idioma do aplicativo',
			'nightmode': 'Modo noturno',
			'initializingapp': 'inicializando...',
			'home': 'Página inicial',
			'branches': 'Filiais',
			'inbox': 'Caixa de entrada',
			'downloads': 'Transferências',
			'settings': 'Configurações',
			'events': 'Eventos',
			'myplaylists': 'Minhas listas de reprodução',
			'website': 'Site',
			'hymns': 'Hinos',
			'articles': 'Artigos',
			'notes': 'Notas',
			'donate': 'Doe',
			'savenotetitle': 'Título da nota',
			'nonotesfound': 'Nenhuma nota encontrada',
			'newnote': 'Novo',
			'deletenote': 'Excluir nota',
			'deletenotehint': 'Deseja excluir esta nota? Esta ação não pode ser revertida.',
			'bookmarks': 'Favoritos',
			'socialplatforms': 'Plataformas Sociais',
			'onboardingpagetitles.0': 'SUA LUZ DIÁRIA',
			'onboardingpagetitles.1': 'CRIAR UMA CONTA',
			'onboardingpagetitles.2': 'COMPARTILHE',
			'onboardingpagetitles.3': 'MANTENHA-SE ATUALIZADO',
			'onboardingpagehints.0': 'Encontre iluminação diária da palavra de Deus por meio de devocionais e podcasts',
			'onboardingpagehints.1': 'Acesse conteúdo inspirador, construa sua biblioteca pessoal e leve a palavra de Deus com você para qualquer lugar',
			'onboardingpagehints.2': 'Compartilhe ou leia testemunhos inspiradores de todo o mundo. Compartilhe pedidos de oração e encontre apoio oportuno',
			'onboardingpagehints.3': 'Saiba o que Deus está dizendo para a temporada, fique atualizado sobre os acontecimentos e descubra maneiras de se juntar ao movimento',
			'next': 'PRÓXIMO',
			'done': 'Comece',
			'quitapp': 'Saia do aplicativo!',
			'quitappwarning': 'Deseja fechar o aplicativo?',
			'quitappaudiowarning': 'Você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, basta minimizar o aplicativo com o botão central ou clicar no botão OK para sair do aplicativo agora.',
			'ok': 'Ok',
			'retry': 'TENTAR DE NOVO',
			'oops': 'Ops!',
			'save': 'Salvar',
			'cancel': 'Cancelar',
			'error': 'Erro',
			'success': 'Sucesso',
			'skip': 'Pular',
			'skiplogin': 'Pular login',
			'skipregister': 'Pular registro',
			'dataloaderror': 'Não foi possível carregar os dados solicitados no momento. Verifique sua conexão de dados e clique para tentar novamente.',
			'suggestedforyou': 'Sugerido para você',
			'videomessages': 'Mensagens de vídeo',
			'audiomessages': 'Mensagens de áudio',
			'devotionals': 'Devocionais',
			'categories': 'Categorias',
			'category': 'Categoria',
			'videos': 'Vídeos',
			'audios': 'Áudios',
			'biblebooks': 'Bíblia',
			'audiobible': 'Bíblia em Áudio',
			'livestreams': 'Transmissões ao vivo',
			'radio': 'Rádio',
			'allitems': 'Todos os itens',
			'emptyplaylist': 'Sem listas de reprodução',
			'notsupported': 'Não compatível',
			'cleanupresources': 'Limpando recursos',
			'grantstoragepermission': 'Conceda permissão de acesso ao armazenamento para continuar',
			'sharefiletitle': 'Assistir ou ouvir',
			'sharefilebody': 'Através do seu aplicativo Daily Light, baixe agora em',
			'sharetext': 'Desfrute de streaming ilimitado de áudio e vídeo',
			'sharetexthint': 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em',
			'download': 'Baixar',
			'addplaylist': 'Adicionar à lista de reprodução',
			'bookmark': 'Marcador',
			'unbookmark': 'Cancelar marcação',
			'share': 'Compartilhar',
			'deletemedia': 'Excluir arquivo',
			'deletemediahint': 'Deseja excluir este arquivo baixado? Esta ação não pode ser desfeita.',
			'searchhint': 'Pesquisar mensagens de áudio e vídeo',
			'performingsearch': 'Pesquisando Áudios e Vídeos',
			'nosearchresult': 'Nenhum resultado encontrado',
			'nosearchresulthint': 'Tente inserir uma palavra-chave mais geral',
			'addtoplaylist': 'Adicionar à lista de reprodução',
			'newplaylist': 'Nova lista de reprodução',
			'playlistitm': 'Lista de reprodução',
			'mediaaddedtoplaylist': 'Mídia adicionada à lista de reprodução.',
			'mediaremovedfromplaylist': 'Mídia removida da playlist',
			'clearplaylistmedias': 'Limpar todas as mídias',
			'deletePlayList': 'Excluir lista de reprodução',
			'clearplaylistmediashint': 'Quer remover todas as mídias desta playlist?',
			'deletePlayListhint': 'Vá em frente e exclua esta playlist e limpe todas as mídias?',
			'comments': 'Comentários',
			'replies': 'Respostas',
			'reply': 'Responder',
			'logintoaddcomment': 'Faça login para adicionar um comentário',
			'logintoreply': 'Faça login para responder',
			'writeamessage': 'Escreva uma mensagem...',
			'nocomments': 'Nenhum comentário encontrado \n clique para tentar novamente',
			'errormakingcomments': 'Não é possível processar comentários no momento.',
			'errordeletingcomments': 'Não é possível excluir este comentário no momento..',
			'erroreditingcomments': 'Não é possível editar este comentário no momento.',
			'errorloadingmorecomments': 'Não é possível carregar mais comentários no momento.',
			'deletingcomment': 'Excluindo comentário',
			'editingcomment': 'Editando comentário',
			'deletecommentalert': 'Excluir comentário',
			'editcommentalert': 'Editar comentário',
			'deletecommentalerttext': 'Deseja excluir este comentário? Esta ação não pode ser desfeita',
			'loadmore': 'carregar mais',
			'messages': 'Mensagens',
			'guestuser': 'Usuário convidado',
			'fullname': 'Nome Completo',
			'emailaddress': 'Endereço de e-mail',
			'password': 'Senha',
			'repeatpassword': 'Repetir senha',
			'register': 'Cadastre-se',
			'login': 'Entrar',
			'logout': 'Sair',
			'logoutfromapp': 'Sair do aplicativo?',
			'logoutfromapphint': 'Você não poderá curtir ou comentar artigos e vídeos se não estiver logado.',
			'gotologin': 'Vá para Entrar',
			'resetpassword': 'Redefinir senha',
			'logintoaccount': 'Já tem uma conta? Entrar',
			'emptyfielderrorhint': 'Você precisa preencher todos os campos',
			'invalidemailerrorhint': 'Você precisa inserir um endereço de e-mail válido',
			'passwordsdontmatch': 'As senhas não coincidem',
			'processingpleasewait': 'Processando, aguarde...',
			'createaccount': 'Crie uma conta',
			'forgotpassword': 'Esqueceu a senha?',
			'orloginwith': 'Ou faça login com',
			'facebook': 'Facebook',
			'google': 'Google',
			'moreoptions': 'Mais opções',
			'about': 'Sobre nós',
			'privacy': 'Política de Privacidade',
			'terms': 'Termos do aplicativo',
			'rate': 'Avaliar aplicativo',
			'version': 'Versão',
			'pulluploadmore': 'puxar carga',
			'loadfailedretry': 'Falha ao carregar! Clique em tentar novamente!',
			'releaseloadmore': 'solte para carregar mais',
			'nomoredata': 'Não há mais dados',
			'errorReportingComment': 'Comentário sobre relatório de erros',
			'reportingComment': 'Comentário de relatório',
			'reportcomment': 'Opções de relatório',
			'reportCommentsList.0': 'Conteúdo comercial indesejado ou spam',
			'reportCommentsList.1': 'Pornografia ou material sexual explícito',
			'reportCommentsList.2': 'Discurso de ódio ou violência gráfica',
			'reportCommentsList.3': 'Assédio ou intimidação',
			'bookmarksMedia': 'Meus favoritos',
			'noitemstodisplay': 'Nenhum item para exibir',
			'loginrequired': 'Login obrigatório',
			'loginrequiredhint': 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login na sua conta existente.',
			'subscriptions': 'Assinaturas de aplicativos',
			'subscribe': 'ASSINAR',
			'subscribehint': 'Assinatura necessária',
			'playsubscriptionrequiredhint': 'Você precisa se inscrever antes de poder ouvir ou assistir esta mídia.',
			'previewsubscriptionrequiredhint': 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.',
			'copiedtoclipboard': 'Copiado para a área de transferência',
			'downloadbible': 'Baixar Bíblia',
			'downloadversion': 'Baixar',
			'downloading': 'Baixando',
			'failedtodownload': 'Falha ao baixar',
			'pleaseclicktoretry': 'Clique para tentar novamente.',
			'of': 'De',
			'nobibleversionshint': 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.',
			'downloaded': 'Baixado',
			'enteremailaddresstoresetpassword': 'Digite seu e-mail para redefinir sua senha',
			'backtologin': 'VOLTAR AO LOGIN',
			'signintocontinue': 'Faça login para continuar',
			'signin': 'S I G N I N',
			'signinforanaccount': 'INSCREVER-SE PARA UMA CONTA?',
			'alreadyhaveanaccount': 'Já tem uma conta?',
			'updateprofile': 'Atualizar perfil',
			'updateprofilehint': 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas',
			'autoplayvideos': 'Vídeos de reprodução automática',
			'gosocial': 'Socialize',
			'searchbible': 'Pesquisar Bíblia',
			'filtersearchoptions': 'Filtrar opções de pesquisa',
			'narrowdownsearch': 'Use o botão de filtro abaixo para restringir a pesquisa e obter um resultado mais preciso.',
			'searchbibleversion': 'Pesquisar versão da Bíblia',
			'searchbiblebook': 'Pesquisar Livro Bíblico',
			'search': 'Pesquisar',
			'setBibleBook': 'Definir livro bíblico',
			'oldtestament': 'Antigo Testamento',
			'newtestament': 'Novo Testamento',
			'limitresults': 'Limitar resultados',
			'setfilters': 'Definir filtros',
			'bibletranslator': 'Tradutor da Bíblia',
			'chapter': 'Capítulo',
			'verse': 'Versículo',
			'translate': 'traduzir',
			'bibledownloadinfo': 'O download da Bíblia foi iniciado. Por favor, não feche esta página até que o download seja concluído.',
			'received': 'recebido',
			'outoftotal': 'do total',
			'set': 'DEFINIR',
			'selectColor': 'Selecione a cor',
			'switchbibleversion': 'Mudar versão da Bíblia',
			'switchbiblebook': 'Trocar livro bíblico',
			'gotosearch': 'Ir para o capítulo',
			'changefontsize': 'Alterar tamanho da fonte',
			'font': 'Fonte',
			'readchapter': 'Leia o capítulo',
			'showhighlightedverse': 'Mostrar versículos destacados',
			'downloadmoreversions': 'Baixe mais versões',
			'suggestedusers': 'Usuários sugeridos para seguir',
			'unfollow': 'Deixar de seguir',
			'follow': 'Siga',
			'searchforpeople': 'Procure pessoas',
			'viewpost': 'Ver postagem',
			'viewprofile': 'Ver perfil',
			'mypins': 'Meus alfinetes',
			'viewpinnedposts': 'Ver postagens fixadas',
			'personal': 'Pessoal',
			'update': 'Atualizar',
			'phonenumber': 'Número de telefone',
			'showmyphonenumber': 'Mostrar meu número de telefone aos usuários',
			'dateofbirth': 'Data de Nascimento',
			'showmyfulldateofbirth': 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status',
			'notifications': 'Notificações',
			'notifywhenuserfollowsme': 'Notificar-me quando um usuário me seguir',
			'notifymewhenusercommentsonmypost': 'Notificar-me quando os usuários comentarem minha postagem',
			'notifymewhenuserlikesmypost': 'Notifique-me quando os usuários gostarem da minha postagem',
			'churchsocial': 'Igreja Social',
			'shareyourthoughts': 'Compartilhe seus pensamentos',
			'readmore': '...Leia mais',
			'less': 'Menos',
			'couldnotprocess': 'Não foi possível processar a ação solicitada.',
			'pleaseselectprofilephoto': 'Selecione uma foto de perfil para enviar',
			'pleaseselectprofilecover': 'Selecione uma foto de capa para enviar',
			'updateprofileerrorhint': 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de prosseguir.',
			'gender': 'Gênero',
			'male': 'Masculino',
			'female': 'Feminino',
			'dob': 'Data de nascimento',
			'location': 'Localização atual',
			'qualification': 'Qualificação',
			'aboutme': 'Sobre mim',
			'facebookprofilelink': 'Link do perfil do Facebook',
			'twitterprofilelink': 'Link do perfil do Twitter',
			'linkdln': 'Link do perfil do LinkedIn',
			'likes': 'Curtidas',
			'likess': 'Gosto(s)',
			'pinnedposts': 'Minhas postagens fixadas',
			'unpinpost': 'Liberar postagem',
			'unpinposthint': 'Deseja remover esta postagem de suas postagens fixadas?',
			'postdetails': 'Detalhes da postagem',
			'posts': 'Postagens',
			'followers': 'Seguidores',
			'followings': 'Seguidores',
			'my': 'Meu',
			'edit': 'Editar',
			'delete': 'Excluir',
			'deletepost': 'Excluir postagem',
			'deleteposthint': 'Deseja excluir esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.',
			'maximumallowedsizehint': 'Máximo permitido de upload de arquivos atingido',
			'maximumuploadsizehint': 'O arquivo selecionado excede o limite permitido de tamanho de arquivo para upload.',
			'makeposterror': 'Não é possível postar no momento. Clique para tentar novamente.',
			'makepost': 'Fazer postagem',
			'selectfile': 'Selecione o arquivo',
			'images': 'Imagens',
			'shareYourThoughtsNow': 'Compartilhe seus pensamentos ...',
			'photoviewer': 'Visualizador de fotos',
			'nochatsavailable': 'Nenhuma conversa disponível \n Clique no ícone de adição abaixo \n para selecionar usuários com quem conversar',
			'typing': 'Digitando...',
			'photo': 'Foto',
			'online': 'On-line',
			'offline': 'Off-line',
			'lastseen': 'Visto pela última vez',
			'deleteselectedhint': 'Esta ação excluirá as mensagens selecionadas.  Observe que isso exclui apenas o seu lado da conversa. \n as mensagens ainda serão exibidas no dispositivo do seu parceiro.',
			'deleteselected': 'Excluir selecionado',
			'unabletofetchconversation': 'Não foi possível buscar \n sua conversa com \n',
			'loadmoreconversation': 'Carregar mais conversas',
			'sendyourfirstmessage': 'Envie sua primeira mensagem para \n',
			'unblock': 'Desbloquear',
			'block': 'Bloquear',
			'writeyourmessage': 'Escreva sua mensagem...',
			'clearconversation': 'Conversa clara',
			'clearconversationhintone': 'Esta ação limpará toda a sua conversa com',
			'clearconversationhinttwo': '. \n Observe que isso exclui apenas o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo do seu parceiro.',
			'facebookloginerror': 'Algo deu errado com o processo de login. \n, aqui está o erro que o Facebook nos deu',
			'mylibrary': 'Minha biblioteca',
			'prayer_request': 'Pedido de Oração ou Testemunho',
			'mySubscription': 'Minha assinatura',
			'giveandpart': 'Doação e Parceria',
			'follow_us': 'Siga-nos em',
			'profile': 'Perfil',
			'no_phone': 'Sem telefone',
			'no_address': 'Sem endereço',
			'changepwd': 'Alterar senha',
			'help_support': 'Ajuda e suporte',
			'quest_logout': 'Deseja sair do aplicativo?',
			'no': 'Não',
			'yes': 'SIM',
			'enjoy_using': 'Aproveite o uso',
			'tap_rate': 'Toque em uma estrela e avalie-o na App Store',
			'please_rate': 'Por favor, insira sua classificação',
			'submit': 'enviar',
			'select_email': 'Selecione o aplicativo de e-mail para escrever',
			'open_mail': 'Abra o aplicativo Mail',
			'no_mailer': 'Nenhum aplicativo de e-mail instalado',
			'login_request': 'Faça login para visualizar a solicitação',
			'empty': 'Vazio',
			'send_prayer': 'Nenhum item encontrado \n Envie um novo pedido de oração ou testemunho',
			'podcast': 'Podcast',
			'new_prayer_req': 'Novo Pedido de Oração ou Testemunho',
			'read_more': 'LEIA MAIS',
			'details': 'Detalhes',
			'added_bookmark': 'Adicionado aos favoritos',
			'removed_bookmark': 'Removido dos favoritos',
			'delete_account': 'Excluir conta',
			'appDescriptionSupport': 'A sua parceria através de doações à Lighthouse Global Missions permite-nos realizar mais no cumprimento do chamado de Deus ao levar a Sua palavra transformadora de vidas e o poder milagroso do Espírito Santo ao redor do mundo. E todos os seus sacrifícios serão ricamente recompensados ​​e reabastecidos com multiplicação pelo Senhor, assim como Ele garantiu por Sua palavra (Referências das Escrituras: Marcos 10:29-30, Lucas 6:38).',
			'giving_via_paypal': 'Doando via PayPal',
			'click_to_give': 'Clique para dar',
			'additional_giving': 'Opções adicionais de doação',
			'email': 'E-mail',
			'aboutcontent_para_1': 'A Lighthouse Global Missions está cumprindo o chamado de Deus para levar a Luz de Jesus Cristo às nações. Seu devocional Daily Light é uma das maneiras pelas quais estamos cumprindo esse chamado de levar o Evangelho de Jesus Cristo e a palavra iluminadora de Deus a indivíduos em todo o mundo. Este devocional leva a palavra de Deus diariamente aos indivíduos para uma vida vitoriosa e plena em Cristo, permitindo-lhes crescer no conhecimento de Deus, andar no poder do Espírito Santo, descobrir o propósito de sua vida e cumprir o chamado de Deus para suas vidas.',
			'aboutcontent_para_2': 'Estamos felizes por você ter aderido ao aplicativo Your Daily Light, concedendo-lhe acesso gratuito a uma dose diária da palavra de Deus para sua nutrição e desenvolvimento espiritual. Também encorajamos você a compartilhar o impacto deste devocional em sua vida, convidar outras pessoas a baixar o aplicativo e contribuir para nos ajudar a alcançar mais pessoas para a glória de Deus. Clique diretamente no botão de compartilhamento no aplicativo e convide outras pessoas para baixar o aplicativo hoje mesmo.',
			'aboutcontent_para_3': 'Na seção inicial do aplicativo, você também encontrará mensagens proféticas sazonais sobre o que Deus está dizendo, ficará atualizado com os eventos do ministério, lerá testemunhos da vida real e descobrirá oportunidades de fazer parte do que Deus está fazendo por meio do Lighthouse Global Missions.',
			'aboutcontent_para_4': 'Você também pode compartilhar seu testemunho e enviar pedidos de oração usando a seção de testemunhos e orações. Teremos o maior prazer em ler sobre o impacto da Sua Luz Diária em sua vida e em orar com você em suas áreas de necessidade. Na livraria integrada, você pode encontrar e obter diretamente materiais relevantes para acelerar seu crescimento.',
			'aboutcontent_para_5': 'Seu aplicativo Daily Light só é gratuito e acessível a um público global pela generosidade de indivíduos como você por meio de parceria financeira. Também temos muitos outros caminhos de ministério onde cada doação faz a diferença. Você também pode se juntar a esta missão doando para este ministério. E Deus, que garante recompensar cada sacrifício para o Seu propósito, irá recompensá-lo ricamente com uma multiplicação da sua dádiva e com diversas bênçãos. Sua doação fará a diferença em muitas vidas. Use a seção Doações e Parcerias para ver maneiras de doar.',
			'aboutcontent_para_6a': 'Saiba mais sobre as Missões Globais da Lighthouse em',
			'aboutcontent_para_6b': 'ou',
			'aboutcontent_para_7a': 'Assine nossa Newsletter em',
			'aboutcontent_para_7b': 'para se manter atualizado e se envolver com o que Deus está realizando.',
			'aboutcontent_para_8a': 'Você também pode entrar em contato com o Pastor Simon em:',
			'apptagline': 'App Devocional para Iluminação Diária e Crescimento Espiritual',
			'seebankdetails': 'Veja detalhes da transferência bancária',
			'via_bank': 'através do banco',
			'bank_details': 'Detalhes da transferência bancária',
			'account_name': 'Nome da conta',
			'bank': 'Banco',
			'iban': 'IBAN',
			'myProfile': 'Meu perfil',
		};
	}
}

extension on _StringsRu {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': 'Выберите язык',
			'chooseapplanguage': 'Выберите язык приложения',
			'nightmode': 'Ночной режим',
			'initializingapp': 'инициализация...',
			'home': 'Главная',
			'branches': 'Филиалы',
			'inbox': 'Входящие',
			'downloads': 'Загрузки',
			'settings': 'Настройки',
			'events': 'События',
			'myplaylists': 'Мои плейлисты',
			'website': 'Веб-сайт',
			'hymns': 'Гимны',
			'articles': 'Статьи',
			'notes': 'Примечания',
			'donate': 'Пожертвовать',
			'savenotetitle': 'Название заметки',
			'nonotesfound': 'Заметки не найдены',
			'newnote': 'Новый',
			'deletenote': 'Удалить заметку',
			'deletenotehint': 'Вы хотите удалить эту заметку? Это действие невозможно отменить.',
			'bookmarks': 'Закладки',
			'socialplatforms': 'Социальные платформы',
			'onboardingpagetitles.0': 'ВАШ ЕЖЕДНЕВНЫЙ СВЕТ',
			'onboardingpagetitles.1': 'СОЗДАТЬ АККАУНТ',
			'onboardingpagetitles.2': 'ПОДЕЛИТЬСЯ',
			'onboardingpagetitles.3': 'БУДЬТЕ В АКТУАЛЬНОСТИ',
			'onboardingpagehints.0': 'Ежедневно находите озарение в Божьем слове через молитвы и подкасты.',
			'onboardingpagehints.1': 'Получите доступ к вдохновляющему контенту, создайте свою личную библиотеку и носите слово Божье с собой куда угодно.',
			'onboardingpagehints.2': 'Поделитесь или прочитайте вдохновляющие свидетельства со всего мира. Поделитесь молитвенными просьбами и найдите своевременную поддержку',
			'onboardingpagehints.3': 'Узнайте, что Бог говорит об этом сезоне, будьте в курсе событий и найдите способы присоединиться к движению.',
			'next': 'СЛЕДУЮЩИЙ',
			'done': 'Начать',
			'quitapp': 'Выйдите из приложения!',
			'quitappwarning': 'Вы хотите закрыть приложение?',
			'quitappaudiowarning': 'В настоящее время вы воспроизводите звук, выход из приложения остановит воспроизведение звука. Если вы не хотите останавливать воспроизведение, просто сверните приложение с помощью центральной кнопки или нажмите кнопку «ОК», чтобы выйти из приложения сейчас.',
			'ok': 'ок',
			'retry': 'ПОВТОРИТЬ',
			'oops': 'Ой!',
			'save': 'Сохранить',
			'cancel': 'Отмена',
			'error': 'Ошибка',
			'success': 'Успех',
			'skip': 'Пропустить',
			'skiplogin': 'Пропустить вход',
			'skipregister': 'Пропустить регистрацию',
			'dataloaderror': 'В данный момент не удалось загрузить запрошенные данные. Проверьте подключение к данным и нажмите, чтобы повторить попытку.',
			'suggestedforyou': 'Предлагается для вас',
			'videomessages': 'Видеосообщения',
			'audiomessages': 'Аудио сообщения',
			'devotionals': 'Молитвы',
			'categories': 'Категории',
			'category': 'Категория',
			'videos': 'Видео',
			'audios': 'Аудиозаписи',
			'biblebooks': 'Библия',
			'audiobible': 'Аудио Библия',
			'livestreams': 'Прямые трансляции',
			'radio': 'Радио',
			'allitems': 'Все предметы',
			'emptyplaylist': 'Нет плейлистов',
			'notsupported': 'Не поддерживается',
			'cleanupresources': 'Очистка ресурсов',
			'grantstoragepermission': 'Пожалуйста, предоставьте разрешение на доступ к хранилищу, чтобы продолжить.',
			'sharefiletitle': 'Смотрите или слушайте',
			'sharefilebody': 'Через приложение Your Daily Light загрузите сейчас на',
			'sharetext': 'Наслаждайтесь неограниченной потоковой передачей аудио и видео',
			'sharetexthint': 'Присоединяйтесь к платформе потокового видео и аудио, которая позволяет вам смотреть и слушать миллионы файлов со всего мира. Загрузите сейчас на',
			'download': 'Скачать',
			'addplaylist': 'Добавить в плейлист',
			'bookmark': 'Закладка',
			'unbookmark': 'Удалить из закладок',
			'share': 'Поделиться',
			'deletemedia': 'Удалить файл',
			'deletemediahint': 'Вы хотите удалить этот загруженный файл? Это действие невозможно отменить.',
			'searchhint': 'Поиск аудио и видео сообщений',
			'performingsearch': 'Поиск аудио и видео',
			'nosearchresult': 'Результаты не найдены',
			'nosearchresulthint': 'Попробуйте ввести более общее ключевое слово',
			'addtoplaylist': 'Добавить в плейлист',
			'newplaylist': 'Новый плейлист',
			'playlistitm': 'Плейлист',
			'mediaaddedtoplaylist': 'Медиафайл добавлен в плейлист.',
			'mediaremovedfromplaylist': 'Медиафайл удален из плейлиста',
			'clearplaylistmedias': 'Очистить все носители',
			'deletePlayList': 'Удалить плейлист',
			'clearplaylistmediashint': 'Удалить все медиафайлы из этого плейлиста?',
			'deletePlayListhint': 'Удалить этот плейлист и очистить все медиафайлы?',
			'comments': 'Комментарии',
			'replies': 'Ответы',
			'reply': 'Ответить',
			'logintoaddcomment': 'Войдите, чтобы добавить комментарий',
			'logintoreply': 'Войдите, чтобы ответить',
			'writeamessage': 'Напишите сообщение...',
			'nocomments': 'Комментарии не найдены \n нажмите, чтобы повторить попытку',
			'errormakingcomments': 'В данный момент не могу обработать комментарий..',
			'errordeletingcomments': 'Сейчас невозможно удалить этот комментарий..',
			'erroreditingcomments': 'Сейчас невозможно редактировать этот комментарий..',
			'errorloadingmorecomments': 'На данный момент невозможно загрузить больше комментариев..',
			'deletingcomment': 'Удаление комментария',
			'editingcomment': 'Редактирование комментария',
			'deletecommentalert': 'Удалить комментарий',
			'editcommentalert': 'Редактировать комментарий',
			'deletecommentalerttext': 'Вы хотите удалить этот комментарий? Это действие нельзя отменить.',
			'loadmore': 'загрузить больше',
			'messages': 'Сообщения',
			'guestuser': 'Гость пользователь',
			'fullname': 'Полное имя',
			'emailaddress': 'Адрес электронной почты',
			'password': 'Пароль',
			'repeatpassword': 'Повторите пароль',
			'register': 'Зарегистрироваться',
			'login': 'Войти',
			'logout': 'Выход из системы',
			'logoutfromapp': 'Выйти из приложения?',
			'logoutfromapphint': 'Вы не сможете ставить лайки или комментировать статьи и видео, если не вошли в систему.',
			'gotologin': 'Перейти к входу',
			'resetpassword': 'Сбросить пароль',
			'logintoaccount': 'У вас уже есть аккаунт? Войти',
			'emptyfielderrorhint': 'Вам необходимо заполнить все поля',
			'invalidemailerrorhint': 'Вам необходимо ввести действующий адрес электронной почты',
			'passwordsdontmatch': 'Пароли не совпадают',
			'processingpleasewait': 'Обработка. Пожалуйста, подождите...',
			'createaccount': 'Создать учетную запись',
			'forgotpassword': 'Забыли пароль?',
			'orloginwith': 'Или войдите через',
			'facebook': 'Фейсбук',
			'google': 'Гугл',
			'moreoptions': 'Дополнительные параметры',
			'about': 'О нас',
			'privacy': 'Политика конфиденциальности',
			'terms': 'Условия использования приложения',
			'rate': 'Оцените приложение',
			'version': 'Версия',
			'pulluploadmore': 'подтянуть груз',
			'loadfailedretry': 'Не удалось загрузить! Нажмите «Повторить».',
			'releaseloadmore': 'отпустите, чтобы загрузить больше',
			'nomoredata': 'Больше нет данных',
			'errorReportingComment': 'Комментарий к отчету об ошибках',
			'reportingComment': 'Сообщение о комментарии',
			'reportcomment': 'Параметры отчета',
			'reportCommentsList.0': 'Нежелательный коммерческий контент или спам',
			'reportCommentsList.1': 'Порнография или материалы откровенно сексуального характера',
			'reportCommentsList.2': 'Разжигание ненависти или изображения насилия',
			'reportCommentsList.3': 'Преследование или издевательство',
			'bookmarksMedia': 'Мои закладки',
			'noitemstodisplay': 'Нет элементов для отображения',
			'loginrequired': 'Требуется вход',
			'loginrequiredhint': 'Чтобы подписаться на эту платформу, вам необходимо войти в систему. Создайте бесплатную учетную запись сейчас или войдите в существующую учетную запись.',
			'subscriptions': 'Подписки на приложения',
			'subscribe': 'ПОДПИСАТЬСЯ',
			'subscribehint': 'Требуется подписка',
			'playsubscriptionrequiredhint': 'Вам необходимо подписаться, прежде чем вы сможете слушать или смотреть это медиа.',
			'previewsubscriptionrequiredhint': 'Вы достигли разрешенной продолжительности предварительного просмотра для этого медиафайла. Вам необходимо подписаться, чтобы продолжать слушать или смотреть это медиа.',
			'copiedtoclipboard': 'Скопировано в буфер обмена',
			'downloadbible': 'Скачать Библию',
			'downloadversion': 'Скачать',
			'downloading': 'Загрузка',
			'failedtodownload': 'Не удалось скачать',
			'pleaseclicktoretry': 'Пожалуйста, нажмите, чтобы повторить попытку.',
			'of': 'Из',
			'nobibleversionshint': 'Нет библейских данных для отображения. Нажмите кнопку ниже, чтобы загрузить хотя бы одну версию Библии.',
			'downloaded': 'Скачано',
			'enteremailaddresstoresetpassword': 'Введите адрес электронной почты, чтобы сбросить пароль',
			'backtologin': 'НАЗАД К ВХОДУ',
			'signintocontinue': 'Войдите, чтобы продолжить',
			'signin': 'С И Г Н И Н',
			'signinforanaccount': 'ЗАРЕГИСТРИРОВАТЬ СЧЕТ?',
			'alreadyhaveanaccount': 'У вас уже есть аккаунт?',
			'updateprofile': 'Обновить профиль',
			'updateprofilehint': 'Для начала обновите страницу своего профиля, это поможет нам связать вас с другими людьми.',
			'autoplayvideos': 'Автовоспроизведение видео',
			'gosocial': 'Станьте социальным',
			'searchbible': 'Поиск в Библии',
			'filtersearchoptions': 'Фильтровать параметры поиска',
			'narrowdownsearch': 'Используйте кнопку фильтра ниже, чтобы сузить поиск и получить более точный результат.',
			'searchbibleversion': 'Поиск по версии Библии',
			'searchbiblebook': 'Поиск в библейской книге',
			'search': 'Поиск',
			'setBibleBook': 'Установить Библейскую книгу',
			'oldtestament': 'Ветхий Завет',
			'newtestament': 'Новый Завет',
			'limitresults': 'Ограничить результаты',
			'setfilters': 'Установить фильтры',
			'bibletranslator': 'Переводчик Библии',
			'chapter': 'Глава',
			'verse': 'Стих',
			'translate': 'перевести',
			'bibledownloadinfo': 'Загрузка Библии началась. Пожалуйста, не закрывайте эту страницу, пока загрузка не будет завершена.',
			'received': 'получил',
			'outoftotal': 'из общего количества',
			'set': 'НАБОР',
			'selectColor': 'Выберите цвет',
			'switchbibleversion': 'Переключить версию Библии',
			'switchbiblebook': 'Переключить Библию',
			'gotosearch': 'Перейти к главе',
			'changefontsize': 'Изменить размер шрифта',
			'font': 'Шрифт',
			'readchapter': 'Читать главу',
			'showhighlightedverse': 'Показать выделенные стихи',
			'downloadmoreversions': 'Скачать больше версий',
			'suggestedusers': 'Рекомендуемые пользователи на подписку',
			'unfollow': 'Отписаться',
			'follow': 'Следовать',
			'searchforpeople': 'Поиск людей',
			'viewpost': 'Посмотреть сообщение',
			'viewprofile': 'Посмотреть профиль',
			'mypins': 'Мои пины',
			'viewpinnedposts': 'Просмотр закрепленных сообщений',
			'personal': 'Персональный',
			'update': 'Обновить',
			'phonenumber': 'Номер телефона',
			'showmyphonenumber': 'Показывать мой номер телефона пользователям',
			'dateofbirth': 'Дата рождения',
			'showmyfulldateofbirth': 'Показывать мою полную дату рождения людям, просматривающим мой статус',
			'notifications': 'Уведомления',
			'notifywhenuserfollowsme': 'Уведомлять меня, когда пользователь следует за мной',
			'notifymewhenusercommentsonmypost': 'Сообщать мне, когда пользователи комментируют мою публикацию',
			'notifymewhenuserlikesmypost': 'Сообщите мне, когда пользователям понравится мой пост',
			'churchsocial': 'Церковь Социальная',
			'shareyourthoughts': 'Поделитесь своими мыслями',
			'readmore': '...Читать далее',
			'less': 'Меньше',
			'couldnotprocess': 'Не удалось обработать запрошенное действие.',
			'pleaseselectprofilephoto': 'Пожалуйста, выберите фотографию профиля для загрузки',
			'pleaseselectprofilecover': 'Пожалуйста, выберите обложку для загрузки',
			'updateprofileerrorhint': 'Прежде чем продолжить, вам необходимо указать свое имя, дату рождения, пол, телефон и местоположение.',
			'gender': 'Пол',
			'male': 'Мужской',
			'female': 'Женский',
			'dob': 'Дата рождения',
			'location': 'Текущее местоположение',
			'qualification': 'Квалификация',
			'aboutme': 'Обо мне',
			'facebookprofilelink': 'Ссылка на профиль Facebook',
			'twitterprofilelink': 'Ссылка на профиль в Твиттере',
			'linkdln': 'Ссылка на профиль Linkedln',
			'likes': 'Нравится',
			'likess': 'Нравится(а)',
			'pinnedposts': 'Мои закрепленные сообщения',
			'unpinpost': 'Открепить публикацию',
			'unpinposthint': 'Вы хотите удалить эту публикацию из своих закрепленных публикаций?',
			'postdetails': 'Подробности публикации',
			'posts': 'Сообщения',
			'followers': 'Последователи',
			'followings': 'Подписки',
			'my': 'Мой',
			'edit': 'Редактировать',
			'delete': 'Удалить',
			'deletepost': 'Удалить сообщение',
			'deleteposthint': 'Вы хотите удалить этот пост? Сообщения по-прежнему могут появляться в лентах некоторых пользователей.',
			'maximumallowedsizehint': 'Достигнут максимально допустимый уровень загрузки файлов',
			'maximumuploadsizehint': 'Выбранный файл превышает разрешенный размер загружаемого файла.',
			'makeposterror': 'В данный момент невозможно опубликовать сообщение. Нажмите, чтобы повторить попытку.',
			'makepost': 'Сделать публикацию',
			'selectfile': 'Выберите файл',
			'images': 'Изображения',
			'shareYourThoughtsNow': 'Поделитесь своими мыслями...',
			'photoviewer': 'Просмотр фотографий',
			'nochatsavailable': 'Нет доступных разговоров \n Нажмите значок добавления под \n, чтобы выбрать пользователей для общения в чате.',
			'typing': 'Ввод...',
			'photo': 'Фото',
			'online': 'Онлайн',
			'offline': 'Оффлайн',
			'lastseen': 'Последний визит',
			'deleteselectedhint': 'Это действие приведет к удалению выбранных сообщений.  Обратите внимание, что при этом будет удалена только ваша часть разговора, \n сообщения по-прежнему будут отображаться на устройстве вашего партнера.',
			'deleteselected': 'Удалить выбранное',
			'unabletofetchconversation': 'Невозможно получить \n ваш разговор с \n.',
			'loadmoreconversation': 'Загрузить больше разговоров',
			'sendyourfirstmessage': 'Отправьте свое первое сообщение на адрес \n',
			'unblock': 'Разблокировать',
			'block': 'Блокировать',
			'writeyourmessage': 'Напишите свое сообщение...',
			'clearconversation': 'Чистый разговор',
			'clearconversationhintone': 'Это действие очистит весь ваш разговор с',
			'clearconversationhinttwo': '. \n Обратите внимание, что при этом будет удалена только ваша сторона разговора, сообщения по-прежнему будут отображаться в чате ваших партнеров.',
			'facebookloginerror': 'Что-то пошло не так в процессе входа в систему. \n, вот ошибка, которую нам дал Facebook',
			'mylibrary': 'Моя библиотека',
			'prayer_request': 'Молитвенная просьба или свидетельство',
			'mySubscription': 'Моя подписка',
			'giveandpart': 'Дарение и партнерство',
			'follow_us': 'Следуйте за нами',
			'profile': 'Профиль',
			'no_phone': 'Нет телефона',
			'no_address': 'Нет адреса',
			'changepwd': 'Изменить пароль',
			'help_support': 'Помощь и поддержка',
			'quest_logout': 'Вы хотите выйти из приложения?',
			'no': 'Нет',
			'yes': 'ДА',
			'enjoy_using': 'Наслаждайтесь использованием',
			'tap_rate': 'Нажмите звездочку, оцените его в App Store.',
			'please_rate': 'Пожалуйста, введите свой рейтинг',
			'submit': 'отправить',
			'select_email': 'Выберите почтовое приложение для создания',
			'open_mail': 'Открыть почтовое приложение',
			'no_mailer': 'Почтовые приложения не установлены',
			'login_request': 'Войдите, чтобы просмотреть запрос',
			'empty': 'Пустой',
			'send_prayer': 'Товар не найден \n Отправить новую молитвенную просьбу или свидетельство',
			'podcast': 'Подкаст',
			'new_prayer_req': 'Новая молитвенная просьба или свидетельство',
			'read_more': 'ЧИТАТЬ ДАЛЬШЕ',
			'details': 'Подробности',
			'added_bookmark': 'Добавлено в закладки',
			'removed_bookmark': 'Удалено из закладки',
			'delete_account': 'Удалить аккаунт',
			'appDescriptionSupport': 'Ваше партнерство посредством пожертвований глобальным миссиям Lighthouse позволяет нам добиться большего в исполнении Божьего призыва и нести Его слово, меняющее жизнь, и чудотворную силу Святого Духа по всему миру. И каждая ваша жертва будет щедро вознаграждена и дополнена умножением от Господа, как Он и гарантировал Своим словом (Ссылки на Священные Писания: Марка 10:29-30, Луки 6:38).',
			'giving_via_paypal': 'Отдача через PayPal',
			'click_to_give': 'Нажмите, чтобы дать',
			'additional_giving': 'Дополнительные возможности дарения',
			'email': 'Электронная почта',
			'aboutcontent_para_1': 'Глобальные миссии Lighthouse исполняют Божий призыв нести Свет Иисуса Христа народам. Ваше молитвенное занятие «Ежедневный свет» — это один из способов, с помощью которого мы выполняем этот призыв донести Евангелие Иисуса Христа и просветляющее слово Божье до людей по всему миру. Этот молитвенный час ежедневно приносит людям слово Божье для победоносной и полноценной жизни во Христе, позволяя им возрастать в познании Бога, ходить в силе Святого Духа, открывать свою жизненную цель и выполнять Божий призыв к своей жизни.',
			'aboutcontent_para_2': 'Мы рады, что вы присоединились к приложению Your Daily Light, предоставляющему вам бесплатный доступ к ежедневной порции Слова Божьего для вашего питания и духовного развития. Мы также призываем вас поделиться влиянием этого молитвенного письма на вашу жизнь, пригласить других загрузить приложение и внести свой вклад в то, чтобы помочь нам привлечь больше людей во славу Божью. Нажмите кнопку «Поделиться» в приложении и предложите другим загрузить приложение сегодня.',
			'aboutcontent_para_3': 'В главном разделе приложения вы также найдете сезонные пророческие послания о том, что говорит Бог, будете в курсе событий служения, прочитаете свидетельства из реальной жизни и откроете для себя возможности стать частью того, что делает Бог через глобальные миссии Lighthouse.',
			'aboutcontent_para_4': 'Вы также можете поделиться своими свидетельствами и подать молитвенные просьбы, используя раздел «Свидетельства и молитвы». Мы будем рады прочитать о влиянии Вашего ежедневного света на вашу жизнь и помолиться вместе с вами в тех областях, где вы нуждаетесь. Во встроенном книжном магазине вы можете напрямую найти и получить соответствующие материалы, которые ускорят ваш рост.',
			'aboutcontent_para_5': 'Ваше приложение Daily Light стало бесплатным и доступным для глобальной аудитории только благодаря щедрости таких людей, как вы, благодаря финансовому партнерству. У нас также есть много других направлений служения, где каждый дар имеет значение. Вы тоже можете присоединиться к этой миссии, пожертвовав деньги этому служению. И Бог, гарантирующий вознаграждение за каждую жертву ради Своей цели, щедро вознаградит вас умножением вашего дара и разнообразными благословениями. Ваше пожертвование изменит жизнь многих людей. Используйте раздел «Пожертвования и партнерство», чтобы узнать, как сделать пожертвование.',
			'aboutcontent_para_6a': 'Узнайте больше о глобальных миссиях Lighthouse на сайте',
			'aboutcontent_para_6b': 'или',
			'aboutcontent_para_7a': 'Подпишитесь на нашу рассылку по адресу',
			'aboutcontent_para_7b': 'чтобы оставаться в курсе и участвовать в том, что совершает Бог.',
			'aboutcontent_para_8a': 'Вы также можете связаться с пастором Саймоном по адресу:',
			'apptagline': 'Благочестивое приложение для ежедневного просветления и духовного роста',
			'seebankdetails': 'Посмотреть детали банковского перевода',
			'via_bank': 'через банк',
			'bank_details': 'Детали банковского перевода',
			'account_name': 'Имя учетной записи',
			'bank': 'Банк',
			'iban': 'IBAN',
			'myProfile': 'Мой профиль',
		};
	}
}

extension on _StringsZh {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'appname': 'Your Daily Light',
			'appname_label': 'Your Daily Light',
			'selectlanguage': '选择语言',
			'chooseapplanguage': '选择应用程序语言',
			'nightmode': '夜间模式',
			'initializingapp': '正在初始化...',
			'home': '首页',
			'branches': '分支机构',
			'inbox': '收件箱',
			'downloads': '下载',
			'settings': '设置',
			'events': '活动',
			'myplaylists': '我的播放列表',
			'website': '网站',
			'hymns': '赞美诗',
			'articles': '文章',
			'notes': '注释',
			'donate': '捐赠',
			'savenotetitle': '注释标题',
			'nonotesfound': '没有找到注释',
			'newnote': '新',
			'deletenote': '删除注释',
			'deletenotehint': '您想删除此注释吗？此操作无法撤消。',
			'bookmarks': '书签',
			'socialplatforms': '社交平台',
			'onboardingpagetitles.0': '您的日常照明',
			'onboardingpagetitles.1': '创建帐户',
			'onboardingpagetitles.2': '分享',
			'onboardingpagetitles.3': '及时了解最新动态',
			'onboardingpagehints.0': '通过灵修和播客从上帝的话语中寻找每日的启发',
			'onboardingpagehints.1': '访问鼓舞人心的内容，建立您的个人图书馆，并将上帝的话语带到任何地方',
			'onboardingpagehints.2': '分享或阅读来自世界各地的鼓舞人心的见证。分享祈祷请求并寻求及时的支持',
			'onboardingpagehints.3': '了解上帝对这个季节的看法，及时了解最新事件并寻找加入运动的方法',
			'next': '下一个',
			'done': '开始使用',
			'quitapp': '退出应用程序！',
			'quitappwarning': '您想关闭该应用程序吗？',
			'quitappaudiowarning': '您当前正在播放音频，退出应用程序将停止音频播放。如果您不想停止播放，只需使用中心按钮最小化应用程序或单击“确定”按钮立即退出应用程序。',
			'ok': '好的',
			'retry': '重试',
			'oops': '哎呀！',
			'save': '保存',
			'cancel': '取消',
			'error': '错误',
			'success': '成功',
			'skip': '跳过',
			'skiplogin': '跳过登录',
			'skipregister': '跳过注册',
			'dataloaderror': '目前无法加载请求的数据，请检查您的数据连接并单击重试。',
			'suggestedforyou': '为您推荐',
			'videomessages': '视频留言',
			'audiomessages': '音频消息',
			'devotionals': '灵修',
			'categories': '类别',
			'category': '类别',
			'videos': '视频',
			'audios': '音频',
			'biblebooks': '圣经',
			'audiobible': '音频圣经',
			'livestreams': '直播',
			'radio': '收音机',
			'allitems': '所有项目',
			'emptyplaylist': '没有播放列表',
			'notsupported': '不支持',
			'cleanupresources': '清理资源',
			'grantstoragepermission': '请授予访问存储权限才能继续',
			'sharefiletitle': '观看或收听',
			'sharefilebody': '通过您的 Daily Light 应用程序，立即下载：',
			'sharetext': '享受无限的音频和视频流',
			'sharetexthint': '加入视频和音频流平台，让您观看和收听来自世界各地的数百万个文件。立即下载',
			'download': '下载',
			'addplaylist': '添加到播放列表',
			'bookmark': '书签',
			'unbookmark': '取消书签',
			'share': '分享',
			'deletemedia': '删除文件',
			'deletemediahint': '您想删除这个下载的文件吗？此操作无法撤消。',
			'searchhint': '搜索音频和视频消息',
			'performingsearch': '搜索音频和视频',
			'nosearchresult': '没有找到结果',
			'nosearchresulthint': '尝试输入更通用的关键字',
			'addtoplaylist': '添加到播放列表',
			'newplaylist': '新播放列表',
			'playlistitm': '播放列表',
			'mediaaddedtoplaylist': '媒体已添加到播放列表。',
			'mediaremovedfromplaylist': '媒体已从播放列表中删除',
			'clearplaylistmedias': '清除所有媒体',
			'deletePlayList': '删除播放列表',
			'clearplaylistmediashint': '继续从该播放列表中删除所有媒体吗？',
			'deletePlayListhint': '继续删除此播放列表并清除所有媒体吗？',
			'comments': '评论',
			'replies': '回复',
			'reply': '回复',
			'logintoaddcomment': '登录以添加评论',
			'logintoreply': '登录后回复',
			'writeamessage': '写留言...',
			'nocomments': '未找到评论 \n 点击重试',
			'errormakingcomments': '目前无法处理评论..',
			'errordeletingcomments': '暂时无法删除此评论..',
			'erroreditingcomments': '目前无法编辑此评论..',
			'errorloadingmorecomments': '目前无法加载更多评论..',
			'deletingcomment': '删除评论',
			'editingcomment': '编辑评论',
			'deletecommentalert': '删除评论',
			'editcommentalert': '编辑评论',
			'deletecommentalerttext': '您想删除这条评论吗？此操作无法撤消',
			'loadmore': '加载更多',
			'messages': '留言',
			'guestuser': '访客用户',
			'fullname': '全名',
			'emailaddress': '电子邮件地址',
			'password': '密码',
			'repeatpassword': '重复密码',
			'register': '注册',
			'login': '登录',
			'logout': '退出',
			'logoutfromapp': '从应用程序注销？',
			'logoutfromapphint': '如果您未登录，您将无法对文章和视频进行点赞或评论。',
			'gotologin': '前往登录',
			'resetpassword': '重置密码',
			'logintoaccount': '已经有帐户？登录',
			'emptyfielderrorhint': '您需要填写所有字段',
			'invalidemailerrorhint': '您需要输入有效的电子邮件地址',
			'passwordsdontmatch': '密码不匹配',
			'processingpleasewait': '处理中，请稍候...',
			'createaccount': '创建帐户',
			'forgotpassword': '忘记密码？',
			'orloginwith': '或登录',
			'facebook': '脸书',
			'google': '谷歌',
			'moreoptions': '更多选择',
			'about': '关于我们',
			'privacy': '隐私政策',
			'terms': '应用条款',
			'rate': '评价应用程序',
			'version': '版本',
			'pulluploadmore': '拉起负载',
			'loadfailedretry': '加载失败！点击重试！',
			'releaseloadmore': '释放以加载更多',
			'nomoredata': '没有更多数据',
			'errorReportingComment': '错误报告评论',
			'reportingComment': '举报评论',
			'reportcomment': '报告选项',
			'reportCommentsList.0': '不需要的商业内容或垃圾邮件',
			'reportCommentsList.1': '色情或露骨的性内容',
			'reportCommentsList.2': '仇恨言论或暴力画面',
			'reportCommentsList.3': '骚扰或欺凌',
			'bookmarksMedia': '我的书签',
			'noitemstodisplay': '没有可显示的项目',
			'loginrequired': '需要登录',
			'loginrequiredhint': '要在此平台上订阅，您需要登录。立即创建免费帐户或登录您现有的帐户。',
			'subscriptions': '应用程序订阅',
			'subscribe': '订阅',
			'subscribehint': '需要订阅',
			'playsubscriptionrequiredhint': '您需要先订阅才能收听或观看此媒体。',
			'previewsubscriptionrequiredhint': '您已达到该媒体允许的预览持续时间。您需要订阅才能继续收听或观看此媒体。',
			'copiedtoclipboard': '已复制到剪贴板',
			'downloadbible': '下载圣经',
			'downloadversion': '下载',
			'downloading': '正在下载',
			'failedtodownload': '下载失败',
			'pleaseclicktoretry': '请点击重试。',
			'of': '的',
			'nobibleversionshint': '没有可显示的圣经数据，请点击下面的按钮下载至少一个圣经版本。',
			'downloaded': '已下载',
			'enteremailaddresstoresetpassword': '输入您的电子邮件以重置密码',
			'backtologin': '返回登录',
			'signintocontinue': '登录以继续',
			'signin': '登录',
			'signinforanaccount': '注册帐户？',
			'alreadyhaveanaccount': '已经有帐户？',
			'updateprofile': '更新个人资料',
			'updateprofilehint': '首先，请更新您的个人资料页面，这将帮助我们将您与其他人联系起来',
			'autoplayvideos': '自动播放视频',
			'gosocial': '走向社交',
			'searchbible': '搜索圣经',
			'filtersearchoptions': '过滤搜索选项',
			'narrowdownsearch': '使用下面的过滤按钮缩小搜索范围以获得更精确的结果。',
			'searchbibleversion': '搜寻圣经版本',
			'searchbiblebook': '搜索圣经书',
			'search': '搜索',
			'setBibleBook': '圣经书集',
			'oldtestament': '旧约',
			'newtestament': '新约',
			'limitresults': '限制结果',
			'setfilters': '设置过滤器',
			'bibletranslator': '圣经翻译',
			'chapter': '章',
			'verse': '诗歌',
			'translate': '翻译',
			'bibledownloadinfo': '圣经下载已开始，下载完成之前请不要关闭此页面。',
			'received': '收到',
			'outoftotal': '总计中',
			'set': '设定',
			'selectColor': '选择颜色',
			'switchbibleversion': '切换圣经版本',
			'switchbiblebook': '切换圣经书',
			'gotosearch': '前往章节',
			'changefontsize': '更改字体大小',
			'font': '字体',
			'readchapter': '阅读章节',
			'showhighlightedverse': '显示突出显示的经文',
			'downloadmoreversions': '下载更多版本',
			'suggestedusers': '建议用户关注',
			'unfollow': '取消关注',
			'follow': '关注',
			'searchforpeople': '寻找人',
			'viewpost': '查看帖子',
			'viewprofile': '查看资料',
			'mypins': '我的图钉',
			'viewpinnedposts': '查看固定帖子',
			'personal': '个人',
			'update': '更新',
			'phonenumber': '电话号码',
			'showmyphonenumber': '向用户显示我的电话号码',
			'dateofbirth': '出生日期',
			'showmyfulldateofbirth': '向查看我状态的人显示我的完整出生日期',
			'notifications': '通知',
			'notifywhenuserfollowsme': '当用户关注我时通知我',
			'notifymewhenusercommentsonmypost': '当用户评论我的帖子时通知我',
			'notifymewhenuserlikesmypost': '当用户喜欢我的帖子时通知我',
			'churchsocial': '教会社交',
			'shareyourthoughts': '分享您的想法',
			'readmore': '...阅读更多',
			'less': '少',
			'couldnotprocess': '无法处理请求的操作。',
			'pleaseselectprofilephoto': '请选择要上传的个人资料照片',
			'pleaseselectprofilecover': '请选择要上传的封面照片',
			'updateprofileerrorhint': '您需要填写您的姓名、出生日期、性别、电话和位置，然后才能继续。',
			'gender': '性别',
			'male': '男',
			'female': '女',
			'dob': '出生日期',
			'location': '当前位置',
			'qualification': '资质',
			'aboutme': '关于我',
			'facebookprofilelink': 'Facebook 个人资料链接',
			'twitterprofilelink': '推特个人资料链接',
			'linkdln': 'LinkedIn 个人资料链接',
			'likes': '喜欢',
			'likess': '喜欢',
			'pinnedposts': '我的固定帖子',
			'unpinpost': '取消固定帖子',
			'unpinposthint': '您想从您的固定帖子中删除此帖子吗？',
			'postdetails': '帖子详情',
			'posts': '帖子',
			'followers': '追随者',
			'followings': '关注者',
			'my': '我的',
			'edit': '编辑',
			'delete': '删除',
			'deletepost': '删除帖子',
			'deleteposthint': '您想删除此帖子吗？帖子仍然可以出现在某些用户的源上。',
			'maximumallowedsizehint': '已达到允许的最大文件上传数',
			'maximumuploadsizehint': '所选文件超出了允许的上传文件大小限制。',
			'makeposterror': '暂时无法发帖，请点击重试。',
			'makepost': '发帖',
			'selectfile': '选择文件',
			'images': '图片',
			'shareYourThoughtsNow': '分享您的想法...',
			'photoviewer': '照片浏览器',
			'nochatsavailable': '没有可用的对话 \n 单击 \n 下面的添加图标以选择与之聊天的用户',
			'typing': '正在打字...',
			'photo': '照片',
			'online': '在线',
			'offline': '离线',
			'lastseen': '最后出现',
			'deleteselectedhint': '此操作将删除选定的消息。  请注意，这只会删除您这边的对话，\n 消息仍会显示在您合作伙伴的设备上。',
			'deleteselected': '删除所选内容',
			'unabletofetchconversation': '无法获取 \n 您与 \n 的对话',
			'loadmoreconversation': '加载更多对话',
			'sendyourfirstmessage': '将您的第一条消息发送至 \n',
			'unblock': '解锁',
			'block': '块',
			'writeyourmessage': '写下您的留言...',
			'clearconversation': '清晰的对话',
			'clearconversationhintone': '此操作将清除您与',
			'clearconversationhinttwo': '。 \n 请注意，这只会删除您这边的对话，消息仍会显示在您的合作伙伴聊天中。',
			'facebookloginerror': '登录过程出现问题。 \n ，这是 Facebook 给我们的错误',
			'mylibrary': '我的图书馆',
			'prayer_request': '祷告请求或见证',
			'mySubscription': '我的订阅',
			'giveandpart': '捐赠与伙伴关系',
			'follow_us': '关注我们',
			'profile': '公司简介',
			'no_phone': '没有电话',
			'no_address': '无地址',
			'changepwd': '更改密码',
			'help_support': '帮助与支持',
			'quest_logout': '您想从应用程序中退出吗？',
			'no': '否',
			'yes': '是的',
			'enjoy_using': '享受使用',
			'tap_rate': '在 App Store 上点击星级',
			'please_rate': '请输入您的评分',
			'submit': '提交',
			'select_email': '选择要撰写的电子邮件应用程序',
			'open_mail': '打开邮件应用程序',
			'no_mailer': '未安装邮件应用程序',
			'login_request': '登录查看请求',
			'empty': '空',
			'send_prayer': '未找到任何物品 \n 发送新的祷告请求或见证',
			'podcast': '播客',
			'new_prayer_req': '新的祷告请求或见证',
			'read_more': '了解更多',
			'details': '详情',
			'added_bookmark': '已添加至书签',
			'removed_bookmark': '已从书签中删除',
			'delete_account': '删除帐户',
			'appDescriptionSupport': '您通过对灯塔全球宣教的捐助而建立的伙伴关系，使我们能够在履行上帝的召唤方面取得更多成就，将他改变生命的话语和圣灵的奇迹工作力量带到世界各地。你的每一次牺牲都会得到主的丰盛回报和倍增，正如他所保证的那样（经文参考：马可福音10：29-30，路加福音6：38）。',
			'giving_via_paypal': '通过 PayPal 捐赠',
			'click_to_give': '点击给予',
			'additional_giving': '额外的捐赠选项',
			'email': '电子邮件',
			'aboutcontent_para_1': '灯塔全球宣教正在履行上帝的召唤，将耶稣基督的光带给各国。您的每日光明灵修是我们履行这一号召的方式之一，将耶稣基督的福音和上帝的启发性话语带给全球各地的人们。这种灵修每天将神的话语带给个人，让他们在基督里过得胜和充实的生活，使他们能够在神的知识上成长，行在圣灵的能力中，发现他们的人生目的，并实现神对他们生命的呼召。',
			'aboutcontent_para_2': '我们很高兴您使用“每日之光”应用程序，让您免费获得每日神的话语，以获取滋养和灵性发展。我们还鼓励您分享这种灵修对您生活的影响，邀请其他人下载该应用程序，并为帮助我们接触更多人以荣耀上帝而做出贡献。立即点击应用程序中的共享按钮并邀请其他人下载该应用程序。',
			'aboutcontent_para_3': '在应用程序主页部分，您还可以找到上帝所说的季节性预言信息，随时了解事工活动的最新动态，阅读现实生活中的见证，并发现机会参与上帝通过灯塔全球宣教所做的事情。',
			'aboutcontent_para_4': '您还可以使用见证和祈祷部分分享您的见证并提交祈祷请求。我们将很高兴了解您每日之光对您生活的影响，并在您需要的领域与您一起祈祷。从内置的书店，你可以直接找到并获取相关材料，加速你的成长。',
			'aboutcontent_para_5': '只有像您这样的个人通过财务合作伙伴慷慨解囊，您的 Daily Light 应用程序才能免费向全球受众开放。我们还有许多其他的事工途径，每项恩赐都会发挥作用。你也可以通过向这个事工捐款来加入这个使命。上帝保证会奖赏为他的目的所做的每一次牺牲，他会丰富地奖赏你，使你的恩赐成倍增加，并获得不同的祝福。您的奉献将会改变许多人的生活。使用“捐赠和合作伙伴关系”部分查看捐赠方式。',
			'aboutcontent_para_6a': '了解有关灯塔全球使命的更多信息：',
			'aboutcontent_para_6b': '或者',
			'aboutcontent_para_7a': '订阅我们的时事通讯：',
			'aboutcontent_para_7b': '保持更新并参与上帝正在成就的事情。',
			'aboutcontent_para_8a': '您也可以通过以下方式与西蒙牧师联系：',
			'apptagline': '用于日常照明和精神成长的虔诚应用程序',
			'seebankdetails': '查看银行转账详情',
			'via_bank': '通过银行',
			'bank_details': '银行转账详情',
			'account_name': '帐户名称',
			'bank': '银行',
			'iban': '国际银行账号',
			'myProfile': '我的个人资料',
		};
	}
}
