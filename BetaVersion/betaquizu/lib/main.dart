import 'package:betaquizu/classes/Authrization.dart';
import 'package:flutter/material.dart';
import 'Screens/intillize/loginInPage.dart';
import 'Screens/intillize/OTP_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'classes/Networking.dart';
import 'Screens/mainPages/welcomePage.dart';

void main() {
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
    return MaterialApp(home: Authorization(), theme: ThemeData.dark());
  }
}
