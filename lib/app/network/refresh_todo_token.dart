import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/remote/refresh_response.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:get/get.dart';

Future<RefreshResponse?> refreshToDoToken() async {
  PreferenceManager preferenceManager = Get.find();

  try {
    dynamic dioCall = DioProvider.dioClient;

    dioCall.post(
      "https://todobackendjune.onrender.com/token/refresh/",
      data: requestBody(
          preferenceManager.getString(PreferenceManager.refreshToken)),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      preferenceManager.setString(PreferenceManager.accessToken, response.data);
      Log.debug("Access token : ${preferenceManager.getString(PreferenceManager.accessToken)}");
      return RefreshResponse.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

Map requestBody(String refreshToken) {
  return {'refresh': refreshToken};
}
