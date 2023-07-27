import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  final LoginController _loginController = Get.find();

  LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: _onPressedAction,
        icon: const Icon(Icons.logout_outlined),
        iconSize: 30,
        color: Colors.black,
      ),
    );
  }

  void _onPressedAction() {
    _loginController.clearSessionInfo();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }
}
