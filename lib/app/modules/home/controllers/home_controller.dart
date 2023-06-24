import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProfileController profileController = Get.find();
  TextEditingController createTaskTitleController = TextEditingController();
  TextEditingController createTaskDescriptionController =
      TextEditingController();
  RxBool createTaskStatus = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
