import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/widgets/app_bar.dart';
import 'package:jokerge/widgets/list_screen.dart';

class OrderPage extends StatefulWidget {
  final Order order;
  const OrderPage({super.key, required this.order});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return ListScreen(
      appBar: screenAppBar(context),
      items: const [],
    );
  }
}
