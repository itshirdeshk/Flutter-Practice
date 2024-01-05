import 'dart:convert';

import 'package:api/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostsModel> postList = [];
    Future<List<PostsModel>> getPostApi() async {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          postList.add(PostsModel.fromJson(i));
        }
        return postList;
      } else {
        return postList;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading...");
                  } else {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(postList[index].title.toString()),
                                Text(postList[index].title.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
