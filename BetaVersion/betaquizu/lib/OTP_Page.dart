// ignore_for_file: use_build_context_synchronously

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'CreateNewNamePage.dart';
import 'Networking.dart';
import 'welcomePage.dart';

class OTP extends StatelessWidget {
  OTP({required this.phoneNumber});

  final String phoneNumber;
  final myController = TextEditingController();
  final Networking networkController = Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                Text('Enter the OTP you recieved for the number${phoneNumber}'),
          ),
          TextField(
            controller: myController,
            keyboardType: TextInputType.number,
          ),
          TextButton(
              onPressed: () async {
                print(myController.text);
                dynamic returnedAnswer = await networkController.getOTP(
                    myController.text, phoneNumber);
                print(returnedAnswer["success"] == "true");

                if (returnedAnswer["msg"] == "user created!") {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CreateNamePage(returnedAnswer["token"]),
                    ),
                  );
                } else if (returnedAnswer["message"].toString() ==
                    "Token returning!") {
                  print("secuss");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(returnedAnswer),
                    ),
                  );
                }
              },
              child: Text("Check"))
        ],
      ),
    );
  }
}
