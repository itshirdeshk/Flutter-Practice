import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utils/constants.dart';
import 'navbar.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileMainContent(),
      desktop: DesktopMainContent(),
    );
  }
}

Widget MobileMainContent() {
  return Container();
}

Widget DesktopMainContent() {
  return Expanded(
      child: Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                Image(image: AssetImage(squidGame)),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(figures),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Life is a Game, there are many players \nIf you don't play with them, they'll play with you",
                              style: TextStyle(fontSize: w! / 70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Trending #1",
                                  style: TextStyle(
                                      fontSize: w! / 70,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(20),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffe50914))),
                    onPressed: () {},
                    child: const Text(
                      "Continue Watching",
                      style: TextStyle(fontSize: 19, letterSpacing: 1.2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navButton("S1"),
                    navButton("E9"),
                    navButton("2021"),
                    Image.asset(imdb),
                    navButton("imdb")
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(squid),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}
