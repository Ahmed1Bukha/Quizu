import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:betaquizu/Screens/intillize/loginInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import '../mainPages/welcomePage.dart';
import '../../classes/Networking.dart';

class FinishPage extends StatefulWidget {
  FinishPage(this.score);
  int score;

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("Images/Untitled-1.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.scale(
                    scale: 2.5,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomePage(),
                            ),
                          );
                        },
                        child: Icon(Icons.close)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Text(
                "TIMES UP!",
                style: textStyle(60, Colors.white),
              ),
              SizedBox(
                height: 80,
              ),
              SvgPicture.asset(
                "Images/win.svg",
                semanticsLabel: 'Acme Logo',
                height: 250,
                width: 100,
              ),
              Text(
                "You have completed",
                style: textStyle(30, Colors.white),
              ),
              Text(
                widget.score.toString(),
                style: textStyle(70, Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                "Correct answer!",
                style: textStyle(30, Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Share.share(
                      "I got ${widget.score} in QuizU! Try to beat that!",
                      subject: "test");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(scale: 3, child: Icon(Icons.share)),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Share",
                      style: textStyle(30, Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
