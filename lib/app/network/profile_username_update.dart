import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Profile?> updateProfileUsername(int userId, String username) async {
  try {
    dynamic dioCall = DioProvider.plainDio.put(
        "${dotenv.get("BASE_URL")}/user/$userId/",
        data: _requestBody(username));

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Profile.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

dynamic _requestBody(String username) {
  Map body = {"username": username};
  return body;
}
