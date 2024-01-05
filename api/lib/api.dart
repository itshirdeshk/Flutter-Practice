import 'dart:convert';

import 'package:api/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  var data;
  Future<ApiModel> getApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/23e5400a-96af-4f87-b13b-76772d2d0862"));
    data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ApiModel.fromJson(data);
    } else {
      return ApiModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              child: FutureBuilder<ApiModel>(
            future: getApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(snapshot.data!.data[index].shop.name
                                  .toString()),
                              subtitle: Text(snapshot
                                  .data!.data[index].shop.shopemail
                                  .toString()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot
                                    .data!.data[index].shop.image
                                    .toString()),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * 1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data!.data[index].images.length,
                                  itemBuilder: (context, position) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .25,
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              // fit: BoxFit.cover,
                                              image: NetworkImage(snapshot
                                                  .data!
                                                  .data[index]
                                                  .images[position]
                                                  .url
                                                  .toString()))),
                                    );
                                  }),
                            )
                          ],
                        ),
                      );
                    });
              }
            },
          ))
        ]),
      ),
    );
  }
}
