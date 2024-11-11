import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/pages/home.page.dart';
import 'package:jokerge/pages/login.page.dart';
import 'package:jokerge/services/cache.dart';

String _defaultRoute = "/login";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (await AccountCache.getCredentials() != null) {
    _defaultRoute = "/home";
  }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: _defaultRoute,
    getPages: [
      GetPage(
        name: "/home",
        page: () => const HomePage(),
        binding: HomePageBindings(),
      ),
      GetPage(
        name: "/login",
        page: () => const LoginPage(),
        binding: LoginPageBindings(),
      )
    ],
  ));
}
