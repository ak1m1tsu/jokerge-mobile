import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Widget> items;
  final AppBar? appBar;
  final CrossAxisAlignment crossAxisAligment;

  const ListScreen({
    super.key,
    required this.items,
    required this.crossAxisAligment,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAligment,
              children: items,
            ),
          ),
        ),
      ),
    );
  }
}
