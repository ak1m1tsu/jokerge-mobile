import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Widget> items;
  final AppBar? appBar;
  const ListScreen({super.key, required this.items, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ),
      ),
    );
  }
}
