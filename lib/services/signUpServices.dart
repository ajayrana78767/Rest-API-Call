// ignore_for_file: avoid_print, implementation_imports, file_names

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rest_api/views/list_api.dart';


class UserSignUpService{
  static signUpFun (TextEditingController signUpEmailController, TextEditingController signUpPasswordController)async{
     try {
      var headers = {"Content-Type": "application/json"};

      var body = {
        "email": signUpEmailController.text.trim(),
        "password": signUpPasswordController.text.trim(),
      };

      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
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