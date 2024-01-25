//import 'package:flutter/foundation.dart';
// ignore_for_file: avoid_print, unused_import, non_constant_identifier_names, unused_local_variable, unused_label, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/list_api.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  void UserLogin(
    TextEditingController loginEmailController,
    TextEditingController loginPasswordController,
  ) async {
    try {
      var headers = {"Content-Type": "application/json"};

      var body = {
        "email": loginEmailController.text.trim(),
        "password": loginPasswordController.text.trim(),
      };

      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body.toString());
        print(json["token"]);

        if (json["token"] != '') {
          Get.offAll(() => ListApiHit());
        } else {
          print("Invalid Details");
        }
      }
    } catch (e) {
      print("error$e");
    }
  }
}
