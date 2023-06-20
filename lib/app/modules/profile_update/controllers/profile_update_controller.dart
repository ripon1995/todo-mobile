import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';

class ProfileUpdateController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();

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
}
