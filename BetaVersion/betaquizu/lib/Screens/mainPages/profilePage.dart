import 'package:betaquizu/classes/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../classes/widgetBottom.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  dynamic infoUser;
  List<String> scores = [''];
  dynamic infoUserGetter() async {
    infoUser = await Networking.userInfoGetter();
    await scoreGetter();
    setState(() {
      isLoading = false;
    });
  }

  dynamic scoreGetter() async {
    scores = await Networking.getLocalScors();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoUserGetter();
  }

  bool isLoading = true;
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile Page")),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      infoUser['name'] + " ",
                    ),
                    Text(infoUser["mobile"])
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scores.map((e) => Text(e + " ")).toList())
              ],
            ),
      bottomNavigationBar: bottomBarReturn(index, context),
    );
  }
}
