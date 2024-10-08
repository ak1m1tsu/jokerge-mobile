import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokerge/pages/orders.dart';

class NavigationLayout extends StatefulWidget {
  const NavigationLayout({super.key});

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  int currentPageIndex = 0;
  List<Widget> pages = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jokerge",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: currentPageIndex,
        indicatorColor: CupertinoColors.systemCyan,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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
      body: pages[currentPageIndex],
    );
  }
}
