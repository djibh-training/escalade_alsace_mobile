import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/place.dart';
import 'place_details_screen.dart';
import '/screens/places_screen/places_screen_flexible_bar.dart';
import '/screens/places_screen/places_screen_items.dart';
import '/services/loaders.dart';
import '/widgets/error_screen.dart';
import '/utils/string_extension.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  void initState() {
    super.initState();
  }

  void selectPlace(BuildContext ctx, place) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return PlaceDetailsScreen(place);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>?>(
        future: fetchPlaces(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            var sliverList = SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var place = snapshot.data![index];
                  int cliffOrBoulderQuantity =
                      int.parse(place.cliffNumber ?? "0") +
                          int.parse(place.boulderNumber ?? "0");
                  return Card(
                    elevation: 0,
                    child: PlacesScreenItem(
                      title: place.name,
                      subtitle: place.region,
                      trailing: place.types.capitalize(),
                      cliffOrBoulderQuantity: cliffOrBoulderQuantity.toString(),
                      onTap: (() {
                        selectPlace(context, place);
                      }),
                    ),
                  );
                },
                childCount: snapshot.data?.length,
              ),
            );

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverAppBar(
                      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: 150.0,
                      flexibleSpace: PlacesScreenFlexibleBar(
                        title: "Sites",
                      ),
                    ),
                    sliverList,
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorScreen(
              contextError: snapshot.error.toString(),
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }
}
