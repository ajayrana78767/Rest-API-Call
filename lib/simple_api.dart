import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleApiHit extends StatefulWidget {
  const SimpleApiHit({Key? key}) : super(key: key);

  @override
  State<SimpleApiHit> createState() => _SimpleApiHitState();
}

class _SimpleApiHitState extends State<SimpleApiHit> {
  Map<String, dynamic>?dataMap;
   Map<String, dynamic>?donedataMap;
  Future hitAPI() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));

    if (response.statusCode==200) {
      setState(() {
        dataMap= jsonDecode(response.body);
        donedataMap=dataMap!["data"];
        print(donedataMap);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hitAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Simple API hit",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body:  Center(
        child: 
        donedataMap==null ? const CupertinoActivityIndicator() :
        Text(donedataMap!['email'].toString()),
      ),
    );
  }
}
