import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yourdailylight/models/Bible.dart';
import 'package:yourdailylight/models/Categories.dart';
import 'package:yourdailylight/models/ChatMessages.dart';
import 'package:yourdailylight/models/Downloads.dart';
import 'package:yourdailylight/models/Events.dart';
import 'package:yourdailylight/models/Hymns.dart';
import 'package:yourdailylight/models/Inbox.dart';
import 'package:yourdailylight/models/Notes.dart';
import 'package:yourdailylight/models/Playlists.dart';
import 'package:yourdailylight/models/UserPosts.dart';
import 'package:yourdailylight/screens/thechurch/my_main_home_page.dart';

import './models/Userdata.dart';
import './database/SQLiteDbProvider.dart';
import './chat/ChatConversations.dart';
import './models/LiveStreams.dart';
import './socials/UserdataPosts.dart';
import './socials/PostRepliesScreen.dart';
import './screens/BibleTranslator.dart';
import './screens/AudioScreen.dart';
import 'package:flutter/material.dart';
import './screens/BibleScreen.dart';
import './i18n/strings.g.dart';
import './chat/photoviewer.dart';
import 'socials/FollowPeople.dart';
import 'package:provider/provider.dart';
import './screens/HomePage.dart';
import './utils/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import './screens/PlaylistsScreen.dart';
import './screens/BookmarkScreen.dart';
import './socials/MakePostScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import './socials/UserProfileScreen.dart';
import 'providers/ChatManager.dart';
import './providers/AudioPlayerModel.dart';
import './screens/BibleVersionsScreen.dart';
import './screens/HymnsViewerScreen.dart';
import 'socials/UpdateUserProfile.dart';
import './socials/PostCommentsScreen.dart';
import './socials/likesPostPeople.dart';
import './socials/PinnedPosts.dart';
import './screens/BibleSearchScreen.dart';
import './screens/InboxListScreen.dart';
import './screens/BibleVerseCompare.dart';
import './screens/CategoriesScreen.dart';
import './screens/EventsViewerScreen.dart';
import './screens/InboxViewerScreen.dart';
import './socials/SocialActivity.dart';
import './screens/HymnsListScreen.dart';
import './screens/BookmarkedHymnsListScreen.dart';
import './providers/AppStateManager.dart';
import './screens/AddPlaylistScreen.dart';
import './screens/PlaylistMediaScreen.dart';
import './screens/ColoredHighightedVerses.dart';
import './screens/SearchScreen.dart';
import './screens/CategoriesMediaScreen.dart';
import './screens/SubscriptionScreen.dart';
import './chat/SelectChatPeople.dart';
import './screens/BranchesScreen.dart';
import './screens/EventsListScreen.dart';
import './screens/DevotionalScreen.dart';
import './audio_player/player_page.dart';
import './video_player/VideoPlayer.dart';
import './livetvplayer/LivestreamsPlayer.dart';
import './models/CommentsArguement.dart';
import './comments/CommentsScreen.dart';
import './comments/RepliesScreen.dart';
import './screens/Downloader.dart';
import './auth/LoginScreen.dart';
import './audio_player/radio_player.dart';
import './auth/RegisterScreen.dart';
import './screens/VideoScreen.dart';
import './auth/ForgotPasswordScreen.dart';
import './models/ScreenArguements.dart';
import './socials/UserFollowersScreen.dart';
import './service/Firebase.dart';
import './models/Media.dart';
import './providers/events.dart';
import './models/UserEvents.dart';
import './screens/AppTermsScreen.dart';
import './screens/AboutUsScreen.dart';

class MyApp extends StatefulWidget {
   GlobalKey<NavigatorState>?  navKey;
   MyApp({
    Key? key,
    required  GlobalKey<NavigatorState> navKey ,
    required Widget? defaultHome,
  })  : _defaultHome = defaultHome,
        super(key: key);
  final Widget? _defaultHome;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late AppStateManager appStateManager;
  AppLifecycleState? state;
  bool isChatOpen = false;
 var navigatorKey = null;
 // final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");


