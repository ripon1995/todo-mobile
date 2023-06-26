import 'package:flutter_basic/app/data/remote/login_response.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<LoginResponse?> login(String email, String password) async{
  try {
    dynamic dioCall = DioProvider.plainDio.post(
      "${dotenv.get("BASE_URL")}/token/",
      data: requestBody(email, password),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return LoginResponse.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

Map requestBody(String email, String password) {
  return {'username': email, 'password': password};
}
