import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewVideo extends StatefulWidget {
  final String title;
  final String videoUrl;

  const ViewVideo({
    super.key,
    required this.title,
    required this.videoUrl,
  });

  @override
  State<ViewVideo> createState() => _ViewVideoState();
}

class _ViewVideoState extends State<ViewVideo> {
  late YoutubePlayerController _youtubeController;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _youtubeController.addListener(() {
      if (_youtubeController.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _youtubeController.value.isFullScreen;
        });
      }
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isFullScreen
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]).then((val) {
                    Navigator.pop(context);
                  });
                },
              ),
              title: Text(
                widget.title,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
      body: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
      ),
    );
  }
}
