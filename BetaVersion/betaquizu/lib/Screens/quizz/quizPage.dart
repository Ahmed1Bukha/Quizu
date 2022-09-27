import 'package:auto_size_text/auto_size_text.dart';
import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/CustomWidget/button.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:flutter/material.dart';
import '../../classes/Networking.dart';
import '../../classes/quizBrain.dart';
import 'endPage.dart';
import 'dart:async';
import 'finishPage.dart';

class quizPage extends StatefulWidget {
  quizPage();

  bool isSkipped = false;

  @override
  State<quizPage> createState() => _quizPageState();

  Timer? countdownTimer;
}

class _quizPageState extends State<quizPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    infoUserGetter();
    timerStart();
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 120));
  }

  dynamic infoUserGetter() async {
    infoUser = await Networking.userInfoGetter();
    await questionGetter();
    setState(() {
      isLoading = false;
    });
  }

  dynamic questionGetter() async {
    questions = await Networking.quistionGetter();
  }

  String secondsToMins(int seconds) {
    int mins = seconds ~/ 60;
    int sec = seconds - (mins * 60);
    return '${mins > 0 ? '$mins:' : ''}${sec}';
  }

  void timerStart() {
    timer = Timer.periodic(Duration(seconds: 1), (value) {
      if (mounted) {
        setState(() {
          if (seconds > 0) {
            seconds--;
          } else {
            timer.cancel();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FinishPage(infoUser, score),
              ),
            );
          }
        });
      }
    });
  }

  int questionNumber = 0;
  int numberOfSkippes = 1;

  void incremeantNumbers() {
    questionNumber++;
    score++;
  }

  int score = 0;
  var infoUser;
  bool isLoading = true;
  var questions;
  late var timer;
  int seconds = 120;
  bool isPressed = false;
  Widget build(BuildContext context) {
    QuizBrain quizbrain = new QuizBrain(questions);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("Images/Untitled-1.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? LoadingAnimation()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  AutoSizeText(
                    minFontSize: 45,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    quizbrain.getMainQuestion(questionNumber),
                    style: textStyle(50, Colors.white),
                  ),
                  SizedBox(
                    height: 150,
                    child: Stack(children: [
                      Center(
                        child: Transform.scale(
                          scale: 2.7,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: seconds / 120,
                            color: seconds > 30 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          secondsToMins(seconds),
                          style: textStyle(22, Colors.white),
                        ),
                      )
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        fontSize: 20,
                        text: quizbrain.getAllOptions(questionNumber)["a"],
                        function: () {
                          if (quizbrain.verifyAnswer("a", questionNumber)) {
                            setState(() {
                              incremeantNumbers();
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => endPage(),
                                ));
                          }
                        },
                        buttonColor: Colors.white,
                        height: 100,
                        width: 150,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Button(
                        fontSize: 20,
                        text: quizbrain.getAllOptions(questionNumber)["b"],
                        function: () {
                          if (quizbrain.verifyAnswer("b", questionNumber)) {
                            setState(() {
                              incremeantNumbers();
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => endPage(),
                                ));
                          }
                        },
                        buttonColor: Colors.white,
                        height: 100,
                        width: 150,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        fontSize: 20,
                        text: quizbrain.getAllOptions(questionNumber)["c"],
                        function: () {
                          if (quizbrain.verifyAnswer("c", questionNumber)) {
                            setState(() {
                              incremeantNumbers();
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => endPage(),
                                ));
                          }
                        },
                        buttonColor: Colors.white,
                        height: 100,
                        width: 150,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Button(
                        fontSize: 20,
                        text: quizbrain.getAllOptions(questionNumber)["d"],
                        function: () {
                          if (quizbrain.verifyAnswer("d", questionNumber)) {
                            setState(() {
                              incremeantNumbers();
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => endPage(),
                                ));
                          }
                        },
                        buttonColor: Colors.white,
                        height: 100,
                        width: 150,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    buttonColor: Colors.red,
                    backGroundColor: Colors.orange,
                    text: "You have " + numberOfSkippes.toString() + " skip 🔥",
                    function: !isPressed
                        ? () {
                            if (numberOfSkippes == 1) {
                              setState(() {
                                isPressed = true;
                                numberOfSkippes--;
                                questionNumber++;
                              });
                            }
                          }
                        : null,
                  )
                ],
              ),
      ),
    );
  }
}
