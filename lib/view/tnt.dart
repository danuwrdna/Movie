import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class tnt extends StatefulWidget {
  @override
  _tntState createState() => _tntState();
}

class _tntState extends State<tnt> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=JhXRNRmuYcc')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Player'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : CircularProgressIndicator(), // Tampilkan loading jika belum siap
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Deskripsi video disini...',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                size: 36.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Tampilkan video secara fullscreen
                _controller.pause(); // Hentikan pemutaran sejenak
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      FullScreenVideoPlayer(controller: _controller),
                ));
              },
              child: Text('Full Screen'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class FullScreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  FullScreenVideoPlayer({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Video'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context); // Keluar dari layar penuh saat tombol kembali ditekan
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
