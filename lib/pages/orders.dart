import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokerge/services/api.dart';
import 'package:jokerge/widgets/list_screen.dart';
import 'package:jokerge/widgets/loader.dart';
import 'package:jokerge/widgets/order_list.dart';
import 'package:logger/logger.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: API.getOrderList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Logger().e("failed to load orders", error: snapshot.error);
          return const Loader();
        }

        if (!snapshot.hasData) {
          Logger().w("snapshot doesn't have ant orders");
          return const Loader();
        }

        return ListScreen(
          items: [
            OrderList(
              orders: snapshot.requireData.toList(),
            )
          ],
        );
      },
    );
  }
}
