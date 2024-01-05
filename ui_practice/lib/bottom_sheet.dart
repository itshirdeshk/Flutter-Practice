import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet Widget"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Show Bottom Sheet"),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      ListTile(
                        title: Text("Apple"),
                        subtitle: Text("A Red Color Fruit"),
                      ),
                      ListTile(
                        title: Text("Apple"),
                        subtitle: Text("A Red Color Fruit"),
                      ),
                      ListTile(
                        title: Text("Apple"),
                        subtitle: Text("A Red Color Fruit"),
                      ),
                      ListTile(
                        title: Text("Apple"),
                        subtitle: Text("A Red Color Fruit"),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
