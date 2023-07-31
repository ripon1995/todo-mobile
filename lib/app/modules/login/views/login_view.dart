import 'package:flutter/material.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/utils/custom_clip_path.dart';
import 'package:flutter_basic/app/utils/elevated_button_decoration.dart';
import 'package:flutter_basic/app/utils/input_decoration.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[500],
                  ),
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.list_alt_outlined,
                        size: 40,
                      ),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      cursorColor: Colors.deepPurple[700],
                      controller: emailController,
                      decoration: inputDecorationLoginPage(
                        Icons.mail_outline,
                        "Email",
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
                    child: TextField(
                      cursorColor: Colors.deepPurple[700],
                      obscureText: true,
                      controller: passwordController,
                      decoration: inputDecorationLoginPage(
                        Icons.password_outlined,
                        "Password",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: _loginButtonAction,
                    iconData: Icons.login_outlined,
                  ),
                  const SizedBox(
                    height: 20,
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
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Register',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
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


