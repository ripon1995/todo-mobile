import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/profile_username_update.dart';
import 'package:get/get.dart';

class ProfileUpdateController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  RxBool enableLoader = false.obs;

  RxString username = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
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

  void updateVariable() {
    _profileInfoFromPreference();
    _updateTextController();
  }

  Future<bool> updateProfile() async {
    enableLoader.value = true;
    Profile? profile = await updateProfileUsername(
      _preferenceManager.getInt(PreferenceManager.userId),
      usernameController.text,
    );

    if (profile != null) {
      _updateProfileInfoInPreferenceManager(profile);
      enableLoader.value = false;
      return true;
    }
    enableLoader.value = false;
    return false;
  }

  void _profileInfoFromPreference() {
    username.value = _preferenceManager.getString(PreferenceManager.userName);
    email.value = _preferenceManager.getString(PreferenceManager.email);
    password.value = _preferenceManager.getString(PreferenceManager.password);
  }

  void _updateTextController() {
    usernameController.text = username.value;
    emailController.text = email.value;
    passwordController.text = password.value;
  }

  void _updateProfileInfoInPreferenceManager(dynamic profile) {
    _preferenceManager.setString(PreferenceManager.userName, profile!.username);
    _preferenceManager.setInt(PreferenceManager.userId, profile!.id);
    _preferenceManager.setString(PreferenceManager.email, profile!.email);
    _preferenceManager.setString(PreferenceManager.password, profile!.password);
  }
}
