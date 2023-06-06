import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageAPI extends StatefulWidget {
  const ImageAPI({super.key});

  @override
  State<ImageAPI> createState() => _ImageAPIState();
}

class _ImageAPIState extends State<ImageAPI> {
  List<photosModel> photoList = [];
  Future<List<photosModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photosModel photos =
            photosModel(title: i["title"], url: i["url"], id: i["id"]);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API")),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<photosModel>> snapshot) {
                return ListView.builder(
                    itemCount: photoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        subtitle: Text(snapshot.data![index].title.toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].id.toString()),
                      );
                    });
              }),
        )
      ]),
    );
  }
}

class photosModel {
  String title, url;
  int id;
  photosModel({required this.title, required this.url, required this.id});
}
