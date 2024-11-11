import 'package:flutter/material.dart';
import 'package:jokerge/utils/color_by_status.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: colorByStatus(status),
      largeSize: 20,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Text(
        status,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
