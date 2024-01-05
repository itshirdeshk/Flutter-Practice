import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/alert.dart';
import 'package:ui_practice/animated_text.dart';
import 'package:ui_practice/auth.dart';
import 'package:ui_practice/bottom_navigation.dart';
import 'package:ui_practice/bottom_sheet.dart';
import 'package:ui_practice/dismissible.dart';
import 'package:ui_practice/geolocation.dart';
import 'package:ui_practice/imagePicker.dart';
import 'package:ui_practice/stack.dart';
import 'package:ui_practice/tabbar.dart';
import 'package:ui_practice/ui_practice1.dart';
import 'package:ui_practice/ui_practice2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authentication(),
    );
  }
}