  navigateMedia(Media media) {
    print("push notification media = " + media.title!);
    List<Media?> mediaList = [];
    mediaList.add(media);
    if (media.mediaType!.toLowerCase() == "audio") {
      print("audio media = " + media.title!);
      Provider.of<AudioPlayerModel>(context, listen: false)
          .preparePlaylist(mediaList, media);
      navigatorKey.currentState!.pushNamed(PlayPage.routeName);
    } else {
      print("video media = " + media.title!);

      navigatorKey.currentState!.pushNamed(VideoPlayer.routeName,
          arguments: ScreenArguements(
            position: 0,
            items: media,
            itemsList: mediaList,
          ));
    }
  }

  navigateLivestreams(LiveStreams liveStreams) {
    navigatorKey.currentState!.pushNamed(LivestreamsPlayer.routeName,
        arguments: ScreenArguements(
          items: liveStreams,
        ));
  }

  navigateInbox(Inbox inbox) {
    //navigatorKey.currentState.pushNamed(InboxListScreenState.routeName);
    navigatorKey.currentState!.pushNamed(InboxViewerScreen.routeName,
        arguments: ScreenArguements(
          position: 0,
          items: inbox,
          itemsList: [],
        ));
  }



  navigateSocials() {
    navigatorKey.currentState!.pushNamed(SocialActivity.routeName);
  }

  navigateChat(Userdata partner) async {
    Userdata? userdata = await SQLiteDbProvider.db.getUserData();
    if (userdata == null) {
      navigatorKey.currentState!.pushNamed(LoginScreen.routeName);
      //eventBus.fire(AppEvents.ONCHATCONVERSATIONCLOSED);
    } else {
      if (isChatOpen) {
        navigatorKey.currentState!.pop();
      }
      eventBus.fire(StartPartnerChatEvent(partner));
      navigatorKey.currentState!.pushNamed(ChatConversations.routeName);
      //navigatorKey.currentState
      //  .popUntil(ModalRoute.withName(Home.routeName));
      //navigatorKey.currentState.pushNamed(ChatConversations.routeName);
      /*if (isChatOpen) {
        navigatorKey.currentState.popAndPushNamed(ChatConversations.routeName);
      } else {
        navigatorKey.currentState.pushNamed(ChatConversations.routeName);
      }*/
    }
  }

