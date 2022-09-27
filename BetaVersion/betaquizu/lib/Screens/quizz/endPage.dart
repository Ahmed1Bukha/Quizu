import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:betaquizu/Screens/quizz/quizPage.dart';
import 'package:flutter/material.dart';
import '../../classes/Networking.dart';

class endPage extends StatelessWidget {
  const endPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lose page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                final infoUser = await Networking.userInfoGetter();
                final questions = await Networking.quistionGetter();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => quizPage(),
                  ),
                );
              },
              child: Text("Reset quiz"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                final infoUser = await Networking.userInfoGetter();
                final questions = await Networking.quistionGetter();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: Text("Return to main page."),
            ),
          )
        ],
      ),
    );
  }
}
