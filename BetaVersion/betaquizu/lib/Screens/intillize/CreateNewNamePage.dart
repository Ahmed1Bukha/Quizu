import 'package:betaquizu/CustomWidget/button.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:flutter/material.dart';
import '../../classes/Networking.dart';
import '../mainPages/welcomePage.dart';

class CreateNamePage extends StatefulWidget {
  CreateNamePage(@required this.token);
  String token;

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

final myController = TextEditingController();

class _CreateNamePageState extends State<CreateNamePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.token);
  }

  final myController = TextEditingController();

  Widget build(BuildContext context) {
    String token = widget.token;
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
            Text(
              "Enter your name!",
              style: textStyle(40, Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: TextFormField(
                maxLength: 20,
                controller: myController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.face),
                  border: OutlineInputBorder(),
                  labelText: 'Enter username',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Button(
                text: "Submit",
                function: () async {
                  if (myController.text.isEmpty ||
                      myController.text.contains(" ")) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                "Error name",
                                style: textStyle(30, Colors.white),
                              ),
                              content: Text(
                                "Please enter your name without a space or empty in the given box.",
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
                  } else {
                    dynamic responseBack = await Networking.newUserName(
                        myController.text, widget.token);
                    responseBack["token"] = widget.token;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(),
                      ),
                    );
                  }
                },
                buttonColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
