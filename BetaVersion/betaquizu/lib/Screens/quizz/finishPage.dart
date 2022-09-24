import 'package:betaquizu/Screens/intillize/loginInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../AfterPages/welcomePage.dart';
import '../../classes/Networking.dart';

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
    Networking.submitUserScore(widget.score);
  }

  Networking networking = new Networking();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finish")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Your score is: " + widget.score.toString())),
          Center(
              child: TextButton(
                  onPressed: () async {
                    final infoUser = await Networking.userInfoGetter();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(),
                        ));
                  },
                  child: Text("Return to main page")))
        ],
      ),
    );
  }
}
