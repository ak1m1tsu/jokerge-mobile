import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jokerge/pages/login.dart';
import 'package:jokerge/pages/navigation.dart';
import 'package:jokerge/services/cache.dart';

Widget _defaultScreen = LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (await AccountCache.getCredentials() != null) {
    _defaultScreen = const NavigationMenu();
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      routes: {
        "/": (context) => _defaultScreen,
        "/home": (context) => const NavigationMenu(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
