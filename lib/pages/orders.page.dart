import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/services/api.dart';
import 'package:jokerge/widgets/listscreen.dart';
import 'package:jokerge/widgets/loader.dart';
import 'package:jokerge/widgets/order.card.dart';
import 'package:logger/logger.dart';

class OrdersPageController extends GetxController {
  final endpoint = API.getOrderList;
  final title = 'Orders'.obs;
}

class OrdersPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersPageController());
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrdersPageController>();

    return FutureBuilder(
      future: controller.endpoint(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Logger().e("failed to fetch orders from API", error: snapshot.error);
          return const Loader();
        }

        if (snapshot.hasData != true) {
          return const Loader();
        }

        final orders = snapshot.requireData.toList();

        return ListScreen(
          appBar: AppBar(
            title: Text(
              controller.title.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          crossAxisAligment: CrossAxisAlignment.center,
          items: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderCard(order: orders[index]);
              },
            ),
          ],
        );
      },
    );
  }
}
