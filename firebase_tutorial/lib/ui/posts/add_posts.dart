import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_tutorial/widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: postController,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: "What's going in your Mind?",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          RoundButton(
              loading: loading,
              title: "Add",
              onTap: () {
                setState(() {
                  loading = true;
                });

                String id = DateTime.now().microsecondsSinceEpoch.toString();
                databaseRef.child(id).set({
                  'title': postController.text.toString(),
                  'id': id
                }).then((value) {
                  print("Post Added");
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  print(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              })
        ]),
      ),
    );
  }
}
