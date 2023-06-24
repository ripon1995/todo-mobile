import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/remote/login_response.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/network/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  final ProfileController _profileController = Get.find();

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

  Future<bool> loginUser(String email, String password) async {
    LoginResponse? loginResponse = await login(email, password);
    if (loginResponse != null) {
      _setLoginDataInPreferenceManager(loginResponse);
      _profileController.profile();
      return true;
    }
    return false;
  }

  void _setLoginDataInPreferenceManager(LoginResponse? loginResponse) {
    _preferenceManager.setString(
        PreferenceManager.accessToken, loginResponse!.accessToken!);
    _preferenceManager.setString(
        PreferenceManager.refreshToken, loginResponse.refreshToken!);
    _preferenceManager.setBool(PreferenceManager.isLoggedIn, true);
  }

  void clearSessionInfo() {
    _clearSharedPreferenceValue();
  }

  void _clearSharedPreferenceValue() {
    _preferenceManager.remove(PreferenceManager.refreshToken);
    _preferenceManager.remove(PreferenceManager.accessToken);
  }
}
