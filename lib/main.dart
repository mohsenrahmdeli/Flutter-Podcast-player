import 'package:flutter/material.dart';
import 'Screens/home.dart';

void main() {
  runApp(FlutterPodcastAudioApp());
}

/// This is just an app made for fun to do test with audio
/// This Architecture is used for small-medium sized app,
/// if you want to make something bigger you can use getXpattern with getX
///
class FlutterPodcastAudioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast App Demo',
      home: HomeScreen(),
    );
  }
}
