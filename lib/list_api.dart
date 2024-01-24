import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListApiHit extends StatefulWidget {
  const ListApiHit({super.key});

  @override
  State<ListApiHit> createState() => _ListApiHitState();
}

class _ListApiHitState extends State<ListApiHit> {
  Map<String, dynamic>? dataMap;
  Map<String, dynamic>? donedataMap;
  List<dynamic>? doneListData;
  Future hitAPI() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        doneListData = dataMap!["data"];
        print(doneListData);
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
          "List API hit",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: doneListData == null
          ? const CupertinoActivityIndicator()
          : ListView.builder(
              itemCount: doneListData!.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(doneListData![index]["avatar"].toString()),),
                  title: Text(doneListData![index]['first_name'].toString() +
                      ' ' +
                      doneListData![index]['last_name'].toString()),
                subtitle: Text(doneListData![index]["email"].toString()),
                );
              }),
            ),
    );
  }
}
