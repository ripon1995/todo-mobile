import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/remote/login_response.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/home/views/home_view.dart';
import 'package:flutter_basic/app/network/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();

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
      return true;
    }
    return false;
  }

  void _setLoginDataInPreferenceManager(LoginResponse? loginResponse) {
    _preferenceManager.setString(
        PreferenceManager.accessToken, loginResponse!.accessToken!);
    _preferenceManager.setString(
        PreferenceManager.refreshToken, loginResponse.refreshToken!);
  }
}
