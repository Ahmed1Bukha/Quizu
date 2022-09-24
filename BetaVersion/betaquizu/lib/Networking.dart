import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const mainUrl = 'quizu.okoul.com';

class Networking {
  Future<dynamic> getOTP(String otpNumber, String mobileNumber) async {
    var url = Uri.https(mainUrl, "/Login");
    var response =
        await http.post(url, body: {"OTP": otpNumber, "mobile": mobileNumber});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  Future<dynamic> verifyTokken(String tokken) async {
    var url = Uri.https(mainUrl, "/Token");
    var response = await http.get(url, headers: {"AUTHORIZATION": tokken});
    var decodedResponse = jsonDecode(response.body);
    print(1);
    print(decodedResponse);
    return decodedResponse;
  }

  Future<dynamic> newUserName(String name, String token) async {
    var url = Uri.https(mainUrl, "/Name");
    var response = await http
        .post(url, headers: {"AUTHORIZATION": token}, body: {"name": name});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  Future<dynamic> quistionGetter(String token) async {
    var url = Uri.https(mainUrl, "/Questions");
    var response = await http.get(url, headers: {"AUTHORIZATION": token});
    var decodedResponse = jsonDecode(response.body);

    //print(decodedResponse);
    return decodedResponse;
  }

  Future<dynamic> userInfoGetter(String token) async {
    var url = Uri.https(mainUrl, "/UserInfo");
    var response = await http.get(url, headers: {"AUTHORIZATION": token});
    var decodedResponse = jsonDecode(response.body);
    print(2);
    print(decodedResponse);
    return decodedResponse;
  }

  Future<dynamic> submitUserScore(String token, int score) async {
    var url = Uri.https(mainUrl, "/Score");
    var response = await http.post(url,
        headers: {"AUTHORIZATION": token}, body: {"score": score.toString()});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
  }
}
