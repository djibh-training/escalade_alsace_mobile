import 'dart:convert';

class PlaceRoute {
  final int id;
  final String name;
  final String? style;
  final String type;
  final String? legend;
  final bool isShinny;
  final int placeId;
  final int quotationId;
  final String level;
  final String globalLevel;
  final int translatedLevel;

  const PlaceRoute({
    required this.id,
    required this.name,
    this.style,
    required this.type,
    this.legend,
    required this.isShinny,
    required this.placeId,
    required this.quotationId,
    required this.level,
    required this.globalLevel,
    required this.translatedLevel,
  });

  factory PlaceRoute.fromJson(Map<String, dynamic> json) {
    return PlaceRoute(
        id: json['id'],
        name: json['route_name'],
        style: json['style'],
        type: json['route_type'],
        legend: json['legend'],
        isShinny: json['is_shinny'],
        placeId: json['place_id'],
        quotationId: json['quotation_id'],
        level: json['level'],
        globalLevel: json['global_level'],
        translatedLevel: json['translated_level']);
  }
}

List<PlaceRoute> parseRoutes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PlaceRoute>((json) => PlaceRoute.fromJson(json)).toList();
}
