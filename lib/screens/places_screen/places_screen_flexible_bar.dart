import 'package:flutter/material.dart';

class PlacesScreenFlexibleBar extends StatelessWidget {
  const PlacesScreenFlexibleBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 1.1,
      title: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(90),
          ),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Recherche...",
            prefixIcon: Icon(Icons.search_rounded),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
