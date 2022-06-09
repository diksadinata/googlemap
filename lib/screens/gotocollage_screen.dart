import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  _SimpleMapScreenState createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(34.04633684784594, -118.26758436735804), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(-8.116372673647, 115.0879686310941),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToUndiksha();
          },
          label: const Text("Google Maps"),
          icon: const Icon(Icons.location_history)),
    );
  }

  Future<void> goToUndiksha() async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));

    markers.add(const Marker(
        markerId: MarkerId(''), position: LatLng(-8.134813, 115.086222)));

    setState(() {});
  }
}
