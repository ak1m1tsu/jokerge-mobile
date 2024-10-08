import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/widgets/order_list_item.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;
  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderListItem(order: orders[index]);
      },
    );
  }
}
