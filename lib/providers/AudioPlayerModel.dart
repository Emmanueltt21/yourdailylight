import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../i18n/strings.g.dart';
import '../models/Media.dart';
import '../utils/my_colors.dart';
import 'dart:typed_data';

final Logger _logger = Logger('AudioPlayerModel');

class AudioPlayerModel with ChangeNotifier {
  AudioPlayer _player = AudioPlayer();
  Media? _currentMedia;
  PlayerState _playerState = PlayerState.stopped;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  List<Media?> currentPlaylist = [];
  int currentMediaPosition = 0;
  Color backgroundColor = MyColors.primary;
  bool isSeeking = false;
  bool isRadio = false;

  // Compatibility properties
  bool get remoteAudioPlaying => _playerState == PlayerState.playing;
  double get backgroundAudioPositionSeconds => _position.inSeconds.toDouble();
  double get backgroundAudioDurationSeconds => _duration.inSeconds.toDouble();
  late StreamController<double> audioProgressStreams;

  AudioPlayer get player => _player;
  Media? get currentMedia => _currentMedia;
  PlayerState get playerState => _playerState;
  Duration get duration => _duration;
  Duration get position => _position;

  late BuildContext _context;
  void setContext(BuildContext context) {
    _context = context;
  }

  AudioPlayerModel() {
    audioProgressStreams = StreamController<double>.broadcast();
    audioProgressStreams.add(0);
    _initListeners();
  }

  void _initListeners() {
    _player.onPlayerStateChanged.listen((state) {
      _playerState = state;
      notifyListeners();
    });

    _player.onDurationChanged.listen((d) {
      _duration = d;
      notifyListeners();
    });

    _player.onPositionChanged.listen((p) {
      _position = p;
      audioProgressStreams.add(p.inSeconds.toDouble());
      if (!isSeeking) notifyListeners();
    });

    _player.onPlayerComplete.listen((event) {
      if (_isRepeat) {
        _player.seek(Duration.zero);
        _player.resume();
      } else {
        skipNext();
      }
    });
  }

  bool _isRepeat = false;
  bool get isRepeat => _isRepeat;
  void changeRepeat() {
    _isRepeat = !_isRepeat;
    notifyListeners();
  }

  bool _showList = false;
  bool get showList => _showList;
  void setShowList(bool showList) {
    _showList = showList;
    notifyListeners();
  }

  void preparePlaylist(List<Media?> playlist, Media media) {
    isRadio = false;
    currentPlaylist = playlist;
    play(media);
  }

  void prepareradioplayer(Media media) {
    isRadio = true;
    currentPlaylist = [media];
    play(media);
  }

  Future<void> play(Media media) async {
    if (_currentMedia?.id == media.id && _playerState == PlayerState.paused) {
      await _player.resume();
      return;
    }

    _currentMedia = media;
    _updateCurrentMediaPosition();
    extractDominantImageColor(media.coverPhoto);
    notifyListeners();

    try {
      if (media.streamUrl != null) {
        await _player.stop();
        await _player.setSource(UrlSource(media.streamUrl!));
        await _player.resume();
      }
    } catch (e) {
      _logger.severe("Error playing media: $e");
    }
  }

  void _updateCurrentMediaPosition() {
    if (currentPlaylist.isNotEmpty && _currentMedia != null) {
      currentMediaPosition = currentPlaylist.indexOf(_currentMedia);
      if (currentMediaPosition == -1) currentMediaPosition = 0;
    }
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> resume() async {
    await _player.resume();
  }

  Future<void> stop() async {
    await _player.stop();
    _currentMedia = null;
    notifyListeners();
  }

  void skipNext() {
    if (currentPlaylist.isEmpty || isRadio) return;
    int nextPos = currentMediaPosition + 1;
    if (nextPos >= currentPlaylist.length) nextPos = 0;
    Media? nextMedia = currentPlaylist[nextPos];
    if (nextMedia != null) play(nextMedia);
  }

  void skipPrevious() {
    if (currentPlaylist.isEmpty || isRadio) return;
    int prevPos = currentMediaPosition - 1;
    if (prevPos < 0) prevPos = currentPlaylist.length - 1;
    Media? prevMedia = currentPlaylist[prevPos];
    if (prevMedia != null) play(prevMedia);
  }

  void shufflePlaylist() {
    currentPlaylist.shuffle();
    if (currentPlaylist.isNotEmpty) {
      Media? firstMedia = currentPlaylist[0];
      if (firstMedia != null) play(firstMedia);
    }
  }

  void seekTo(double positionSeconds) {
    _player.seek(Duration(seconds: positionSeconds.toInt()));
    isSeeking = false;
  }

  void onStartSeek() {
    isSeeking = true;
  }

  void onPressed() {
    if (remoteAudioPlaying) {
      pause();
    } else {
      resume();
    }
  }

  Widget icon() {
    if (remoteAudioPlaying) {
      return const Icon(Icons.pause, size: 40, color: Colors.white);
    }
    return const Icon(Icons.play_arrow, size: 40, color: Colors.white);
  }

  void cleanUpResources() {
    stop();
    _player.dispose();
  }

  Future<void> extractDominantImageColor(String? url) async {
    if (url == null || url.isEmpty || isRadio) {
      backgroundColor = MyColors.primary;
    } else {
      try {
        PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
          NetworkImage(url),
        );
        backgroundColor = paletteGenerator.dominantColor?.color ?? MyColors.primary;
      } catch (e) {
        backgroundColor = MyColors.primary;
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    audioProgressStreams.close();
    super.dispose();
  }
}
