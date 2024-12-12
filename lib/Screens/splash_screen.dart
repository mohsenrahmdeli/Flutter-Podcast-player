import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'profile_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_circle,
              size: 150,
            ),
            const SizedBox(height: 20.0),
            Image.asset('assets/images/wave.png'),
            const SizedBox(
              height: 15,
            ),
            AnimatedTextKit(
              totalRepeatCount: 2,
              onFinished: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileScreen();
                    },
                  ),
                );
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  'Amata Podcast',
                  textStyle: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
