import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/pages/order.page.dart';
import 'package:jokerge/widgets/order.status.badge.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          order.info(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: OrderStatusBadge(status: order.status),
        onTap: () {
          Get.to(() => OrderPage(order: order));
        },
      ),
    );
  }
}
