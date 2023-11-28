import 'package:escalade_alsace_mobile/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/opener.dart';
import '../models/place.dart';
import '../models/place_route.dart';

Future<List<Opener>> fetchOpeners(http.Client client) async {
  final url = ApiConstants.openersUrl();
  final response = await client.get(Uri.parse(url));
  return compute(parseOpeners, response.body);
}

Future<List<Place>> fetchPlaces(http.Client client) async {
  final url = ApiConstants.placesUrl();
  final response = await client.get(Uri.parse(url));
  return compute(parsePlaces, response.body);
}

Future<List<PlaceRoute>> fetchRoutes(http.Client client, int placeId) async {
  final url = ApiConstants.routesUrl(placeId);
  final response = await client.get(Uri.parse(url));
  return compute(parseRoutes, response.body);
}
