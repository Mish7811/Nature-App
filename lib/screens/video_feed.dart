import 'package:flutter/material.dart';
import '../services/pexels_service.dart';
import '../widgets/video_player_widget.dart';

class VideoFeed extends StatefulWidget {
  @override
  _VideoFeedState createState() => _VideoFeedState();
}

class _VideoFeedState extends State<VideoFeed> {
  List<String> videoUrls = [];
  PexelsService pexelsService = PexelsService();
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  void loadVideos() async {
    try {
      videoUrls = await pexelsService.fetchNatureVideos();
    } catch (e) {
      errorMessage = 'Failed to load videos';
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    return VideoPlayerWidget(url: videoUrls[index]);
                  },
                ),
    );
  }
}
