import 'package:flutter/material.dart';
import 'package:rest_api/list_api.dart';
//import 'package:rest_api/first_page.dart';
//import 'package:rest_api/simple_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListApiHit(),
    );
  }
}
