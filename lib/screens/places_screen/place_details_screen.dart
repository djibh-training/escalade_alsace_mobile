import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../places_screen/widgets/decorated_label.dart';
import '../places_screen/widgets/destination_button.dart';
import '../places_screen/widgets/metrics_labels.dart';
import '../places_screen/widgets/routes_pie_chart.dart';
import '../places_screen/widgets/title_section.dart';
import '../places_screen/place_route_details_screen.dart';
import '../places_screen/place_route_path.dart';
import '/models/place.dart';
import '/models/place_route.dart';
import '/services/loaders.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen(this.place, {super.key});

  final Place place;

  void selectDestination(BuildContext ctx, Place place) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return RoutePath(
              placeName: place.name,
              placeLat: double.parse(place.latitude ?? "0.0"),
              placeLong: double.parse(place.longitude ?? "0.0"));
        },
      ),
    );
  }

  void selectPlaceRoute(BuildContext ctx, PlaceRoute route, Place place) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return PlaceRouteDetailsScreen(route, place);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              // Liste des voies et blocs
              FutureBuilder<List<PlaceRoute>?>(
                future: fetchRoutes(http.Client(), place.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var routeList = snapshot.data!;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Titre et chart
                              TitleSection(place),
                              RoutesPieChart(routeList),
                              MetricsLabels(place),
                              const SizedBox(
                                height: 20,
                              ),
                              // Custom labels expositions - type de roche/voie
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DecoratedLabel(place.rockTypes["expositions"],
                                      index: 0),
                                  DecoratedLabel(
                                    place.rockTypes["rock"],
                                    index: 0,
                                    color: const Color.fromRGBO(255, 149, 0, 1),
                                    textColor: Colors.white,
                                    borderColor: Colors.transparent,
                                  ),
                                  DecoratedLabel(
                                    place.rockTypes["rock"],
                                    index: 1,
                                    color: const Color.fromRGBO(255, 45, 85, 1),
                                    borderColor: Colors.transparent,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        DestinationButton(
                            () => selectDestination(context, place)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                PlaceRoute route = snapshot.data![index];
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      selectPlaceRoute(context, route, place);
                                    },
                                    title: Text(route.name),
                                    subtitle: Text(route.type),
                                    trailing: Text(route.level),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
