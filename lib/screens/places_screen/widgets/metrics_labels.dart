import 'package:flutter/material.dart';

import '/models/place.dart';

class MetricsLabels extends StatelessWidget {
  const MetricsLabels(this.place, {super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "Voies\n",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                text: place.cliffNumber ?? "null",
                style: const TextStyle(fontSize: 22, color: Colors.black87),
              )
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: "Blocs\n",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                text: place.boulderNumber ?? "null",
                style: const TextStyle(fontSize: 22, color: Colors.black87),
              )
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/mountain_height2.png",
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${place.height.toString()}m",
              style: const TextStyle(fontSize: 24, color: Colors.black87),
            )
          ],
        ),
      ],
    );
  }
}
