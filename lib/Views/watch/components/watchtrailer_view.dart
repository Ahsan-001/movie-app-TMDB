import 'package:flutter/material.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

class WatchTrailerView extends StatefulWidget {
  const WatchTrailerView({super.key});

  @override
  _WatchTrailerViewState createState() => _WatchTrailerViewState();
}

class _WatchTrailerViewState extends State<WatchTrailerView> {
  final MovieController movieController = Get.find();
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    // Check if the trailer URL is available
    if (movieController.trailerUrl.value.isNotEmpty) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(movieController.trailerUrl.value),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        allowFullScreen: true,
        fullScreenByDefault: true,
        autoPlay: true,
        looping: false,
      );
    }
  }

  @override
  void dispose() {
    if (videoPlayerController.value.isInitialized) {
      videoPlayerController.dispose();
      chewieController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: movieController.trailerUrl.value.isEmpty
            ? const Text('No Trailer found')
            : Chewie(
                controller: chewieController,
              ),
      ),
    );
  }
}
