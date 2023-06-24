import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';

Future<Profile?> getProfile() async {
  try {
    dynamic dioCall = DioProvider.dioClient
        .get("https://todobackendjune.onrender.com/user/me/");

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Profile.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}
