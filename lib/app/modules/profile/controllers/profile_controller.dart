import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';
import 'package:flutter_basic/app/network/get_profile.dart';
import 'package:flutter_basic/app/network/get_user_to_to_list.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileUpdateController profileUpdateController = Get.find();

  RxString username = "".obs;
  RxInt completedTotal = 0.obs;
  RxInt completedPercentage = 0.obs;
  RxInt inCompletedTotal = 0.obs;
  RxInt inCompletedPercentage = 0.obs;
  RxList<Task> rxTaskList = RxList<Task>.empty(growable: true);

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

  void profile() async {
    Profile? profile = await getProfile();
    if (profile != null) {
      Log.debug(profile.username!);
      username.value = profile.username!;
      _setProfileInfoInPreferenceManager(profile);
    }
  }

  void getToDoList() async {
    List<Task> taskList = await getUserToDoList(_getUserIdFromPreference());
    rxTaskList.addAll(taskList);
    _countCompletedAndInCompletedToDos(taskList);
  }

  void _setProfileInfoInPreferenceManager(dynamic profile) {
    _preferenceManager.setString(PreferenceManager.userName, profile!.username);
    _preferenceManager.setInt(PreferenceManager.userId, profile!.id);
    _preferenceManager.setString(PreferenceManager.email, profile!.email);
    _preferenceManager.setString(PreferenceManager.password, profile!.password);
  }

  int _getUserIdFromPreference() {
    return _preferenceManager.getInt(PreferenceManager.userId);
  }

  void _countCompletedAndInCompletedToDos(List<Task> taskList) {
    int completed = 0;
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].completed == true) {
        completed++;
      }
    }
    completedTotal.value = completed;
    inCompletedTotal.value = taskList.length - completed;
  }
}
