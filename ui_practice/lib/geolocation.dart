// import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';/
// import 'package:geolocator/geolocator.dart';

// class GeoLocationWidget extends StatefulWidget {
//   const GeoLocationWidget({super.key});

//   @override
//   State<GeoLocationWidget> createState() => _GeoLocationWidgetState();
// }

// class _GeoLocationWidgetState extends State<GeoLocationWidget> {
//   Position? position;

//   fetchPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Fluttertoast.showToast(msg: "Location Service is Disabled");
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Fluttertoast.showToast(msg: "You denied the Permission");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Fluttertoast.showToast(msg: "You denied the Permission Forever");
//     }

//     Position currentPosition = await Geolocator.getCurrentPosition();
//     setState(() {
//       position = currentPosition;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Geo Location"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               position == null ? "Location" : position.toString(),
//               style: TextStyle(fontSize: 20),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 fetchPosition();
//               },
//               child: const Text("Get Location"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
