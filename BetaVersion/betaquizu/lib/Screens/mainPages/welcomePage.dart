// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:betaquizu/Screens/mainPages/leaderboard.dart';
import 'package:flutter/material.dart';
import '../../classes/Networking.dart';
import '../../classes/widgetBottom.dart';
import '../quizz/quizPage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage();

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  dynamic infoUser;
  int indexPage = 0;
  bool isLoading = true;
  int getIndex() {
    return indexPage;
  }

  dynamic infoUserGetter() async {
    infoUser = await Networking.userInfoGetter();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoUserGetter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("welcome page!"))),
        body: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                        child: Text(
                            "Welcome " + (infoUser["name"] ?? "Guest lmfao"))),
                  ),
                  TextButton(
                    onPressed: () async {
                      dynamic questions = await Networking.quistionGetter();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => quizPage(infoUser, questions),
                          ));
                    },
                    child: Text("Start quiz!"),
                  ),
                ],
              ),
        bottomNavigationBar: bottomBarReturn(indexPage, context));
  }
}
