import 'package:flutter_basic/app/data/models/todo.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<ToDo?> updateToDoItem(int todoId, String title, String description,
    String status, bool completed) async {
  try {
    dynamic dioCall = DioProvider.plainDio.put(
      "${dotenv.get("BASE_URL")}/todo/$todoId/",
      data: _requestBody(title, description, status, completed),
    );

    return await callApiWithErrorParser(dioCall).then((dynamic response) {
      return ToDo.fromJson(response.data);
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