  @override
  void initState() {
    navigatorKey = widget.navKey ??  GlobalKey(debugLabel: "Main Navigator");
    Firebase(
      navigateMedia,
      navigateSocials,
      navigateInbox,
      navigateLivestreams,
      navigateChat,
    ).init();
    Provider.of<ChatManager>(context, listen: false).init();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    eventBus.fire(OnAppStateChanged("active"));
    eventBus.on<OnChatOpen>().listen((event) {
      isChatOpen = event.isOpen;
    });
    eventBus.on<OnAppOffline>().listen((event) {
      print("App offline event called");
      print("please store = " + event.items.toString());
    });
    initialization();
  }



void initialization() async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because
  // delaying the user experience is a bad design practice!
  // ignore_for_file: avoid_print
  print('ready in 3...');
  await Future.delayed(const Duration(seconds: 1));
  print('go!');
  FlutterNativeSplash.remove();
}

  void dispose() {
    print("widget is disposed");
    WidgetsBinding.instance.removeObserver(this);
    //Provider.of<AudioPlayerModel>(context, listen: false).cleanUpResources();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) async {
    state = appLifecycleState;
    print("Current app state = " + appLifecycleState.toString());
    print(":::::::");
    switch (state) {
      case null:
        break;
      case AppLifecycleState.paused:
        eventBus.fire(OnAppStateChanged("idle"));
        break;
      case AppLifecycleState.resumed:
        eventBus.fire(OnAppStateChanged("active"));
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
  }

  @override
  Widget build(BuildContext context) {
    appStateManager = Provider.of<AppStateManager>(context);
    final platform = Theme.of(context).platform;
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(),
      footerBuilder: () => ClassicFooter(),
      enableLoadingWhenNoData: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      //autoLoad: true,
      child: MaterialApp(
        theme: appStateManager.themeData,
        navigatorKey: navigatorKey,
        title: 'App',
        home: appStateManager.isLoadingTheme
            ? Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/landing.png"),
              fit: BoxFit.cover,
            ),
          ),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(height: 10),
                        Text(t.appname,
                            style: TextStyles.medium(context).copyWith(
                                fontFamily: "serif",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                        Container(height: 12),
                        Text(t.initializingapp,
                            style: TextStyles.body1(context)
                                .copyWith(color: Colors.grey[500])),
                        Container(height: 50),
                        CupertinoActivityIndicator(
                          radius: 20,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : widget._defaultHome,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == AddPlaylistScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return AddPlaylistScreen(
                  media: args!.items as Media?,
                );
              },
            );
          }

          if (settings.name == PlaylistMediaScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return PlaylistMediaScreen(
                  playlists: args!.items as Playlists?,
                );
              },
            );
          }

          if (settings.name == CategoriesMediaScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return CategoriesMediaScreen(
                  categories: args!.items as Categories?,
                );
              },
            );
          }

          if (settings.name == VideoPlayer.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return VideoPlayer(
                  media: args!.items as Media?,
                  mediaList: args.itemsList as List<Media?>?,
                );
              },
            );
          }

          if (settings.name == BibleVerseCompare.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return BibleVerseCompare(
                  bible: args!.items as Bible?,
                );
              },
            );
          }

          if (settings.name == FollowPeople.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return FollowPeople(check: args!.check);
              },
            );
          }

          if (settings.name == UserProfileScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return UserProfileScreen(
                  user: args!.items as Userdata?,
                );
              },
            );
          }

          if (settings.name == BibleTranslator.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return BibleTranslator(
                  bible: args!.items as Bible?,
                );
              },
            );
          }

          if (settings.name == HymnsViewerScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return HymnsViewerScreen(
                  hymns: args!.items as Hymns?,
                );
              },
            );
          }

          if (settings.name == LivestreamsPlayer.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return LivestreamsPlayer(
                    liveStreams: args!.items as LiveStreams?);
              },
            );
          }

          if (settings.name == CategoriesScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return CategoriesScreen();
              },
            );
          }

          if (settings.name == PinnedPosts.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return PinnedPosts();
              },
            );
          }

          if (settings.name == SocialActivity.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SocialActivity();
              },
            );
          }

          if (settings.name == ColoredHighightedVerses.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return ColoredHighightedVerses();
              },
            );
          }

          if (settings.name == BibleSearchScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BibleSearchScreen();
              },
            );
          }

          if (settings.name == BookmarksScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BookmarksScreen();
              },
            );
          }

          if (settings.name == PlaylistsScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return PlaylistsScreen();
              },
            );
          }

          if (settings.name == BranchesScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BranchesScreen();
              },
            );
          }

          if (settings.name == EventsListScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return EventsListScreen();
              },
            );
          }

          if (settings.name == InboxListScreenState.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return InboxListScreenState();
              },
            );
          }

          if (settings.name == BookmarkedHymnsListScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BookmarkedHymnsListScreen();
              },
            );
          }

          if (settings.name == BibleScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BibleScreen();
              },
            );
          }

          if (settings.name == UpdateUserProfile.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return UpdateUserProfile(
                  check: args == null ? true : false,
                );
              },
            );
          }

          if (settings.name == UserFollowersScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return UserFollowersScreen(
                  user: args!.items as Userdata?,
                  option: args.option,
                );
              },
            );
          }

          if (settings.name == PhotoViewer.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return PhotoViewer(
                  chatMessages: args!.items as ChatMessages?,
                );
              },
            );
          }

          if (settings.name == UserdataPosts.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return UserdataPosts(
                  user: args!.items as Userdata?,
                );
              },
            );
          }

          if (settings.name == EventsViewerScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return EventsViewerScreen(
                  events: args!.items as Events?,
                );
              },
            );
          }

          if (settings.name == InboxViewerScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return InboxViewerScreen(
                  inbox: args!.items as Inbox?,
                );
              },
            );
          }

          if (settings.name == HymnsListScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return HymnsListScreen();
              },
            );
          }

          if (settings.name == SelectChatPeople.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SelectChatPeople();
              },
            );
          }

          if (settings.name == ChatConversations.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return ChatConversations();
              },
            );
          }

          if (settings.name == MakePostScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return MakePostScreen();
              },
            );
          }

          if (settings.name == BibleVersionsScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BibleVersionsScreen();
              },
            );
          }

          if (settings.name == DevotionalScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return DevotionalScreen();
              },
            );
          }

          if (settings.name == VideoScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return VideoScreen();
              },
            );
          }

          if (settings.name == AudioScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return AudioScreen();
              },
            );
          }

          if (settings.name == LikesPostPeople.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return LikesPostPeople(userPost: args!.items as UserPosts?);
              },
            );
          }


          if (settings.name == SearchScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SearchScreen();
              },
            );
          }

          if (settings.name == CommentsScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final CommentsArguement? args =
                settings.arguments as CommentsArguement?;
            return MaterialPageRoute(
              builder: (context) {
                return CommentsScreen(
                  item: args!.item as Media?,
                  commentCount: args.commentCount,
                );
              },
            );
          }

          if (settings.name == RepliesScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final CommentsArguement? args =
                settings.arguments as CommentsArguement?;
            return MaterialPageRoute(
              builder: (context) {
                return RepliesScreen(
                  item: args!.item,
                  repliesCount: args.commentCount,
                );
              },
            );
          }

          if (settings.name == PostCommentsScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final CommentsArguement? args =
                settings.arguments as CommentsArguement?;
            return MaterialPageRoute(
              builder: (context) {
                return PostCommentsScreen(
                  userPosts: args!.item as UserPosts?,
                );
              },
            );
          }

          if (settings.name == PostRepliesScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final CommentsArguement? args =
                settings.arguments as CommentsArguement?;
            return MaterialPageRoute(
              builder: (context) {
                return PostRepliesScreen(
                  item: args!.item,
                  repliesCount: args.commentCount,
                );
              },
            );
          }

          if (settings.name == LoginScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            );
          }

          if (settings.name == RegisterScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return RegisterScreen();
              },
            );
          }

          if (settings.name == ForgotPasswordScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return ForgotPasswordScreen();
              },
            );
          }

          if (settings.name == PlayPage.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return PlayPage();
              },
            );
          }

          if (settings.name == RadioPlayer.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return RadioPlayer();
              },
            );
          }

          if (settings.name == Downloader.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return Downloader(
                    downloads: args!.items as Downloads?, platform: platform);
              },
            );
          }

          if (settings.name == SubscriptionScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SubscriptionScreen();
              },
            );
          }

          if (settings.name == MyMainHomePage.routeName) {
            // Handle navigation arguments for MyMainHomePage
            final int? initialPageIndex = settings.arguments as int?;
            return MaterialPageRoute(
              builder: (context) {
                return MyMainHomePage(initialPageIndex: initialPageIndex ?? 0);
              },
            );
          }

          if (settings.name == '/appterms') {
            return MaterialPageRoute(
              builder: (context) {
                return AppTermsScreen();
              },
            );
          }

          if (settings.name == '/aboutus') {
            return MaterialPageRoute(
              builder: (context) {
                return AboutUsScreen();
              },
            );
          }

          return MaterialPageRoute(
            builder: (context) {
              return MyMainHomePage();
              //return HomePage();
            },
          );
        },
      ),
    );
  }
}
