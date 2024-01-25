// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:rest_api/provoider/login_provider.dart';
import 'package:rest_api/provoider/signUp_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final SignUpPProvider = Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Consumer<SignUpProvider>(
            builder: (context, SignUpValues, child) {
              return Form(
                key: SignUpValues.signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: SignUpValues.signUpEmailController,
                      decoration: const InputDecoration(
                        hintText: "email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: SignUpValues.signUpPasswordController,
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                        ),
                        onPressed: () {
                          if (SignUpValues.signUpFormKey.currentState!
                              .validate()) {
                            SignUpValues.UserSignUp(
                              SignUpValues.signUpEmailController,
                              SignUpValues.signUpPasswordController,
                            );
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ],
                ),
              );
            },
          )),
    );
  }
}
