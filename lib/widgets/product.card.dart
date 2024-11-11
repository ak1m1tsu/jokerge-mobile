import 'package:flutter/material.dart';
import 'package:jokerge/models/models.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Card(
        child: ListTile(
          title: Text(
            "test",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
