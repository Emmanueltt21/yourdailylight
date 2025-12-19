import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/service/NotificationManager.dart';
import 'package:yourdailylight/utils/GlobalKeys.dart';
import 'package:yourdailylight/screens/thechurch/my_main_home_page.dart';
import 'package:yourdailylight/models/ScreenArguements.dart';
import 'package:yourdailylight/models/Media.dart';
import 'package:yourdailylight/models/LiveStreams.dart';
import 'package:yourdailylight/models/Inbox.dart';
import 'package:yourdailylight/models/Userdata.dart';
import 'package:yourdailylight/models/UserEvents.dart';
import 'package:yourdailylight/providers/AudioPlayerModel.dart';
import 'package:yourdailylight/providers/events.dart';
import 'package:yourdailylight/audio_player/player_page.dart';
import 'package:yourdailylight/video_player/VideoPlayer.dart';
import 'package:yourdailylight/livetvplayer/LivestreamsPlayer.dart';
import 'package:yourdailylight/screens/InboxViewerScreen.dart';
import 'package:yourdailylight/socials/SocialActivity.dart';
import 'package:yourdailylight/chat/ChatConversations.dart';
import 'package:yourdailylight/auth/LoginScreen.dart';
import 'package:yourdailylight/database/SQLiteDbProvider.dart';

class NotificationHandler {
  static void handleNotificationTap(String payload) {
    print("🔔 NotificationHandler.handleNotificationTap Route ----------->> $payload");
    debugPrint("[DEBUG] handleNotificationTap called with payload: $payload");

    // Retry logic for Navigator
    if (navigatorKey.currentState == null) {
      print("⚠️ Navigator not ready. Checking context...");
      // Try to wait a bit if context is not ready
       Future.delayed(Duration(milliseconds: 1000), () {
          if (navigatorKey.currentState != null) {
            print("✅ Navigator ready after delay. Retrying handleNotificationTap");
            handleNotificationTap(payload);
          } else {
             print("❌ Navigator still not ready after delay. Storing payload.");
             NotificationManager.pendingPayload = payload;
          }
       });
       return;
    }

    // Try to parse as JSON first (for Firebase complex payloads)
    try {
      final dynamic decoded = json.decode(payload);
      if (decoded is Map) {
        // Check if it's a Firebase payload structure from Firebase.dart
        if (decoded.containsKey('action')) {
          _handleFirebaseAction(Map<String, dynamic>.from(decoded));
          return;
        }
        
        // Check if it has 'type' field
        if (decoded.containsKey('type')) {
          final String? notifType = decoded['type'] as String?;
          final type = NotificationType.values.firstWhere(
            (e) => e.name == notifType,
            orElse: () => NotificationType.firebaseMessage,
          );
          _handleEnumNotification(type, payload);
          return;
        }
      }
    } catch (e) {
      // Not JSON or parsing failed, continue to enum matching
      print("ℹ️ Payload is not JSON or parse error: $e");
    }

    // Fallback to enum name matching
    // Check for daily devotional variations
    if (payload.toLowerCase().contains("daily")) {
       _handleEnumNotification(NotificationType.dailyDevotional, payload);
       return;
    }

    final type = NotificationType.values.firstWhere(
      (e) => e.name == payload,
      orElse: () => NotificationType.firebaseMessage,
    );
    _handleEnumNotification(type, payload);
  }

  static void _handleEnumNotification(NotificationType type, String payload) {
    print("✅ RECEIVED NOTIFICATION payload: $payload, type: $type");
    print("🧭 Navigator state: ${navigatorKey.currentState}");

    if (type == NotificationType.dailyDevotional) {
      print("📖 Navigating to DevotionHome (index 1)");
      navigatorKey.currentState?.pushNamed(MyMainHomePage.routeName, arguments: 1);
    } else {
      print("📰 Navigating to NewsHomeFragment (index 0) [Default/Firebase]");
      navigatorKey.currentState?.pushNamed(MyMainHomePage.routeName, arguments: 0);
    }
    print("🚀 Navigation command sent");
  }

  static Future<void> _handleFirebaseAction(Map<String, dynamic> data) async {
    final String action = data["action"];
    print("🔥 Handling Firebase Action: $action");

    if (action == "newMedia") {
      try {
        Map<String, dynamic> arts = json.decode(data['media']);
        Media media = Media.fromJson(arts);
        _navigateMedia(media);
      } catch (e) {
        print("❌ Error parsing newMedia: $e");
      }
    } else if (action == "social_notify") {
      _navigateSocials();
    } else if (action == "inbox") {
      try {
        Map<String, dynamic> arts = json.decode(data['inbox']);
        Inbox inbox = Inbox.fromJson(arts);
        _navigateInbox(inbox);
      } catch (e) {
        print("❌ Error parsing inbox: $e");
      }
    } else if (action == "livestream") {
      try {
        Map<String, dynamic> streamData = json.decode(data['livestream']);
        LiveStreams liveStreams = LiveStreams.fromJson(streamData);
        _navigateLivestreams(liveStreams);
      } catch (e) {
        print("❌ Error parsing livestream: $e");
      }
    } else if (action == "chat") {
      try {
        Map<String, dynamic> userData = json.decode(data['user']);
        Userdata sender = Userdata.fromFCMJson(userData);
        _navigateChat(sender);
      } catch (e) {
        print("❌ Error parsing chat: $e");
      }
    } else {
      print("⚠️ Unknown Firebase action: $action");
      // Fallback to Home
      navigatorKey.currentState?.pushNamed(MyMainHomePage.routeName, arguments: 0);
    }
  }

  static void _navigateMedia(Media media) {
    print("push notification media = " + media.title!);
    List<Media?> mediaList = [];
    mediaList.add(media);
    
    if (navigatorKey.currentContext == null) {
      print("❌ Context is null, cannot access Provider");
      return;
    }

    if (media.mediaType!.toLowerCase() == "audio") {
      print("audio media = " + media.title!);
      Provider.of<AudioPlayerModel>(navigatorKey.currentContext!, listen: false)
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

  static void _navigateSocials() {
    navigatorKey.currentState!.pushNamed(SocialActivity.routeName);
  }

  static void _navigateInbox(Inbox inbox) {
    navigatorKey.currentState!.pushNamed(InboxViewerScreen.routeName,
        arguments: ScreenArguements(
          position: 0,
          items: inbox,
          itemsList: [],
        ));
  }

  static void _navigateLivestreams(LiveStreams liveStreams) {
    navigatorKey.currentState!.pushNamed(LivestreamsPlayer.routeName,
        arguments: ScreenArguements(
          items: liveStreams,
        ));
  }

  static Future<void> _navigateChat(Userdata partner) async {
    Userdata? userdata = await SQLiteDbProvider.db.getUserData();
    if (userdata == null) {
      navigatorKey.currentState!.pushNamed(LoginScreen.routeName);
    } else {
      // Note: We are skipping isChatOpen check here as we don't have access to it easily.
      // Ideally, we should handle it if it causes issues.
      eventBus.fire(StartPartnerChatEvent(partner));
      navigatorKey.currentState!.pushNamed(ChatConversations.routeName);
    }
  }

  static void consumePendingPayload() {
    if (NotificationManager.pendingPayload != null) {
      String payload = NotificationManager.pendingPayload!;
      print("🔄 Consuming pending payload: $payload");
      NotificationManager.pendingPayload = null;
      handleNotificationTap(payload);
    }
  }
}
