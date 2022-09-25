import 'package:betaquizu/Screens/intillize/loginInPage.dart';
import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Networking.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Networking.verifyTokken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == false) {
                return loginPageNumber();
              } else {
                return WelcomePage();
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
