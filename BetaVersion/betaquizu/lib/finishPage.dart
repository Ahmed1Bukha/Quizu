import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'welcomePage.dart';
import 'Networking.dart';

class FinishPage extends StatefulWidget {
  FinishPage(this.infoUser, this.score);
  int score;
  final infoUser;

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submitScore();
  }

  void submitScore() async {
    networking.submitUserScore(widget.infoUser["token"], widget.score);
  }

  Networking networking = new Networking();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finish")),
      body: Column(
        children: [
          Text("Your score is: " + widget.score.toString()),
          TextButton(onPressed: () => {}, child: Text("Return to main page"))
        ],
      ),
    );
  }
}
