import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  final LoginController _loginController = Get.find();

  LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressedAction,
      child: const Text(
        'Logout',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _onPressedAction() {
    _loginController.clearSessionInfo();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }
}
