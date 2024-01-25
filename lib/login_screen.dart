import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provoider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final LoginPRovider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Consumer<LoginProvider>(
            builder: (context, LoginValues, child) {
              return Form(
                key: LoginValues.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: LoginValues.loginEmailController,
                      decoration: const InputDecoration(
                        hintText: "email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: LoginValues.loginPasswordController,
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
                          if (LoginValues.loginFormKey.currentState!
                              .validate()) {
                            LoginValues.UserLogin(
                              LoginValues.loginEmailController,
                              LoginValues.loginPasswordController,
                            );
                          }
                        },
                        child: const Text(
                          "Login",
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
