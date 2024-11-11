import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/utils/color_by_status.dart';
import 'package:jokerge/widgets/app_bar.dart';
import 'package:jokerge/widgets/list_screen.dart';
import 'package:jokerge/widgets/product_list.dart';
import 'package:jokerge/widgets/product_list_item.dart';

class OrderPage extends StatelessWidget {
  final Order order;
  const OrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListScreen(
      crossAxisAligment: CrossAxisAlignment.start,
      appBar: screenAppBar(context),
      items: [
        Text(
          "Order #${order.id}",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          order.status,
          style: TextStyle(
            fontSize: 16,
            color: colorByStatus(order.status),
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
