import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Icon(
          icon,
          grade: 700,
          semanticLabel: label,
          size: 24,
        ),
      ],
    );
  }
}
