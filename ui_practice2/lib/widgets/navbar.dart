import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ui_practice2/utils/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileNavBar(),
      desktop: DesktopNavBar(),
    );
  }
}

Widget MobileNavBar() {
  return Container(
    height: 70,
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Icon(Icons.menu),
        navLogo(),
      ],
    ),
  );
}

Widget DesktopNavBar() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Row(
          children: [
            navButton("Home"),
            navButton("About"),
            navButton("Cast"),
            navButton("Trailer"),
          ],
        ),
        navLogo(),
      ],
    ),
  );
}

Widget navLogo() {
  return Container(
    height: 60,
    width: 180,
    child: Image(image: AssetImage(netflix)),
  );
}

Widget navButton(String text) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: text == "Home" ? Colors.red : Colors.white),
      ),
    ),
  );
}
