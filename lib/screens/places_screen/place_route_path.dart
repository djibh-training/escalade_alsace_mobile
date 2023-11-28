import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutePath extends StatefulWidget {
  const RoutePath({
    super.key,
    required this.placeName,
    required this.placeLat,
    required this.placeLong,
  });

  final String placeName;
  final double placeLat;
  final double placeLong;

  @override
  State<RoutePath> createState() => _RoutePathState();
}

class _RoutePathState extends State<RoutePath> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(widget.placeLat, widget.placeLong),
      zoom: 14,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.placeName),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
