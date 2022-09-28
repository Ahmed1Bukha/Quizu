// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/CustomWidget/button.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:betaquizu/Screens/mainPages/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/Untitled-1.png"),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                "QuizU ⌚️",
                style: textStyle(30, Colors.white),
              ),
            ),
          ),
          body: isLoading
              ? LoadingAnimation()
              : SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Center(
                          child: AutoSizeText(
                            wrapWords: true,
                            maxLines: 1,
                            maxFontSize: 50,
                            textAlign: TextAlign.center,
                            "Welcome " + (infoUser["name"] ?? "Guest lmfao"),
                            style: textStyle(50, Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Ready to test your knowledge and challenge others? ",
                        style: textStyle(25, Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SvgPicture.asset(
                        "assets/main.svg",
                        semanticsLabel: 'Acme Logo',
                        height: 200,
                        width: 100,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Button(
                        text: "Start quiz!",
                        function: () {
                          dynamic questions =

                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => quizPage(),
                                  ));
                        },
                        buttonColor: Colors.white,
                        Textcolor: Colors.white,
                        fontSize: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Answer as much questions correctly within 2 minutes",
                        style: textStyle(20, Colors.white),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: bottomBarReturn(indexPage, context)),
    );
  }
}
