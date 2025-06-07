import 'dart:async';
//import 'package:audiofileplayer/audiofileplayer.dart';
//import 'package:audiofileplayer/audio_system.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../i18n/strings.g.dart';
import '../screens/SubscriptionScreen.dart';
import '../utils/Alerts.dart';
import '../models/Media.dart';
import '../utils/my_colors.dart';
import '../utils/Utility.dart';
import 'dart:typed_data';

final Logger _logger = Logger('streamit_flutter');

class AudioPlayerModel with ChangeNotifier {
  late BuildContext _context;
  List<Media?> currentPlaylist = [];
  Media? currentMedia;
  int currentMediaPosition = 0;
  Color backgroundColor = MyColors.primary;
  bool isDialogShowing = false;

  double backgroundAudioDurationSeconds = 0.0;
  double backgroundAudioPositionSeconds = 0.0;

  bool isSeeking = false;
//  Audio? _remoteAudio;
  bool remoteAudioPlaying = false;
  bool _remoteAudioLoading = false;
  bool isUserSubscribed = false;
  late StreamController<double> audioProgressStreams;
  bool isRadio = false;

  /// Identifiers for the two custom Android notification buttons.
  static const String replayButtonId = 'replayButtonId';
  static const String newReleasesButtonId = 'newReleasesButtonId';
  static const String skipPreviousButtonId = 'skipPreviousButtonId';
  static const String skipNextButtonId = 'skipNextButtonId';

  AudioPlayerModelBACK() {
    getRepeatMode();
   // AudioSystem.instance.addMediaEventListener(_mediaEventListener);
    audioProgressStreams = new StreamController<double>.broadcast();
    audioProgressStreams.add(0);
  }

  bool? _isRepeat = false;
  bool? get isRepeat => _isRepeat;
  changeRepeat() async {
    _isRepeat = !_isRepeat!;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("_isRepeatMode", _isRepeat!);
  }

  getRepeatMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("_isRepeatMode") != null) {
      _isRepeat = prefs.getBool("_isRepeatMode");
    }
  }

  setUserSubscribed(bool isUserSubscribed) {
    this.isUserSubscribed = isUserSubscribed;
  }

  setContext(BuildContext context) {
    _context = context;
  }

  bool _showList = false;
  bool get showList => _showList;
  setShowList(bool showList) {
    _showList = showList;
    notifyListeners();
  }

  preparePlaylist(List<Media?> playlist, Media media) async {
    isRadio = false;
    currentPlaylist = playlist;
  // startAudioPlayBack(media);
  }

  prepareradioplayer(Media media) {
    isRadio = true;
    currentPlaylist = [];
    currentPlaylist.add(media);
    //startAudioPlayBack(media);
  }

  /*startAudioPlayBack(Media? media) {
    if (currentMedia != null) {
      _remoteAudio!.pause();
    }
    currentMedia = media;
    setCurrentMediaPosition();
    _remoteAudioLoading = true;
    remoteAudioPlaying = false;
    notifyListeners();
    audioProgressStreams.add(0);
    extractDominantImageColor(currentMedia!.coverPhoto);
    _remoteAudio = null;
    //_remoteAudio.dispose();

*//*      _remoteAudio = Audio.loadFromRemoteUrl(media!.streamUrl!,
          onDuration: (double durationSeconds) {
            _remoteAudioLoading = false;
            remoteAudioPlaying = true;
            backgroundAudioDurationSeconds = durationSeconds;
            notifyListeners();
          },
          onPosition: (double positionSeconds) {
            print("positionSeconds = " + positionSeconds.toString());
            backgroundAudioPositionSeconds = positionSeconds;
            //if (isSeeking) return;
            audioProgressStreams.add(backgroundAudioPositionSeconds);

            if (Utility.isPreviewDuration(
                currentMedia, positionSeconds.round(), isUserSubscribed)) {
              _pauseBackgroundAudio();
              showPreviewSubscribeAlertDialog();
            }

            //TimUtil.parseDuration(event.parameters["progress"].toString());
          },*//*
          //looping: _isRepeat,
          onComplete: () {
            if (_isRepeat!) {
              *//*backgroundAudioPositionSeconds = 0;
            audioProgressStreams.add(backgroundAudioPositionSeconds);
            _pauseBackgroundAudio();
            _resumeBackgroundAudio();*//*
              startAudioPlayBack(currentMedia);
            } else {
              skipNext();
            }
          },
          playInBackground: true,
          onError: (String? message) {
            *//* _remoteAudio.dispose();
          _remoteAudio = null;
          remoteAudioPlaying = false;
          _remoteAudioLoading = false;*//*
            print('Error ---->>  ${t.error}');
            cleanUpResources();
            Alerts.showCupertinoAlert(_context, t.error, message);
          })!
        ..play();


    remoteAudioPlaying = false;
  //  setMediaNotificationData(0);
  }
*/
  showPreviewSubscribeAlertDialog() {
    if (isDialogShowing) return;
    isDialogShowing = true;
    return showDialog(
      context: _context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.subscribehint),
          content: Text(t.previewsubscriptionrequiredhint),
          actions: <Widget>[
            ElevatedButton(
              child: Text(t.cancel.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
                isDialogShowing = false;
              },
            ),
            ElevatedButton(
              child: Text(t.subscribe),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SubscriptionScreen.routeName);
                isDialogShowing = false;
              },
            )
          ],
        );
      },
    );
  }

  setCurrentMediaPosition() {
    currentMediaPosition = currentPlaylist.indexOf(currentMedia);
    if (currentMediaPosition == -1) {
      currentMediaPosition = 0;
    }
    print("currentMediaPosition = " + currentMediaPosition.toString());
  }

  cleanUpResources() {
    _stopBackgroundAudio();
  }

  Widget icon() {
    if (_remoteAudioLoading) {
      return Theme(
          data: ThemeData(
              cupertinoOverrideTheme:
                  CupertinoThemeData(brightness: Brightness.dark)),
          child: CupertinoActivityIndicator());
    }
    if (remoteAudioPlaying) {
      return const Icon(
        Icons.pause,
        size: 40,
        color: Colors.white,
      );
    }
    return const Icon(
      Icons.play_arrow,
      size: 40,
      color: Colors.white,
    );
  }

  onPressed() {
    return remoteAudioPlaying
        ? _pauseBackgroundAudio()
        : _resumeBackgroundAudio();
  }


  Future<void> _resumeBackgroundAudio() async {
   // _remoteAudio!.resume();
    remoteAudioPlaying = true;
    notifyListeners();
   // setMediaNotificationData(0);
  }

  void _pauseBackgroundAudio() {
   // _remoteAudio!.pause();
    remoteAudioPlaying = false;
    notifyListeners();
   // setMediaNotificationData(1);
  }

  void _stopBackgroundAudio() {
   // _remoteAudio!.pause();
    currentMedia = null;
    notifyListeners();
    // setState(() => _backgroundAudioPlaying = false);
   // AudioSystem.instance.stopBackgroundDisplay();
  }

  void shufflePlaylist() {
    currentPlaylist.shuffle();
    //startAudioPlayBack(currentPlaylist[0]);
  }

  skipPrevious() {
    if (currentPlaylist.length == 0 || currentPlaylist.length == 1) return;
    int pos = currentMediaPosition - 1;
    if (pos == -1) {
      pos = currentPlaylist.length - 1;
    }
    Media? media = currentPlaylist[pos];
    if (Utility.isMediaRequireUserSubscription(media, isUserSubscribed)) {
      Alerts.showPlaySubscribeAlertDialog(_context);
      return;
    } else {
     // startAudioPlayBack(media);
    }
  }

  skipNext() {
    if (currentPlaylist.length == 0 || currentPlaylist.length == 1) return;
    int pos = currentMediaPosition + 1;
    if (pos >= currentPlaylist.length) {
      pos = 0;
    }
    Media? media = currentPlaylist[pos];
    if (Utility.isMediaRequireUserSubscription(media, isUserSubscribed)) {
      Alerts.showPlaySubscribeAlertDialog(_context);
      return;
    } else {
     // startAudioPlayBack(media);
    }
  }

  seekTo(double positionSeconds) {
    //audioProgressStreams.add(_backgroundAudioPositionSeconds);
    //_remoteAudio.seek(positionSeconds);
    //isSeeking = false;
    backgroundAudioPositionSeconds = positionSeconds;
   // _remoteAudio!.seek(positionSeconds);
    audioProgressStreams.add(backgroundAudioPositionSeconds);
  // AudioSystem.instance.setPlaybackState(true, positionSeconds);
  }

  onStartSeek() {
    isSeeking = true;
  }

  /// Generates a 200x200 png, with randomized colors, to use as art for the
  /// notification/lockscreen.
  static Future<Uint8List> generateImageBytes(String coverphoto) async {
    /*Uint8List byteImage = await networkImageToByte(coverphoto);
    return byteImage;*/

    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(coverphoto)).load(coverphoto))
            .buffer
            .asUint8List();
    return bytes;
  }


  extractDominantImageColor(String? url) async {
    if (url == "" || isRadio) {
      backgroundColor = MyColors.primary;
      notifyListeners();
    } else {
      PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        NetworkImage(url!),
      );
      if (paletteGenerator.dominantColor != null) {
        backgroundColor = paletteGenerator.dominantColor!.color;
        notifyListeners();
      } else {
        backgroundColor = MyColors.primary;
        notifyListeners();
      }
    }
  }
}
