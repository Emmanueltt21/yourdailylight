import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/utils/my_colors.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../widgets/CommentsItem.dart';
import '../../providers/AudioPlayerModel.dart';
import '../../models/Media.dart';


class PodCastPlayer extends StatefulWidget {
  final String podCastMediaUrl;
  final String podcastTitle;
  final String cover_photo;
  static const routeName = "/podcastplayer";

  PodCastPlayer({required this.podCastMediaUrl, required this.podcastTitle, required this.cover_photo});

  @override
  State<PodCastPlayer> createState() => _PodCastPlayerState();
}

class _PodCastPlayerState extends State<PodCastPlayer> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    
    // Start playback when entering the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final audioModel = Provider.of<AudioPlayerModel>(context, listen: false);
      audioModel.play(Media(
        id: widget.podCastMediaUrl.hashCode, // Simple ID for matching
        title: widget.podcastTitle,
        streamUrl: widget.podCastMediaUrl,
        coverPhoto: widget.cover_photo,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.accentDark,
        title: Text(widget.podcastTitle, style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Consumer<AudioPlayerModel>(
        builder: (context, audioModel, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child:
                              Image.network(widget.cover_photo)),
                        ),
                      ),
                      const Text("Your Daily Light PodCast"),
                      Text(widget.podcastTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ],
                  ),
                ),
                ControlButtons(audioModel),
                StreamBuilder<PositionData>(
                  stream: _getPositionDataStream(audioModel),
                  builder: (context, snapshot) {
                    return SeekBar(
                      duration: audioModel.duration,
                      position: audioModel.position,
                      bufferedPosition: Duration.zero,
                      onChangeEnd: (newPosition) {
                        audioModel.player.seek(newPosition);
                      },
                    );
                  },
                ),
                const SizedBox(height: 8.0),
                const SizedBox(height: 50,)
              ],
            ),
          );
        },
      ),
    );
  }

  Stream<PositionData> _getPositionDataStream(AudioPlayerModel audioModel) {
    return Rx.combineLatest3<Duration, Duration, Duration, PositionData>(
      audioModel.player.onPositionChanged,
      Stream.value(Duration.zero),
      audioModel.player.onDurationChanged,
      (position, bufferedPosition, duration) => PositionData(
          position, bufferedPosition, duration)
    );
  }
}


/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayerModel audioModel;

  const ControlButtons(this.audioModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () => _showVolumeDialog(context),
        ),
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            audioModel.playerState == PlayerState.playing
                ? Icons.pause
                : Icons.play_arrow,
          ),
          iconSize: 64.0,
          onPressed: () {
            if (audioModel.playerState == PlayerState.playing) {
              audioModel.pause();
            } else {
              audioModel.resume();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: null,
        ),
        IconButton(
          icon: const Icon(Icons.speed),
          onPressed: () => _showSpeedDialog(context),
        ),
      ],
    );
  }

  void _showVolumeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        double currentVolume = 1.0;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Adjust volume"),
              content: Slider(
                value: currentVolume,
                onChanged: (v) {
                  setState(() => currentVolume = v);
                  audioModel.player.setVolume(v);
                },
              ),
            );
          },
        );
      },
    );
  }

  void _showSpeedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        double currentSpeed = 1.0;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Adjust speed"),
              content: Slider(
                min: 0.5,
                max: 2.0,
                divisions: 6,
                value: currentSpeed,
                onChanged: (v) {
                  setState(() => currentSpeed = v);
                  audioModel.player.setPlaybackRate(v);
                },
              ),
            );
          },
        );
      },
    );
  }
}