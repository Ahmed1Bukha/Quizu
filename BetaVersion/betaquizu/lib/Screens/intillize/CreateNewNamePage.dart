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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Creating name page")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                icon: Icon(Icons.face),
                border: OutlineInputBorder(),
                labelText: 'Enter username',
              ),
            ),
          ),
          TextButton(
              onPressed: () async {
                dynamic responseBack = await Networking.newUserName(
                    myController.text, widget.token);
                responseBack["token"] = widget.token;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
