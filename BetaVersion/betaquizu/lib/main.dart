import 'package:flutter/material.dart';
import 'loginInPage.dart';
import 'OTP_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'Networking.dart';
import 'welcomePage.dart';

Networking networking = new Networking();

void main() async {
  String token = 'fgf';
  dynamic answer = await networking.verifyTokken(token);
  print(answer);
  if (answer["message"] == "Unauthorized!") {
    print("1");
    runApp(MyApp(loginPageNumber()));
  } else {
    print(3);
    dynamic infoUser = await networking.userInfoGetter(token);
    runApp(MyApp(WelcomePage(infoUser)));
  }
}

class MyApp extends StatefulWidget {
  const MyApp(Widget this.chosen);
  final Widget chosen;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.chosen,
    );
  }
}
