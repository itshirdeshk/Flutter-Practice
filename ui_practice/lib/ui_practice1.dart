import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UIPractice1 extends StatefulWidget {
  const UIPractice1({super.key});

  @override
  State<UIPractice1> createState() => _UIPractice1State();
}

class _UIPractice1State extends State<UIPractice1> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                      // color: Colors.yellow,
                      height: 500,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                            decoration: const BoxDecoration(
                                // color: Colors.red,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://e1.pxfuel.com/desktop-wallpaper/110/70/desktop-wallpaper-pin-on-random-anime-pics-izayoi-sakamaki.jpg"))),
                            height: 450,
                          )),
                          const Positioned(
                              bottom: 0,
                              right: 24,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                // backgroundColor: Colors.blue,
                                radius: 50,
                              )),
                          const Positioned(
                              top: 70,
                              right: 30,
                              child: Icon(
                                Icons.heart_broken,
                                size: 35,
                              )),
                          const Positioned(
                              top: 70,
                              left: 30,
                              child: Icon(
                                Icons.arrow_back,
                                size: 35,
                              )),
                        ],
                      )),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              // color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Madrid City Tour for Designers",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "This is a Random Text",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowIconText("20", Icons.favorite_rounded),
                  rowIconText("34", Icons.upload),
                  rowIconText("82", Icons.message),
                  rowIconText("295", Icons.face),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  "It was a question of which of the two she preferred. On the one hand, the choice seemed simple. The more expensive one with a brand name would be the choice of most. It was the easy choice. The safe choice. But she wasn't sure she actually preferred it."),
            )
          ],
        ),
      ),
    );
  }

  Widget rowIconText(String text, IconData icon) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(icon)
      ],
    );
  }
}
