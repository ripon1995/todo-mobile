import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager_impl.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

late PreferenceManager _preferenceManager;
late ProfileController _profileController;

void main_app() {
  _preferenceManager = Get.put(PreferenceManagerImpl());
  _profileController = Get.put(ProfileController());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      color: Colors.red,
      debugShowCheckedModeBanner: false,
    ),
  );
}
