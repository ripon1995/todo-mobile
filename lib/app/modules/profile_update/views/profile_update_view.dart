import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/utils/custom_clip_path.dart';
import 'package:flutter_basic/app/utils/input_decoration.dart';
import 'package:flutter_basic/app/utils/return_button.dart';
import 'package:get/get.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';

class ProfileUpdateView extends GetView<ProfileUpdateController> {
  const ProfileUpdateView({Key? key}) : super(key: key);

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
                color: Colors.deepPurple[400],
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: Colors.deepPurple[700],
                      controller: controller.usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: inputDecoration(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: Colors.deepPurple[700],
                      controller: controller.emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: inputDecoration(Icons.mail_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: Colors.deepPurple[700],
                      controller: controller.passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: inputDecoration(Icons.password_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => controller.enableLoader.isFalse
                        ? SizedBox(
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple[300],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () =>
                                  _updateButtonOnPressedAction(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.update_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Update'),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepPurple[300],
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: ReturnButton(
                onTap: null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateButtonOnPressedAction(BuildContext context) async {
    dynamic status = await controller.updateProfile();
    if (status == true) {
      ProfileController profileController = Get.find();
      profileController.profile();
      Future.delayed(
              const Duration(seconds: 0),
              () => Get.snackbar("Congratulations!", "Update successful",
                  snackPosition: SnackPosition.BOTTOM))
          .whenComplete(() => Navigator.of(context).pop());
    } else {
      Future.delayed(const Duration(seconds: 0),
              () => Get.snackbar("Congratulations!", "Update successful"))
          .whenComplete(() => Navigator.of(context).pop());
    }
  }
}
