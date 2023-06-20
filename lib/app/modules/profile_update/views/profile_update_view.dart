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
      body: Center(
        child: Text(
          'ProfileUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
