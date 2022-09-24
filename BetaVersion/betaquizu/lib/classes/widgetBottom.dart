import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/AfterPages/leaderboard.dart';

Widget bottomBarReturn(index, context, page) {
  return BottomNavigationBar(
    currentIndex: index,
    onTap: (value) {
      print(value);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.leaderboard),
        label: 'LeaderBoard',
      ),
    ],
  );
}
