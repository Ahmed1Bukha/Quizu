import 'package:flutter/material.dart';
import 'Networking.dart';

class quizPage extends StatefulWidget {
  const quizPage(this.token, this.questions);
  final token;
  final questions;

  @override
  State<quizPage> createState() => _quizPageState();
}

final Networking networking = new Networking();

class _quizPageState extends State<quizPage> {
  @override
  void initState() {
    super.initState();
  }

  returnQuestions() async {
    return await networking.quistionGetter(widget.token);
  }

  int questionNumber = 0;
  Widget build(BuildContext context) {
    String mainQuestion = widget.questions[questionNumber]["Question"];

    List<String> options = [
      widget.questions[questionNumber]['a'],
      widget.questions[questionNumber]['b'],
      widget.questions[questionNumber]['c'],
      widget.questions[questionNumber]['d'],
    ];

    var listOfQuestions = returnQuestions();
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz page"),
      ),
      body: Column(children: [
        Text(widget.questions[questionNumber]["Question"]),
        Row(
          children: [
            TextButton(
              onPressed: () {
                questionNumber++;
                setState(() {
                  print(questionNumber);
                });
              },
              child: Text(options[0]),
            ),
            TextButton(
              onPressed: () {
                questionNumber++;
                setState(() {
                  print(questionNumber);
                });
              },
              child: Text(options[1]),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                questionNumber++;
                setState(() {
                  print(questionNumber);
                });
              },
              child: Text(options[2]),
            ),
            TextButton(
              onPressed: () {
                questionNumber++;
                setState(() {
                  print(questionNumber);
                });
              },
              child: Text(options[3]),
            ),
          ],
        )
      ]),
    );
  }
}
