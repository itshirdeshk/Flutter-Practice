import 'package:flutter/material.dart';

class UIPractice2 extends StatelessWidget {
  const UIPractice2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text(
          "wanda.s",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(children: [
          Container(
            height: 200,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 170,
                  // color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        // backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Wanda S.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Photographer / New York",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileDetails("150", "Posts"),
                          const SizedBox(
                            width: 10,
                          ),
                          profileDetails("5k ", "Followers"),
                          const SizedBox(
                            width: 10,
                          ),
                          profileDetails("100", "Following"),
                        ]),
                    Container(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    onPressed: () {},
                                    child: const Text("Follow"))),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            // color: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: Colors.orange),
                      ),
                      const Text("Title"),
                    ],
                  );
                }),
          ),
          // Container(
          //   height: 100,
          //   color: Colors.black,
          // ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://cdn.vox-cdn.com/thumbor/xBIBkXiGLcP-kph3pCX61U7RMPY=/0x0:1400x788/1200x800/filters:focal(588x282:812x506)/cdn.vox-cdn.com/uploads/chorus_image/image/70412073/0377c76083423a1414e4001161e0cdffb0b36e1f_760x400.0.png"),
                            fit: BoxFit.cover),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.all(5),
                  );
                }),
          )
        ]),
      ),
    );
  }

  Widget profileDetails(String text1, text2) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
