import 'package:betaquizu/CustomWidget/animation.dart';
import 'package:betaquizu/Screens/intillize/OTP_Page.dart';
import 'package:flutter/material.dart';
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
                  SizedBox(
                    child: TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: 'Enther phone number:',
                            hintText: '5xxxxxxxxx'),
                        keyboardType: TextInputType.number),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      text: "Next",
                      function: () {
                        print(myController.text);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OTP(phoneNumber: myController.text),
                          ),
                        );
                      },
                      buttonColor: Colors.white)
                ],
              ),
      ),
    );
  }
}
