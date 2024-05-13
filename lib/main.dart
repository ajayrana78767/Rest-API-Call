import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:rest_api/provoider/practice_provider.dart';
import 'package:rest_api/provoider/signUp_provider.dart';
import 'package:rest_api/views/list_api.dart';
//import 'package:rest_api/views/login_screen.dart';
//import 'package:rest_api/views/practicepage.dart';
//import 'package:rest_api/list_api.dart';
//import 'package:rest_api/views/login_screen.dart';
//import 'package:rest_api/views/signUpPage.dart';

import 'provoider/login_provider.dart';
import 'views/login_screen.dart';

//import 'package:rest_api/first_page.dart';
//import 'package:rest_api/simple_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),

        //ChangeNotifierProvider(create: (_) => PracticeProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          useMaterial3: true,
        ),
        //home: const LoginScreen(),
        initialRoute: '/', // Set the initial route to '/'
        getPages: [
          GetPage(
            name: '/', // Define the '/' route
            page: () =>
                const LoginScreen(), // Set LoginScreen as the initial route
          ),
          GetPage(
            name: '/ListApiHit', // Define the '/ListApiHit' route
            page: () =>
                const ListApiHit(), // Set ListApiHit as the destination for '/ListApiHit'
          ),
          // Other routes...
        ],
      ),
    );
  }
}
