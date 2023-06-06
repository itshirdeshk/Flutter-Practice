import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("WhatsApp"),
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.chat),
                  text: "Chats",
                ),
                Tab(
                  icon: Icon(Icons.chat_bubble),
                  text: "Status",
                ),
                Tab(
                  icon: Icon(Icons.call),
                  text: "Calls",
                ),
              ]),
            ),
            body: const TabBarView(
              children: [
                Center(
                  child: Text(
                    "Chats",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Center(
                  child: Text(
                    "Status",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Center(
                  child: Text(
                    "Calls",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            )));
  }
}
