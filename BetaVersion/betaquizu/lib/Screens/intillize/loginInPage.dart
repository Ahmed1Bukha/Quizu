import 'package:betaquizu/Screens/intillize/OTP_Page.dart';
import 'package:flutter/material.dart';

class loginPageNumber extends StatefulWidget {
  const loginPageNumber({super.key});

  @override
  State<loginPageNumber> createState() => _loginPageNumberState();
}

final myController = TextEditingController();

class _loginPageNumberState extends State<loginPageNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Logining in page")),
      ),
      body: Column(
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
          TextButton(
              onPressed: () {
                print(myController.text);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTP(phoneNumber: myController.text),
                  ),
                );
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}
