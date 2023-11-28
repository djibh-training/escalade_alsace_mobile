import 'package:escalade_alsace_mobile/models/place.dart';
import 'package:flutter/material.dart';

class DecoratedLabel extends StatelessWidget {
  const DecoratedLabel(
    this._placeData, {
    required this.index,
    this.color,
    this.borderColor,
    this.textColor,
  });

  final dynamic _placeData;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? const Color.fromRGBO(230, 247, 255, 1),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(
          width: 2,
          color: borderColor ?? const Color(0xff91d5ff),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: Text(
          (_placeData.length > 0) ? _placeData[index] : "n/a",
          style: TextStyle(
              color: textColor ?? const Color(0xFF096dd9),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
