import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/CustomWidget/button.dart';
import 'package:betaquizu/Screens/intillize/loginInPage.dart';
import 'package:betaquizu/classes/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../CustomWidget/textCutom.dart';
import '../../classes/widgetBottom.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  dynamic infoUser;

  List<String> scores = [''];
  List<String> dates = [''];
  dynamic infoUserGetter() async {
    infoUser = await Networking.userInfoGetter();
    await scoreGetter();
    setState(() {
      isLoading = false;
    });
  }

  dynamic scoreGetter() async {
    scores = await Networking.getLocalScors();
    dates = await Networking.getLocalDate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoUserGetter();
  }

  List<Widget> returnNamesScores(List<String> dates, List<String> scores) {
    List<Widget> row = [];
    for (int i = 0; i < dates.length; i++) {
      row.add(Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Text(
                dates[i],
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

  bool isLoading = true;
  int index = 2;
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
        appBar: AppBar(
          title: Center(
              child: Text(
            "QuizU ⌚️",
            style: textStyle(30, Colors.white),
          )),
        ),
        body: isLoading
            ? LoadingAnimation()
            : Container(
                margin: EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("LogOut"),
                                      content: Text(
                                          "Are you sure that you want to logout?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  loginPageNumber(),
                                            ),
                                          ),
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    )),
                            child: Transform.scale(
                              scale: 2.2,
                              child: Container(
                                child: Icon(Icons.logout),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(30),
                            child: Text(
                              "Profile",
                              style: textStyle(60, Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Name: " + infoUser['name'] + " ",
                            style: textStyle(30, Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mobile: " + infoUser["mobile"],
                            style: textStyle(30, Colors.white),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Text(
                        "My Scores",
                        style: textStyle(30, Colors.white),
                      ),
                      ...returnNamesScores(dates, scores),
                      SizedBox(
                        height: 100,
                      ),
                      Button(
                        text: "SignOut",
                        function: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginPageNumber(),
                            ),
                          );
                        },
                        backGroundColor: Colors.red,
                        buttonColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: bottomBarReturn(index, context),
      ),
    );
  }
}
