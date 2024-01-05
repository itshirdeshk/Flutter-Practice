import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex =
      const CameraPosition(target: LatLng(27.1767, 78.0081), zoom: 14.4746);

  final Set<Marker> _marekrs = {};
  final Set<Polyline> _polyLine = {};

  List<LatLng> latlng = [
    LatLng(27.1767, 78.0081),
    LatLng(22.1767, 80.0081),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < latlng.length; i++) {
      _marekrs.add(
        Marker(
            markerId: MarkerId(
              i.toString(),
            ),
            position: latlng[i],
            infoWindow: const InfoWindow(
                title: 'Really Cool Place', snippet: '5 star rating'),
            icon: BitmapDescriptor.defaultMarker),
      );
      _polyLine.add(Polyline(polylineId: const PolylineId('1'), points: latlng, color: Colors.orange));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ploygone"),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          myLocationEnabled: false,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          polylines: _polyLine,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
