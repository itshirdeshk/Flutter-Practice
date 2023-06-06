import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersAPI2 extends StatefulWidget {
  const UsersAPI2({super.key});

  @override
  State<UsersAPI2> createState() => _UsersAPI2State();
}

class _UsersAPI2State extends State<UsersAPI2> {
  dynamic data;
  Future<void> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUsersApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: "Name : ",
                                    value: data[index]["name"].toString()),
                                ReusableRow(
                                    title: "Username : ",
                                    value: data[index]["username"].toString()),
                                ReusableRow(
                                    title: "Email : ",
                                    value: data[index]["email"].toString()),
                                ReusableRow(
                                    title: "City : ",
                                    value: data[index]["address"]["city"]
                                        .toString()),
                              ],
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(value)
    ]);
  }
}
