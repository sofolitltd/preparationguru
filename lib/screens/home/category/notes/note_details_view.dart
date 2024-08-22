import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NotesDetailsView extends StatefulWidget {
  final String videoUrl;
  final String pdfUrl;
  final String title;

  const NotesDetailsView({
    super.key,
    required this.videoUrl,
    required this.pdfUrl,
    required this.title,
  });

  @override
  _NotesDetailsViewState createState() => _NotesDetailsViewState();
}

class _NotesDetailsViewState extends State<NotesDetailsView> {
  late YoutubePlayerController _youtubeController;
  bool isFullScreen = false;

  late PdfViewerController _pdfViewerController;

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

    //
    _youtubeController.addListener(() {
      if (_youtubeController.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _youtubeController.value.isFullScreen;
        });
      }
    });

    //
    _pdfViewerController = PdfViewerController();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.redAccent,
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.title),
            ),
            //
            Container(
              height: 500,
              margin: const EdgeInsets.all(16),
              color: Colors.black12,
              child: SfPdfViewer.network(
                // widget.pdfUrl,
                'https://firebasestorage.googleapis.com/v0/b/preparation-guru.appspot.com/o/eti%20-declaration.pdf?alt=media&token=b46d1852-2ef6-4d48-8a92-7502b2b048d6',
                controller: _pdfViewerController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
