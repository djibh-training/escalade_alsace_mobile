import 'package:flutter/material.dart';

import '/models/place_route.dart';
import '/models/place.dart';

class PlaceRouteDetailsScreen extends StatelessWidget {
  const PlaceRouteDetailsScreen(this.route, this.place, {super.key});

  final PlaceRoute route;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route.name),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text("Type : ${route.type}"),
          Text("Cotation : ${route.level}"),
          Text("Site : ${place.name}"),
          const Text("Note : 3/5"),
        ],
      ),
    );
  }
}
