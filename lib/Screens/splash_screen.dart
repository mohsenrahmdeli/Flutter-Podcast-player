import 'package:amata_podcast/login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/voice.png',
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: AnimatedTextKit(
                totalRepeatCount: 2,
                onFinished: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Amata Podcast',
                    textStyle: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
