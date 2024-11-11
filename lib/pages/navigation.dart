import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/pages/orders.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: controller.screens[controller.selectedIndex.value],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          "Jokerge",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          indicatorColor: Colors.white,
          backgroundColor: Colors.grey[200],
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.doc_append,
                size: 30,
              ),
              label: "Orders",
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.person_2,
                size: 30,
              ),
              label: "Customers",
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.square_list,
                size: 30,
              ),
              label: "Porducts",
            ),
            NavigationDestination(
              icon: Icon(
                CupertinoIcons.person,
                size: 30,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const OrdersPage(),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Customer page',
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Product page',
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Profile page',
          ),
        ),
      ),
    ),
  ];
}
