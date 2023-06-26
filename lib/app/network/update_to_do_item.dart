import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';

Future<Task?> updateToDoItem(int todoId, String title, String description,
    String status, bool completed) async {
  try {
    dynamic dioCall = DioProvider.plainDio.put(
      "https://todobackendjune.onrender.com/todo/$todoId/",
      data: _requestBody(title, description, status, completed),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return Task.fromJson(response.data);
    });
  } catch (exception) {
    rethrow;
  }
}

dynamic _requestBody(
    String title, String description, String status, bool completed) {
  Map body = {
    "title": title,
    "description": description,
    "status": status,
    "completed": completed
  };
  return body;
}
