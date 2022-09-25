import 'package:betaquizu/Screens/intillize/OTP_Page.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Logining in page")),
      ),
      body: isloading
          ? CircularProgressIndicator()
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
                TextButton(
                    onPressed: () {
                      print(myController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OTP(phoneNumber: myController.text),
                        ),
                      );
                    },
                    child: Text("Next"))
              ],
            ),
    );
  }
}
