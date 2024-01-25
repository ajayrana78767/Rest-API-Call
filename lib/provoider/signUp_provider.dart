// ignore_for_file: file_names, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rest_api/services/loginServices.dart';

class SignUpProvider with ChangeNotifier {
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  GlobalKey<FormState> signUpFormKey=GlobalKey();
  
  void UserSignUp(
    TextEditingController signUpEmailController,
    TextEditingController signUpPasswordController,
  ) async {
    if (signUpEmailController.text == '' && signUpPasswordController.text == '') {
      print("please enter your details");
      notifyListeners();
    } else {
      UserLoginService.loginFun(
        signUpEmailController,
        signUpPasswordController,
      );
      notifyListeners();
    }
  }


}
