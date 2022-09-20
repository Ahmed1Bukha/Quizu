import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'Networking.dart';

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
              onPressed: () {
                print(myController.text);
                networkController.getOTP(myController.text, phoneNumber);
              },
              child: Text("Check"))
        ],
      ),
    );
  }
}
