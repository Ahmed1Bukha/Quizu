import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimation();
}

class _LoadingAnimation extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: Color.fromARGB(255, 178, 96, 255),
        rightDotColor: const Color(0xFFEA3799),
        size: 200,
      ),
    );
  }
}
