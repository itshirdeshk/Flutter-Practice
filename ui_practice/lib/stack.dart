import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Widget"),
      ),
      body: Container(
        color: Colors.blue,
        child: Stack(children: [
          Center(
            child: Container(
              color: Colors.yellow,
              height: 400,
              width: 400,
            ),
          ),
          Center(
            child: Container(
              color: Colors.red,
              height: 200,
              width: 200,
            ),
          )
        ]),
      ),
    );
  }
}
