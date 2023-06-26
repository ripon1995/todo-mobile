import 'package:flutter_basic/app/data/remote/profile.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Profile?> getProfile() async {
  try {
    dynamic dioCall =
        DioProvider.dioClient.get("${dotenv.get("BASE_URL")}/user/me/");

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Profile.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}
