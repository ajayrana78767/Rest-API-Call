//import 'package:flutter/foundation.dart';
// ignore_for_file: avoid_print, unused_import, non_constant_identifier_names, unused_local_variable, unused_label, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:rest_api/views/list_api.dart';
import 'package:rest_api/services/loginServices.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  void UserLogin(
    TextEditingController loginEmailController,
    TextEditingController loginPasswordController,
  ) async {
    if (loginEmailController.text == '' && loginPasswordController.text == '') {
      print("please enter your details");
      notifyListeners();
    } else {
      UserLoginService.loginFun(
        loginEmailController,
        loginPasswordController,
      );
      notifyListeners();
    }
  }
}
