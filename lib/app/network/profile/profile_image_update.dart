import 'package:flutter_basic/app/data/models/profile.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Profile?> updateProfileImage(int userId, String imagePath) async {
  try {
    dynamic dioCall = DioProvider.plainDio.put(
        "${dotenv.get("BASE_URL")}/user/$userId/",
        data: _requestBody(imagePath));

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Profile.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

dynamic _requestBody(String imageUrl) {
  Map body = {"image_url": imageUrl};
  return body;
}
