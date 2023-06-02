import 'package:flutter_basic/app/data/remote/registration_response.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';

Future<RegistrationResponse?> register(
    String username, String email, String password) async {
  try {
    dynamic dioCall = DioProvider.dioClient.post(
      "https://todobackend-x6vk.onrender.com/user/",
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
