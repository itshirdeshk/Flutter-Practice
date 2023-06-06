import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NetworkImageMarker extends StatefulWidget {
  const NetworkImageMarker({super.key});

  @override
  State<NetworkImageMarker> createState() => _NetworkImageMarkerState();
}

class _NetworkImageMarkerState extends State<NetworkImageMarker> {
  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex =
      const CameraPosition(target: LatLng(27.1767, 78.0081), zoom: 14.4746);

  final List<Marker> _marekrs = [];

  List<LatLng> latlng = [
    const LatLng(27.1767, 78.0081),
    const LatLng(22.1767, 80.0081),
    const LatLng(23.1767, 80.0081),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < latlng.length; i++) {
      Uint8List? image = await loadNetWorkImage(
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg');

      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
        image.buffer.asUint8List(),
        targetHeight: 100,
        targetWidth: 100,
      );

      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData =
          await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);

      final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();

      _marekrs.add(
        Marker(
            markerId: MarkerId(
              i.toString(),
            ),
            position: latlng[i],
            infoWindow: const InfoWindow(
                title: 'Really Cool Place', snippet: '5 star rating'),
            icon: BitmapDescriptor.fromBytes(resizedImageMarker)),
      );
      setState(() {});
    }
  }

  Future<Uint8List> loadNetWorkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);

    image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));

    final imageInfo = await completer.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ploygone"),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_marekrs),
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
