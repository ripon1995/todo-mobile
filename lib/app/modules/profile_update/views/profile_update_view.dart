import 'package:flutter/material.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';

class ProfileUpdateView extends GetView<ProfileUpdateController> {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileUpdateView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.usernameController,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.emailController,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Obx(
              () => controller.enableLoader.isFalse
                  ? ElevatedButton(
                      onPressed: () => _updateButtonOnPressedAction(context),
                      child: const Text('Update'),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
            )
          ],
        ),
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
