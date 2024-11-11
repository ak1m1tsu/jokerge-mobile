import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/pages/order.dart';
import 'package:jokerge/widgets/order_status_badge.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  const OrderListItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        child: ListTile(
          title: Text(
            order.info(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: OrderStatusBadge(status: order.status),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(order: order),
              ),
            );
          },
        ),
      ),
    );
  }
}
