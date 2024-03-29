import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/user.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchUsers();
      }),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 155, 230),
        centerTitle: true,
        title: const Text(
          "Calling rest API",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          final email = user.email;

          return ListTile(
            title: Text(email),
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    print("fetchUsers");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonData = jsonDecode(body);
      final results = jsonData["results"] as List<dynamic>;
      final transformed = results.map((e) {
        return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          phone: e['phone'],
          nat: e['nat'],
        );
      }).toList();

      // Check if the 'results' key exists and is a non-null list
      if (jsonData.containsKey("results") &&
          jsonData["results"] is List<dynamic>) {
        setState(() {
          users = transformed;
        });
      } else {
        // Handle case where 'results' key is missing or not a list
        print(
            "Error: 'results' key is missing or not a List<dynamic> in the API response");
      }
    } else {
      // Handle HTTP error response
      print("Error: HTTP ${response.statusCode} ${response.reasonPhrase}");
    }

    print("fetchUsersCompleted");
  }
}
