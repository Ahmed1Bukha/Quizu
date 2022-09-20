import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const loginInPage = 'quizu.okoul.com/Login';
const tokenUrl = 'https://quizu.okoul.com/Token';

const tokenForMe =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMyLCJpYXQiOjE2NjM2OTE3OTl9.cbU8i8a3ywhB1PVkygbSQBFnTjWBUTchxBWPy3A1uwE";

class Networking {
  Future<void> getOTP(String otpNumber, String mobileNumber) async {
    var url = Uri.http(loginInPage);
    var response =
        await http.post(url, body: {"OTP": otpNumber, "mobile": mobileNumber});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
  }

  Future<void> verifyTokken(String tokken) async {
    var url = Uri.http(tokenUrl);
    var response = await http.post(url, headers: {"AUTHORIZATION": tokken});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
  }
}
