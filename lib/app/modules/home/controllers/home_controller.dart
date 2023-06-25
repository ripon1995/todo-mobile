import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/network/create_to_do.dart';
import 'package:flutter_basic/app/network/get_user_to_to_list.dart';
import 'package:flutter_basic/app/network/update_to_do_item.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileController profileController = Get.find();
  TextEditingController createTaskTitleController = TextEditingController();
  TextEditingController createTaskDescriptionController =
      TextEditingController();
  TextEditingController createTaskStatusController = TextEditingController();
  RxBool createTaskIsCompleted = false.obs;
  RxList<Task> rxTaskList = RxList<Task>.empty(growable: true);
  RxBool isOnTapped = false.obs;
  RxList<int> colors = RxList<int>.generate(12, (_) => 0);

  void resetColors() {
    colors.replaceRange(
        0, colors.length, List.generate(colors.length, (index) => 0));
  }

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
      Get.snackbar("Oops!", "Could not add new task",
          snackPosition: SnackPosition.BOTTOM);
    }
    getToDoList();
  }

  void updateToDo(int taskId) async {
    Task? task = await updateToDoItem(
        taskId,
        createTaskTitleController.text,
        createTaskDescriptionController.text,
        createTaskStatusController.text,
        createTaskIsCompleted.value);
    if (task != null) {
      Get.snackbar("Congratulations!", "Task updated successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Oops!", "Could not update task",
          snackPosition: SnackPosition.BOTTOM);
    }
    getToDoList();
  }

  void getToDoList() async {
    List<Task> taskList = await getUserToDoList(_getUserIdFromPreference());
    rxTaskList.clear();
    rxTaskList.addAll(taskList);
    profileController.countCompletedAndInCompletedToDos(taskList);
  }

  int _getUserIdFromPreference() {
    return _preferenceManager.getInt(PreferenceManager.userId);
  }

  void setTextEditingControllerToUpdateToDoData(Task task) {
    createTaskTitleController.text = task.title!;
    createTaskDescriptionController.text = task.description!;
    createTaskStatusController.text = task.status!;
    createTaskIsCompleted.value = task.completed!;
  }
}
