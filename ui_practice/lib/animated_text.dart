import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText(
            //       "Hirdesh Khandelwal",
            //       textStyle:
            //           const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //       speed: const Duration(milliseconds: 100),
            //     )
            //   ],
            //   totalRepeatCount: 4,
            //   pause: const Duration(microseconds: 200),
            //   stopPauseOnTap: true,
            //   displayFullTextOnTap: true,
            // ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "Hirdesh Khandelwal",
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(microseconds: 200),
                stopPauseOnTap: true,
                displayFullTextOnTap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
