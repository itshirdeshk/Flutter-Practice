import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static CameraPosition kGooglePlex =
      const CameraPosition(target: LatLng(27.1767, 78.0081), zoom: 14.4746);

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(27.1767, 78.0081),
      infoWindow: InfoWindow(title: 'My Position'),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(26.1767, 78.0081),
      infoWindow: InfoWindow(title: 'Other Position'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
    loadData();
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      print(value.latitude.toString() + " : " + value.longitude.toString());

      _marker.add(Marker(
          markerId: MarkerId('3'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: 'My Current Location...')));

      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error :" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.local_activity),
          onPressed: () async {
            // GoogleMapController controller = await _controller.future;
            // controller.animateCamera(
            //   CameraUpdate.newCameraPosition(
            //     const CameraPosition(
            //         target: LatLng(36.2048, 138.2529), zoom: 14),
            //   ),
            // );
            loadData();
          }),
    );
  }
}
