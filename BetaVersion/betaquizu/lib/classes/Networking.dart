// ignore_for_file: avoid_print, file_names

import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const mainUrl = 'quizu.okoul.com';

class Networking {
  static Future<dynamic> getOTP(String otpNumber, String mobileNumber) async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.https(mainUrl, "/Login");
    var response =
        await http.post(url, body: {"OTP": otpNumber, "mobile": mobileNumber});
    var decodedResponse = jsonDecode(response.body);
    if (decodedResponse['token'].toString().isNotEmpty) {
      await prefs.setString('token', decodedResponse['token'].toString());
    }
    print(decodedResponse);
    return decodedResponse;
  }

  static Future<dynamic> verifyTokken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('scores', []);
    await prefs.setStringList('date', []);

    var token = await prefs.getString('token');
    if (token == null) {
      token = "asd";
    }
    var url = Uri.https(mainUrl, "/Token");
    var response = await http.get(url, headers: {"AUTHORIZATION": token!});
    var decodedResponse = jsonDecode(response.body);
    print(1);
    print(decodedResponse);
    if (decodedResponse["success"]) {
      return await userInfoGetter();
    }

    return decodedResponse["success"];
  }

  static Future<dynamic> newUserName(String name, String token) async {
    var url = Uri.https(mainUrl, "/Name");
    var response = await http
        .post(url, headers: {"AUTHORIZATION": token}, body: {"name": name});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  static Future<dynamic> quistionGetter() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic token = prefs.getString('token');
    var url = Uri.https(mainUrl, "/Questions");
    var response =
        await http.get(url, headers: {"AUTHORIZATION": token.toString()});
    var decodedResponse = jsonDecode(response.body);

    //print(decodedResponse);
    return decodedResponse;
  }

  static Future<dynamic> userInfoGetter({String? token}) async {
    final prefs = await SharedPreferences.getInstance();
    if (token == null) {
      token = prefs.getString('token');
    }
    var url = Uri.https(mainUrl, "/UserInfo");
    var response = await http.get(url, headers: {"AUTHORIZATION": token!});
    var decodedResponse = jsonDecode(response.body);
    decodedResponse['token'] = token;

    print(6);
    print(decodedResponse);
    return decodedResponse;
  }

  static Future<dynamic> submitUserScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic token = prefs.getString('token');
    var url = Uri.https(mainUrl, "/Score");
    var response = await http.post(url,
        headers: {"AUTHORIZATION": token}, body: {"score": score.toString()});
    List<String>? scores = await prefs.getStringList('scores');
    List<String>? date = await prefs.getStringList('date');
    if (scores == null) {
      scores = ["Scores: "];
    }

    if (date == null) {
      date = ["Date: "];
    }
    scores.add(score.toString());
    date.add(DateFormat.yMd().add_jm().format(DateTime.now()).toString());

    await prefs.setStringList('scores', scores!);
    await prefs.setStringList('date', date!);

    var scoresAter = prefs.getStringList('scores');
    var dateAfter = prefs.getStringList('date');

    print(scoresAter);
    print(dateAfter);
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
  }

  static Future<dynamic> returnToken() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic token = prefs.getString('token');
    return token;
  }

  static Future<dynamic> getLeaderBoard() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic token = prefs.getString('token');

    var url = Uri.https(mainUrl, "/TopScores");
    var response = await http.get(url, headers: {"AUTHORIZATION": token!});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  static Future<dynamic> getLocalScors() async {
    final prefs = await SharedPreferences.getInstance();
    var scores = await prefs.getStringList('scores');
    if (scores == null) {
      return [" "];
    }
    print(scores);
    return await scores;
  }

  static Future<dynamic> getLocalDate() async {
    final prefs = await SharedPreferences.getInstance();
    var date = await prefs.getStringList('date');
    if (date == null) {
      return [" "];
    }
    print(date);
    return await date;
  }

  static Future<dynamic> removeInfos() async {
    final prefs = await SharedPreferences.getInstance();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    print("Done cleaing data");
  }
}
