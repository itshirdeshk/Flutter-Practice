// To parse this JSON data, do
//
//     final postsApi = postsApiFromJson(jsonString);

import 'dart:convert';

List<PostsApi> postsApiFromJson(String str) => List<PostsApi>.from(json.decode(str).map((x) => PostsApi.fromJson(x)));

String postsApiToJson(List<PostsApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsApi {
    PostsApi({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory PostsApi.fromJson(Map<String, dynamic> json) => PostsApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
