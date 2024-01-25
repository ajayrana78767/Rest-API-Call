// ignore_for_file: avoid_print, implementation_imports, file_names

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rest_api/list_api.dart';


class UserLoginService{
  static loginFun (TextEditingController loginEmailController, TextEditingController loginPasswordController)async{
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
          Get.offAll(() => const ListApiHit());
        } else {
          print("Invalid Details");
        }
      }
    } catch (e) {
      print("error$e");
    }
  }
  
}