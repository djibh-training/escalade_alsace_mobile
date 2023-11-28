import 'package:flutter/material.dart';

class DestinationButton extends StatelessWidget {
  const DestinationButton(this._onPressed, {super.key});

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: FloatingActionButton.extended(
        onPressed: _onPressed,
        label: const Text(
          'Itinéraire',
          style: TextStyle(fontSize: 22),
        ),
        icon: const Icon(
          Icons.assistant_navigation,
        ),
      ),
    );
  }
}
