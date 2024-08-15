import 'package:flutter/material.dart';
import 'screens/video_feed.dart'; // Adjust this path according to your structure
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(NatureVideosApp());
}

class NatureVideosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Videos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: VideoFeed(),
    );
  }
}
