import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [_profileIcon()],
      ),
      body: const Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void _profileButtonAction() {
    controller.profileController.profile();
    controller.profileController.getToDoList();
    Get.toNamed(Routes.PROFILE);
  }

  Widget _profileIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        onPressed: _profileButtonAction,
        icon: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
