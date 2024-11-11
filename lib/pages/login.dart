import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/services/api.dart';
import 'package:jokerge/services/cache.dart';
import 'package:jokerge/widgets/login_button.dart';
import 'package:jokerge/widgets/login_textfiled.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // the user log in method
  logUserIn(context) {
    return () async {
      EasyLoading.show(status: "loading...");

      var creds = AccountCredentials(
        email: usernameController.text,
        password: passwordController.text,
      );

      var ok = await API.login(creds);

      EasyLoading.dismiss();

      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid login credentials"),
          ),
        );
        return;
      }

      await AccountCache.setCredentials(creds);
      Navigator.restorablePushNamedAndRemoveUntil(
        context,
        "/home",
        (route) => false,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // Password
              LoginTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),
              // Log In button
              LoginButton(
                onTap: logUserIn(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
