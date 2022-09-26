import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:betaquizu/classes/Networking.dart';
import 'package:flutter/material.dart';

import '../../classes/widgetBottom.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key, this.infoUser});
  final infoUser;
  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int indexPage = 1;
  List<String> names = [];
  List<String> scores = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeaderBoard();
  }

  dynamic getLeaderBoard() async {
    final answer = await Networking.getLeaderBoard();
    for (int i = 0; i < 10; i++) {
      names.add(answer[i]["name"].toString());
      scores.add(answer[i]["score"].toString());
    }
    print(names);
    print(scores);
    setState(() {
      isLoading = false;
    });
  }

  List<Widget> returnNamesScores(List<String> names, List<String> scores) {
    List<Widget> row = [];
    for (int i = 0; i < 10; i++) {
      row.add(Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Text(
                names[i],
                style: textStyle(20, Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Text(
                scores[i],
                style: textStyle(20, Colors.white),
              ),
            ),
          ],
        ),
      ));
    }
    return row;
  }

  int getIndex() {
    return indexPage;
  }

  bool isLoading = true;
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
        appBar: AppBar(
          title: Center(
            child: Text(
              "QuizU ⌚️",
              style: textStyle(30, Colors.white),
            ),
          ),
        ),
        body: isLoading
            ? LoadingAnimation()
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "LeaderBoard",
                      style: textStyle(
                        60,
                        Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Names:",
                              style: textStyle(30, Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Scores:",
                              style: textStyle(30, Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ...returnNamesScores(names, scores)
                  ],
                ),
              ),
        bottomNavigationBar: bottomBarReturn(indexPage, context),
      ),
    );
  }
}
