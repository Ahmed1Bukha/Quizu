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

  int getIndex() {
    return indexPage;
  }

  bool isLoading = true;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("LeaderBoad")),
        ),
        body: isLoading
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: names.map((e) => Text(e)).toList()),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: scores.map((e) => Text(e)).toList()),
                ],
              ),
        bottomNavigationBar: bottomBarReturn(indexPage, context));
  }
}
