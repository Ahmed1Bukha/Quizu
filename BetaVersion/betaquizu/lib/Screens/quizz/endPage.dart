import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:betaquizu/Screens/quizz/quizPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("Images/undraw_cancel_re_pkdm.svg",
                semanticsLabel: 'Acme Logo'),
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
      ),
    );
  }
}
