import 'package:flutter/material.dart';
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
            ElevatedButton(
              onPressed: () {
                // TODO: Implement update functionality
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
