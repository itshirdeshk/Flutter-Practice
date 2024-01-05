import 'dart:convert';
import 'dart:io';

import 'package:dropdown_list/drop_down_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  Future<List<DropDownModel>> getPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      final body = json.decode(response.body) as List;

      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return DropDownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception("No Internet!");
    }
    throw Exception('Error Occured!');
  }

  @override
  Widget build(BuildContext context) {
    var selectedValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModel>>(
                future: getPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                        isExpanded: true,
                        hint: const Text('Selected Value'),
                        value: selectedValue,
                        icon: const Icon(Icons.add_circle_outline),
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem(
                              value: e.title.toString(),
                              child: Text(e.title.toString()));
                        }).toList(),
                        onChanged: (value) {
                          selectedValue = value;
                          setState(() {});
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
