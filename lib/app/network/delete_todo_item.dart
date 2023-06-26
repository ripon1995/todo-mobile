import 'dart:io';
import 'package:flutter_basic/app/data/remote/to_do_delete_response.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';

Future<ToDoDeleteResponse?> deleteToDoItem(int todoId) async {
  try {
    var dioCall = await DioProvider.plainDio
        .delete("https://todobackendjune.onrender.com/todo/$todoId/");

    if (dioCall.statusCode == HttpStatus.noContent) {
      return ToDoDeleteResponse(message: "success");
    } else {
      return ToDoDeleteResponse(message: "failed");
    }
  } catch (exception) {
    rethrow;
  }
}
