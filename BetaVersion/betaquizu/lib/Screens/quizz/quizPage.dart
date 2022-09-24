import 'package:flutter/material.dart';
import '../../classes/Networking.dart';
import '../../classes/quizBrain.dart';
import 'endPage.dart';
import 'dart:async';
import 'finishPage.dart';

class quizPage extends StatefulWidget {
  quizPage(
    this.infoUser,
    this.questions,
  );
  final infoUser;
  final questions;
  bool isSkipped = false;

  @override
  State<quizPage> createState() => _quizPageState();

  Timer? countdownTimer;
}

class _quizPageState extends State<quizPage> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  get countText {
    Duration count = controller.duration! * controller.value;
    print(count.inSeconds);
    if (controller.value == 0) {
      Future.delayed(Duration.zero, () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FinishPage(widget.infoUser, score),
          ),
        );
      });
    }

    return '${count.inSeconds}';
  }

  int questionNumber = 0;
  int numberOfSkippes = 1;

  void incremeantNumbers() {
    questionNumber++;
    score++;
  }

  int score = 0;
  Widget build(BuildContext context) {
    controller.reverse(from: controller.value == 0 ? 1 : controller.value);
    QuizBrain quizbrain = new QuizBrain(widget.questions);

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(quizbrain.getMainQuestion(questionNumber)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
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
                child: Text(quizbrain.getAllOptions(questionNumber)["a"]),
              ),
              TextButton(
                onPressed: () {
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
                child: Text(quizbrain.getAllOptions(questionNumber)["b"]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
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
                child: Text(quizbrain.getAllOptions(questionNumber)["c"]),
              ),
              TextButton(
                onPressed: () {
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
                child: Text(quizbrain.getAllOptions(questionNumber)["d"]),
              ),
              AnimatedBuilder(
                  animation: controller,
                  child: Text(countText),
                  builder: (context, child) => Text(countText))
            ],
          ),
          Visibility(
            visible: numberOfSkippes == 1,
            child: TextButton(
                onPressed: () {
                  if (numberOfSkippes == 1) {
                    setState(() {
                      numberOfSkippes--;
                      questionNumber++;
                    });
                  }
                },
                child: Text("You have  " + numberOfSkippes.toString())),
          )
        ],
      ),
    );
  }
}
