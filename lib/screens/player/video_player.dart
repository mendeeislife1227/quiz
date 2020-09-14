import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'video_player_controls.dart';

class FullScreenPlayer extends StatefulWidget {
  FullScreenPlayer({Key key}) : super(key: key);

  @override
  _FullScreenPlayerState createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  FlickManager flickManager;
  //Video URL
  String videoURL = 'https://cdn.animax.mn/XNSSHSJW3NGU8XTJ/_temp/chultem/2020/july/god_high_/god_high_09.mp4';
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        onVideoEnd: () {
          //onFinished Callback
          print('IM DONE');
        },
        videoPlayerController: VideoPlayerController.network(videoURL));
  }

  @override
  void dispose() {
    flickManager.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      preferredDeviceOrientation: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft
      ],
      systemUIOverlay: [],
      flickVideoWithControls: FlickVideoWithControls(
        videoFit: BoxFit.fitHeight,
        controls: LandscapePlayerControls(),
      ),
    );
  }
}
