import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const mainUrl = 'quizu.okoul.com';

const tokenForMe =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjM3NjQzMDF9.E69JWVLjktAXovfR1a7x-gdQdIhaxZ_7RQutWq5BeaY";

class Networking {
  Future<dynamic> getOTP(String otpNumber, String mobileNumber) async {
    var url = Uri.https(mainUrl, "/Login");
    var response =
        await http.post(url, body: {"OTP": otpNumber, "mobile": mobileNumber});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  Future<void> verifyTokken(String tokken) async {
    var url = Uri.https(mainUrl, "/Tokken");
    var response = await http.post(url, headers: {"AUTHORIZATION": tokken});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
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
}
