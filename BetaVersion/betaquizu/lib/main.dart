import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:betaquizu/classes/Authrization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/intillize/loginInPage.dart';
import 'Screens/intillize/OTP_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'classes/Networking.dart';
import 'Screens/mainPages/welcomePage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Anything(),
      theme: ThemeData.dark().copyWith(backgroundColor: Colors.transparent),
    );
  }
}

class Anything extends StatefulWidget {
  const Anything({super.key});

  @override
  State<Anything> createState() => AanythingState();
}

class AanythingState extends State<Anything> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/Untitled-1.png"),
          ),
        ),
        child: MyAnimation());
  }
}

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: "assets/intro.png",
        nextScreen: Authorization(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black);
  }
}
