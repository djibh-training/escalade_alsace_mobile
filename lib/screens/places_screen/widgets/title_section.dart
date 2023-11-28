import 'package:flutter/material.dart';

import '/models/place.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(this.place, {super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.name,
                style: const TextStyle(
                    fontSize: 36,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                place.region,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
