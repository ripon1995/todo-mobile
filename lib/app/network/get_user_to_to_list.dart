import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_basic/app/data/models/task.dart';

Future<List<Task>> getUserToDoList(int userId) async {
  try {
    dynamic dioCall = DioProvider.plainDio
        .get("https://todobackendjune.onrender.com/todo/?userId=$userId");

    return await callApiWithErrorParser(dioCall).then((dynamic response) =>
        (response.data as List<dynamic>)
            .map((dynamic d) => Task.fromJson(d))
            .toList());
  } catch (exception) {
    rethrow;
  }
}
