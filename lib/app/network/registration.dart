import 'package:flutter_basic/app/data/remote/registration_response.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<RegistrationResponse?> register(
    String username, String email, String password) async {
  try {
    dynamic dioCall = DioProvider.dioClient.post(
      "${dotenv.get("BASE_URL")}/user/",
      data: requestBody(username, email, password),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return RegistrationResponse.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

Map requestBody(String username, String email, String password) {
  return {
    'username': username,
    'email': email,
    'password': password,
  };
}
