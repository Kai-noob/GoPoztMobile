import 'package:flutter/material.dart';
import 'package:mengo_delivery/utils/app_colors.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
