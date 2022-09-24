import 'dart:convert';

import 'package:flutter/material.dart';
import 'Networking.dart';
import 'quizPage.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage(@required this.infoUser);
  final infoUser;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("welcome page!")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Text("Welcome " + infoUser["name"])),
          ),
          TextButton(
            onPressed: () async {
              dynamic questions =
                  await networking.quistionGetter(infoUser["token"]);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        quizPage(infoUser, questions),
                  ));
            },
            child: Text("Start quiz!"),
          ),
        ],
      ),
    );
  }
}
