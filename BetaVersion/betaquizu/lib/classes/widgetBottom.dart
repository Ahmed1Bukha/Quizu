// ignore_for_file: prefer_const_constructors

import 'package:betaquizu/Screens/mainPages/profilePage.dart';
import 'package:betaquizu/Screens/mainPages/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/mainPages/leaderboard.dart';

Widget chosenWidget(index) {
  if (index == 0) {
    return WelcomePage();
  } else if (index == 1) {
    return LeaderBoard();
  } else if (index == 2) {
    return ProfilePage();
  } else {
    return Container();
  }
}

Widget bottomBarReturn(index, context) {
  return BottomNavigationBar(
    currentIndex: index,
    onTap: (value) {
      print(value);
      if (value != index) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => chosenWidget(value),
          ),
        );
      }
    },
    // ignore: prefer_const_literals_to_create_immutables
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.leaderboard),
        label: 'LeaderBoard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}
