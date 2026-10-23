import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../theme/color.dart';

class VideoPreviewWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPreviewWidget({super.key, required this.videoUrl});

  @override
  State<VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _controller.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  ClipRect(
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: 600,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                      child: _controller.value.isPlaying
                          ? null
                          : Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: AppColors.accent,
                                size: 56,
                              ),
                            ),
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
