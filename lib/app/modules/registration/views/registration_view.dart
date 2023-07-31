import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/registration/controllers/registration_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:flutter_basic/app/utils/custom_clip_path.dart';
import 'package:flutter_basic/app/utils/elevated_button_decoration.dart';
import 'package:flutter_basic/app/utils/input_decoration.dart';
import 'package:flutter_basic/app/utils/return_button.dart';
import 'package:get/get.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClip(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[500],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 500,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: ReturnButton(onTap: null),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.list_alt,
                        size: 40,
                        color: Colors.white,
                      ),
                      Text(
                        'Welcome to ToDo!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: usernameController,
                      decoration: inputDecorationLoginPage(
                        Icons.person_outline,
                        "username",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecorationLoginPage(
                        Icons.email_outlined,
                        "email",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: true,
                      decoration: inputDecorationLoginPage(
                        Icons.password_outlined,
                        "password",
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomElevatedButton(
                    text: "Register",
                    onPressed: _registerButtonAction,
                    iconData: Icons.app_registration_outlined,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _registerButtonAction() async {
    dynamic status = await controller.registerUser(
      usernameController.text,
      emailController.text,
      passwordController.text,
    );
    if (status == true) {
      Get.snackbar('Congrats!', 'Registration successful');
      Get.offNamed(Routes.LOGIN);
    }
  }
}
