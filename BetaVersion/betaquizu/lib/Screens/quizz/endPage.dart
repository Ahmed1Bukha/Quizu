import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:betaquizu/Screens/quizz/quizPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../CustomWidget/button.dart';
import '../../classes/Networking.dart';

class endPage extends StatelessWidget {
  const endPage({super.key});

  @override
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
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 30,
              ),
              Text(
                textAlign: TextAlign.center,
                "You got a wrong answer!",
                style: textStyle(40, Colors.white),
              ),
              SvgPicture.asset(
                "Images/lmfao.svg",
                semanticsLabel: 'Acme Logo',
                height: 300,
                width: 100,
              ),
              SizedBox(
                height: 80,
              ),
              Button(
                text: "Retry quiz",
                function: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quizPage(),
                    ),
                  );
                },
                buttonColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
