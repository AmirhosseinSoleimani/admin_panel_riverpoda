import 'dart:io';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_loading/ac_loading.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final VideoPlayerController videoController = VideoPlayerController.file(File(widget.videoPath));

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.onSecondary
          ),
          borderRadius: BorderRadius.circular(AppSize.s12)
      ),
      child: Stack(
        children: [
          FutureBuilder(
            future: videoController.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  ),
                );
              } else {
                return const ACLoading();
              }
            },
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (videoController.value.isPlaying) {
                    videoController.pause();
                  } else {
                    videoController.play();
                  }
                });
              },
              child: Icon(
                videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                size: AppSize.s42,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}