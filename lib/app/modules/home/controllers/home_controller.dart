import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/models/todo.dart';
import 'package:flutter_basic/app/data/remote/to_do_delete_response.dart';
import 'package:flutter_basic/app/data/remote/todo_paginated_response.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/network/profile/device_token_update.dart';
import 'package:flutter_basic/app/network/todo/create_to_do.dart';
import 'package:flutter_basic/app/network/todo/delete_todo_item.dart';
import 'package:flutter_basic/app/network/todo/get_user_to_to_list.dart';
import 'package:flutter_basic/app/network/todo/update_to_do_item.dart';
import 'package:flutter_basic/app/utils/constants.dart';
import 'package:flutter_basic/app/utils/enum_status.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileController profileController = Get.find();
  TextEditingController createTaskTitleController = TextEditingController();
  TextEditingController createTaskDescriptionController =
      TextEditingController();
  TextEditingController createTaskStatusController = TextEditingController();
  RxBool createTaskIsCompleted = false.obs;
  RxList<ToDo> rxToDoList = RxList<ToDo>.empty(growable: true);
  Rx<Status> rxStatus = Rx<Status>(Status.newTask);
  RxString rxToDoListNext = "".obs;
  RxBool isOnTapped = false.obs;

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
    ToDo? task = await createToDoItem(
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
    ToDo? task = await updateToDoItem(
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
  }

  void deleteToDo(int taskId) async {
    ToDoDeleteResponse? res = await deleteToDoItem(taskId);
    if (res!.message!.contains("success")) {
      Get.snackbar("Congratulations!", "Task deleted successfully!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } else {
      Get.snackbar("Oops!", "Could not delete task",
          snackPosition: SnackPosition.BOTTOM);
    }
    getToDoList();
  }

  void getToDoList() async {
    int pageNumber = defaultPage;
    if (rxToDoListNext.value.isNotEmpty) {
      String pageNumberString = rxToDoListNext.value.split("page=")[1];
      pageNumber = int.parse(pageNumberString);
    }
    ToDoListPaginatedResponse toDoListPaginatedResponse =
        await getUserToDoList(pageNumber);
    if (pageNumber == 1) {
      rxToDoList.clear();
    }
    rxToDoList.addAll(toDoListPaginatedResponse.results!);
    rxToDoListNext.value = toDoListPaginatedResponse.next ?? "";
    profileController
        .countCompletedAndInCompletedToDos(toDoListPaginatedResponse.results!);
  }

  void updateUserDeviceToken() async {
    await deviceTokenUpdate(
        _getUserIdFromPreference(), _getDeviceTokenFromPreference());
  }

  int _getUserIdFromPreference() {
    return _preferenceManager.getInt(PreferenceManager.userId);
  }

  String _getDeviceTokenFromPreference() {
    return _preferenceManager.getString(PreferenceManager.deviceToken);
  }

  void setTextEditingControllerToUpdateToDoData(ToDo task) {
    createTaskTitleController.text = task.title!;
    createTaskDescriptionController.text = task.description!;
    createTaskStatusController.text = task.status!;
    createTaskIsCompleted.value = task.completed!;
  }

  void handleStatusChange(Status status) {
    rxStatus.value = status;
  }
}
