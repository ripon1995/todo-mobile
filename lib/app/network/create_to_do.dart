import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Task?> createToDoItem(int userId, String title, String description,
    String status, bool completed) async {
  try {
    dynamic dioCall = DioProvider.plainDio.post(
      "${dotenv.get("BASE_URL")}/todo/",
      data: _requestBody(userId, title, description, status, completed),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Task.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

dynamic _requestBody(int userId, String title, String description,
    String status, bool completed) {
  Map body = {
    "user": userId,
    "title": title,
    "description": description,
    "status": status,
    "completed": completed
  };
  return body;
}
