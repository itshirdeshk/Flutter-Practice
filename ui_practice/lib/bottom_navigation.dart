import 'package:flutter/material.dart';
import 'package:ui_practice/alert.dart';
import 'package:ui_practice/dismissible.dart';
import 'package:ui_practice/drawer.dart';
import 'package:ui_practice/snack_bar.dart';

class BottomNavigationWiget extends StatefulWidget {
  const BottomNavigationWiget({super.key});

  @override
  State<BottomNavigationWiget> createState() => _BottomNavigationWigetState();
}

class _BottomNavigationWigetState extends State<BottomNavigationWiget> {
  int selectedItem = 0;
  PageController pageController = PageController();
  // List<Widget> widgets = [
  //   const Text("Home"),
  //   const Text("Search"),
  //   const Text("Profile"),
  //   const Text("Logout"),
  // ];

  void onTap(int index) {
    setState(() {
      selectedItem = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Bottom Navigation Bar"),
      // ),
      body: PageView(
        controller: pageController,
        children: const [
          AlertWidget(),
          DismissibleWidget(),
          DrawerWidget(),
          SnackBarWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: "Logout"),
        ],
        currentIndex: selectedItem,
        selectedItemColor: Colors.blue.shade200,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
      ),
    );
  }
}
