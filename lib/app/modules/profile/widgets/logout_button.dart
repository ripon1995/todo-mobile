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
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: _onPressedAction,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onPressedAction() {
    _loginController.clearSessionInfo();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }
}
