// ignore_for_file: prefer_const_declarations, unused_local_variable, avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PracticeGetApi extends StatefulWidget {
  const PracticeGetApi({Key? key}) : super(key: key);

  @override
  State<PracticeGetApi> createState() => _PracticeGetApiState();
}

class _PracticeGetApiState extends State<PracticeGetApi> {
  List<dynamic>? Users = [];
  List<dynamic>? DoneUsers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  Future getApi() async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response;
    response = await get(Uri.parse(url));

    //print(body);
    setState(() {
      if (response.statusCode == 200) {
        Users = jsonDecode(response.body.toString());
        DoneUsers = Users;
        //print(DoneUsers);
      } else {
        print("API is nopt integrated");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Get API-Null Saftey"),
        ),
        body: DoneUsers == null
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView.builder(
                itemCount: DoneUsers!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        print(DoneUsers![index]["id"]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Text("${index + 1}"),
                              ),
                              Text(
                                DoneUsers![index]["title"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text("Description: ${DoneUsers![index]["body"]}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
