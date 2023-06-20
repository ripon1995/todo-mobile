import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';
import 'package:flutter_basic/app/network/get_profile.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileUpdateController profileUpdateController =
      Get.put(ProfileUpdateController());

  RxString username = "".obs;

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

  void _setProfileInfoInPreferenceManager(dynamic profile) {
    _preferenceManager.setString(PreferenceManager.userName, profile!.username);
    _preferenceManager.setInt(PreferenceManager.userId, profile!.id);
    _preferenceManager.setString(PreferenceManager.email, profile!.email);
    _preferenceManager.setString(PreferenceManager.password, profile!.password);
  }
}
