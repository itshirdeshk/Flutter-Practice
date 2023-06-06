import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Practice"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                    action: SnackBarAction(
                        label: "Undo",
                        textColor: Colors.blue,
                        onPressed: () {}),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black,
                    duration: Duration(seconds: 3),
                    content: Text("This is a SnackBar"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text("Show SnackBar")),
        ),
      ),
    );
  }
}
