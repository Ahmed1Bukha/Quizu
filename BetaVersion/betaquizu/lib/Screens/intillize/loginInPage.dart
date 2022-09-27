import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:betaquizu/Screens/intillize/OTP_Page.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidget/button.dart';
import '../../classes/Networking.dart';

class loginPageNumber extends StatefulWidget {
  const loginPageNumber({super.key});

  @override
  State<loginPageNumber> createState() => _loginPageNumberState();
}

final myController = TextEditingController();

class _loginPageNumberState extends State<loginPageNumber> {
  bool isloading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearData();
  }

  clearData() async {
    await Networking.removeInfos();
    setState(() {
      isloading = false;
    });
  }

  String code = "+966";
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
        body: isloading
            ? LoadingAnimation()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome!",
                    style: textStyle(30, Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InternationalPhoneNumberInput(
                    initialValue: PhoneNumber(isoCode: "SA"),
                    textFieldController: myController,
                    maxLength: 11,
                    onInputChanged: (value) {
                      code = value.dialCode.toString();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      text: "Next",
                      function: () async {
                        print(myController.text);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OTP(phoneNumber: code + "" + myController.text),
                          ),
                        );
                      },
                      buttonColor: Colors.white),
                ],
              ),
      ),
    );
  }
}
