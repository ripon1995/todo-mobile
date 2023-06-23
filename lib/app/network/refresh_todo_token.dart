import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

Future<void> refreshToDoToken() async {
  PreferenceManager preferenceManager = Get.find();
  LoginController loginController = Get.find();

  try {
    dynamic dioCall = await DioProvider.dioClientWithRefreshToken
        .post("https://todobackendjune.onrender.com/token/refresh/",
            data: requestBody(
              preferenceManager.getString(PreferenceManager.refreshToken),
            ));

    if (dioCall != null) {
      preferenceManager.setString(
          PreferenceManager.accessToken, dioCall.data['access']);
    }
  } catch (exception) {
    Log.debug("Refresh token is also expired");
    Log.debug("Should be navigated to the login page");
    if (Get.currentRoute != Routes.LOGIN) {
      Get.snackbar("Oops!!", "Please log in");
      loginController.clearSessionInfo();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}

Map requestBody(String refreshToken) {
  return {'refresh': refreshToken};
}
