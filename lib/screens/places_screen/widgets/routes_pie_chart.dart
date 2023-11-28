import 'package:flutter/material.dart';

import '/widgets/indicator.dart';
import '/models/place_route.dart';
import '/screens/places_screen/widgets/circular_chart.dart';

class RoutesPieChart extends StatelessWidget {
  RoutesPieChart(this.routes, {super.key});

  final List<PlaceRoute> routes;
  final List<String> routesGlobalLevels = [];
  final Map chartSections = <String, double>{};
  final List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.redAccent
  ];
  late final List<dynamic> sortedKeys = chartSections.keys.toList()..sort();

  @override
  Widget build(BuildContext context) {
    for (var route in routes) {
      var newRoute = route.globalLevel;
      routesGlobalLevels.add(newRoute);
    }

    for (var globalLevel in routesGlobalLevels) {
      (chartSections[globalLevel] != null)
          ? chartSections[globalLevel]++
          : chartSections[globalLevel] = 1.0;
    }

    double sumLevels = chartSections.values
        .fold<double>(0, ((previousValue, element) => previousValue + element));

    String indicatorPercentText(value) {
      var percentValue = value / sumLevels * 100;
      String percentText = "${percentValue.round()}%";
      return percentText;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(40, 40, 40, 1),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            // Charts
            CircularChart(chartSections),
            const SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(chartSections.length, (idx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Indicator(
                      color: colors[idx],
                      text: "Niveau ${sortedKeys[idx]}",
                      isSquare: false,
                    ),
                    Text(
                      indicatorPercentText(chartSections[sortedKeys[idx]]),
                      style: const TextStyle(color: Colors.white70),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
