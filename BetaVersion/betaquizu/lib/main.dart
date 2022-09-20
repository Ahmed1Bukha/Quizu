import 'package:flutter/material.dart';
import 'loginInPage.dart';
import 'OTP_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/loginInPage",
      routes: {
        '/loginInPage': (context) => loginPageNumber(),
      },
    );
  }
}
