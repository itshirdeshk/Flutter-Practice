import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsApi> postsApi = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: postsApi.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 110,
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User id: ${postsApi[index].userId}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Id: ${postsApi[index].id}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Tiitle: ${postsApi[index].title}",
                          maxLines: 1,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Body: ${postsApi[index].body}",
                          maxLines: 1,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<PostsApi>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        postsApi.add(PostsApi.fromJson(index));
      }
      return postsApi;
    } else {
      return postsApi;
    }
  }
}
