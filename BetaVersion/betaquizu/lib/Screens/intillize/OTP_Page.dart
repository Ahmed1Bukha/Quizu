// ignore_for_file: use_build_context_synchronously

import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'CreateNewNamePage.dart';
import '../../classes/Networking.dart';
import '../mainPages/welcomePage.dart';

class OTP extends StatelessWidget {
  OTP({required this.phoneNumber});

  final String phoneNumber;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/Untitled-1.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Enter the OTP you recieved for the number ${phoneNumber}',
                style: textStyle(20, Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OtpTextField(
              showFieldAsBox: true,
              onSubmit: (value) async {
                dynamic returnedAnswer =
                    await Networking.getOTP(value, phoneNumber);
                print(returnedAnswer["success"] == "true");

                if (returnedAnswer["user_status"] == "new") {
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
                      builder: (context) => WelcomePage(),
                    ),
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              "Error name",
                              style: textStyle(30, Colors.white),
                            ),
                            content: Text(
                              "Your OTP is wrong. Please make sure that you entered the right one.",
                              style: textStyle(20, Colors.white),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: Text(
                                    "Ok",
                                    style: textStyle(19, Colors.blue),
                                  ))
                            ],
                          ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
