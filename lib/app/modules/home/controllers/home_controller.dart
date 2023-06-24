import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/network/create_to_do.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileController profileController = Get.find();
  TextEditingController createTaskTitleController = TextEditingController();
  TextEditingController createTaskDescriptionController =
      TextEditingController();
  TextEditingController createTaskStatusController = TextEditingController();
  RxBool createTaskIsCompleted = false.obs;

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

  void createToDo() async {
    Task? task = await createToDoItem(
      _preferenceManager.getInt(PreferenceManager.userId),
      createTaskTitleController.text,
      createTaskDescriptionController.text,
      createTaskStatusController.text,
      createTaskIsCompleted.value,
    );
    if (task != null) {
      Get.snackbar("Congratulations!", "New task added successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Oops!", "Could not added new task",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
