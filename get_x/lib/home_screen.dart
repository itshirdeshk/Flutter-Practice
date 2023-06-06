import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_x/counter_controller.dart';
import 'package:get_x/opacity_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());
    final OpacityController opacityController = Get.put(OpacityController());
    double opacity = 0.4;
    // int counter = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get X Tutorials"),
        ),
        body:
            // Column(
            //   children: [
            //     Card(
            //       child: ListTile(
            //         title: Text("Getx Alert Dialog"),
            //         subtitle: Text("Getx Alert Dialog"),
            //         onTap: () {
            //           Get.defaultDialog(
            //               title: "Delete Chat",
            //               titlePadding: EdgeInsets.only(top: 20),
            //               contentPadding: EdgeInsets.all(20),
            //               middleText: 'Are you sure want to delete this chat?',
            //               confirm: TextButton(
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                     // Get.back();
            //                   },
            //                   child: Text("Ok")),
            //               cancel:
            //                   TextButton(onPressed: () {}, child: Text("Cancel")));
            //         },
            //       ),
            //     ),
            //     Card(
            //       child: ListTile(
            //           title: Text("Getx Bottom Sheet"),
            //           subtitle: Text("Getx Bottom Sheet"),
            //           onTap: () {
            //             Get.bottomSheet(
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: Colors.red,
            //                   borderRadius: BorderRadius.circular(30),
            //                 ),
            //                 child: Column(
            //                   children: [
            //                     ListTile(
            //                       title: Text("Light Theme"),
            //                       leading: Icon(Icons.light_mode),
            //                       onTap: () {
            //                         Get.changeTheme(ThemeData.light());
            //                       },
            //                     ),
            //                     ListTile(
            //                       title: Text("Dark Theme"),
            //                       leading: Icon(Icons.dark_mode),
            //                       onTap: () {
            //                         Get.changeTheme(ThemeData.dark());
            //                       },
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }),
            //     ),
            //     FloatingActionButton(onPressed: () {
            //       Get.snackbar("Hirdesh Khandelwal", "Hello Everyone");
            //     }),
            //   ],
            // )

            //     Obx(
            //   () {
            //     return Center(
            //       child: Text(counterController.counter.toString()),
            //     );
            //   },
            // ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     counterController.incrementCounter();
            //   },
            //   child: Icon(Icons.add),
            // ),

            Column(
          children: [
            Obx(() {
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(opacityController.opacity.value),
              );
            }),
            Obx(() => Slider(
                value: opacityController.opacity.value,
                onChanged: (value) {
                  opacityController.setOpacity(value);
                }))
          ],
        ));
  }
}
