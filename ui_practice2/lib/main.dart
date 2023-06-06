import 'package:flutter/material.dart';
import 'package:ui_practice2/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto", brightness: Brightness.dark),
      home: const Home(),
    );
  }
}
