import 'package:api/api.dart';
import 'package:api/home_screen.dart';
import 'package:api/image_api.dart';
import 'package:api/image_upload.dart';
import 'package:api/signup.dart';
import 'package:api/users_api.dart';
import 'package:api/users_api2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadImage(),
    );
  }
}
