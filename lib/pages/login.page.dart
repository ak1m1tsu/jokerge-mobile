import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/services/api.dart';
import 'package:jokerge/services/cache.dart';
import 'package:jokerge/widgets/login.button.dart';
import 'package:jokerge/widgets/login.textfield.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}

class LoginPageController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  logIn(context) {
    return () async {
      var creds = AccountCredentials(
        email: username.text,
        password: password.text,
      );

      var ok = await API.login(creds);

      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid login credentials"),
          ),
        );
        return;
      }

      await AccountCache.setCredentials(creds);
      Get.toNamed("/home");
    };
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginPageController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Logo
              const Icon(
                CupertinoIcons.lock_circle,
                size: 100,
              ),
              const SizedBox(height: 50),
              // Welcome text
              Text(
                "Welcome back you've been missed",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              // Login
              LoginTextField(
                controller: controller.username,
                hintText: "Username",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // Password
              LoginTextField(
                controller: controller.password,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),
              // Log In button
              LoginButton(
                onTap: controller.logIn(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
