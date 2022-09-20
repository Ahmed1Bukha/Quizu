import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const loginInPage = 'quizu.okoul.com';

class Networking {
  Future<void> getOTP(String otpNumber, String mobileNumber) async {
    var url = Uri.https(loginInPage, '/Login');
    var response =
        await http.post(url, body: {"OTP": otpNumber, "mobile": mobileNumber});
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
  }
}
