import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "https://www.dungcoder.id.vn/so";

  static SignUp(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add-signup");

    try {
      final res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Đăng ký thất bại");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

}