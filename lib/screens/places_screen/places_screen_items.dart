import 'package:flutter/material.dart';

class PlacesScreenItem extends StatelessWidget {
  const PlacesScreenItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.cliffOrBoulderQuantity,
    required this.trailing,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String cliffOrBoulderQuantity;
  final String trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 140,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      cliffOrBoulderQuantity.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.landscape),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      trailing,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
