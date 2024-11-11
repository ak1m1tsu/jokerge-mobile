import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/pages/orders.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var currentIndex = 0.obs;
  final pages = ["/orders", "/customers", "/products", "/profile"];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/orders') {
      return GetPageRoute(
        settings: settings,
        page: () => const OrdersPage(),
        binding: OrdersBindings(),
      );
    }

    if (settings.name == '/customers') {
      return GetPageRoute(
        settings: settings,
        page: () => Card(
          child: Text("customers"),
        ),
      );
    }

    if (settings.name == '/products') {
      return GetPageRoute(
        settings: settings,
        page: () => Card(
          child: Text("products"),
        ),
      );
    }

    if (settings.name == "/profile") {
      return GetPageRoute(
        settings: settings,
        page: () => Card(
          child: Text("profile"),
        ),
      );
    }

    return null;
  }
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: "/orders",
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Customers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "products",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
          ],
        ),
      ),
    );
  }
}
