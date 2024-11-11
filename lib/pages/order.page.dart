import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/utils/color_by_status.dart';
import 'package:jokerge/widgets/listscreen.dart';
import 'package:jokerge/widgets/product.grid.dart';

class OrderPage extends StatelessWidget {
  final Order order;
  const OrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListScreen(
      crossAxisAligment: CrossAxisAlignment.start,
      appBar: AppBar(
        title: Text(
          "Order #${order.id}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      items: [
        Center(
          child: Text(
            order.status,
            style: TextStyle(
              fontSize: 20,
              color: colorByStatus(order.status),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: ProductList(products: order.products),
        ),
      ],
    );
  }
}
