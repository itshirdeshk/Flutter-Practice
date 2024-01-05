import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PloygoneScreen extends StatefulWidget {
  const PloygoneScreen({super.key});

  @override
  State<PloygoneScreen> createState() => _PloygoneScreenState();
}

class _PloygoneScreenState extends State<PloygoneScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex =
      const CameraPosition(target: LatLng(27.1767, 78.0081), zoom: 14.4746);

  final Set<Marker> _marekrs = {};
  Set<Polygon> _polygone = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(27.1767, 78.0081),
    LatLng(24.1767, 80.0081),
    LatLng(23.1767, 80.0081),
    LatLng(22.1767, 80.0081),
    LatLng(27.1767, 78.0081),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygone.add(Polygon(
        polygonId: PolygonId('1'),
        points: points,
        fillColor: Colors.red,
        strokeWidth: 4,
        geodesic: true,
        strokeColor: Colors.orange));
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
          polygons: _polygone,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
