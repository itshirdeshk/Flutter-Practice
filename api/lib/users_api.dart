import 'dart:convert';

import 'package:api/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class UsersAPI extends StatefulWidget {
  const UsersAPI({super.key});

  @override
  State<UsersAPI> createState() => _UsersAPIState();
}

class _UsersAPIState extends State<UsersAPI> {
  List<UsersModel> usersList = [];
  Future<List<UsersModel>> getUsersList() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        usersList.add(UsersModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users API"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUsersList(),
                  builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: usersList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ReusableRow(
                                          title: "Name : ",
                                          value: snapshot.data![index].name
                                              .toString()),
                                      ReusableRow(
                                          title: "Username : ",
                                          value: snapshot.data![index].username
                                              .toString()),
                                      ReusableRow(
                                          title: "Email : ",
                                          value: snapshot.data![index].email
                                              .toString()),
                                      ReusableRow(
                                          title: "City : ",
                                          value: snapshot
                                              .data![index].address.city
                                              .toString()),
                                    ],
                                  )),
                            );
                          });
                    }
                  })),
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
