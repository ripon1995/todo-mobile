import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager_impl.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';
import 'package:flutter_basic/app/modules/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PreferenceManager>(PreferenceManagerImpl());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ProfileUpdateController());
  }
}
