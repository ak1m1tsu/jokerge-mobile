import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/pages/orders.page.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();

  var currentIndex = 0.obs;
  var title = "Jokerge".obs;

  final pages = ["/orders", "/customers", "/products", "/profile"];

  void changePage(int index) {
    if (index == currentIndex.value) {
      return;
    }

    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1, preventDuplicates: true);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/orders') {
      return GetPageRoute(
        settings: settings,
        page: () => const OrdersPage(),
        binding: OrdersPageBindings(),
        popGesture: true,
      );
    }

    return null;
  }
}

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: "/orders",
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.grey[900],
        useLegacyColorScheme: false,
        iconSize: 32,
        showSelectedLabels: false,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bag,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_2,
            ),
            label: "Customers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_bullet,
            ),
            label: "products",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.gear,
            ),
            label: "settings",
          ),
        ],
      ),
    );
  }
}
