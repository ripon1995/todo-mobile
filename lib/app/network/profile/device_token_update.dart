import 'package:flutter_basic/app/data/models/profile.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Profile?> deviceTokenUpdate(int userId, String deviceToken) async {
  try {
    dynamic dioCall = DioProvider.dioClient.put(
      "${dotenv.get("BASE_URL")}/user/$userId/",
      data: _requestBody(deviceToken),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Profile.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

Map _requestBody(String deviceToken) {
  Map body = {"device_token": deviceToken};
  return body;
}
