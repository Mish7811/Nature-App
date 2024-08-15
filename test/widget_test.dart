import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nature_videos_app/main.dart'; // Import your main file if needed
import 'package:nature_videos_app/screens/video_feed.dart'; // Import the widget to be tested

void main() {
  testWidgets('Check if VideoFeed widget is displayed',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(NatureVideosApp());

    // Verify that the VideoFeed widget is displayed.
    expect(find.byType(VideoFeed), findsOneWidget);
  });
}
