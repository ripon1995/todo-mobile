import 'package:flutter/material.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loginButtonAction(),
              child: const Text('Login'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () => _registerButtonAction(),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _loginButtonAction() async {
    dynamic status = await controller.loginUser(
      emailController.text,
      passwordController.text,
    );
    if (status == true) {
      Get.snackbar(
        "Congratulation",
        "Login successful",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.toNamed(Routes.HOME);
    }
  }

  void _registerButtonAction() {
    Log.debug("Registration button pressed");
    Get.toNamed(Routes.REGISTRATION);
  }
}
