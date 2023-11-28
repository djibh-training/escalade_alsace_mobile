import 'dart:convert';

class Place {
  final int id;
  final String name;
  final String region;
  final String? longitude;
  final String? latitude;
  final String types;
  final Map<String, dynamic> rockTypes;
  final String? exposition;
  final int? height;
  final String? cliffNumber;
  final String? boulderNumber;

  const Place({
    required this.id,
    required this.name,
    required this.region,
    this.longitude,
    this.latitude,
    required this.types,
    required this.rockTypes,
    this.exposition,
    this.height,
    this.cliffNumber,
    this.boulderNumber,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'] as int,
        name: json['place_name'] as String,
        region: json['region'] as String,
        longitude: json['longitude'],
        latitude: json['latitude'],
        types: json['place_type'] ?? "",
        rockTypes: json['types'] ?? "",
        exposition: json['exposition'] ?? "",
        height: json['height'] ?? 0,
        cliffNumber: json['cliff_number'] ?? "",
        boulderNumber: json['boulder_number'] ?? "");
  }
}

List<Place> parsePlaces(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Place>((json) => Place.fromJson(json)).toList();
}
