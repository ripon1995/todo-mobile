import 'package:flutter_basic/app/data/remote/profile_response.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';

Future<ProfileResponse?> getProfile(int userId) async {
  try {
    dynamic dioCall = DioProvider.dioClient
        .get("https://todobackendjune.onrender.com/user/$userId/");

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return ProfileResponse.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}
