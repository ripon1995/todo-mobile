import 'package:flutter_basic/app/data/remote/todo_paginated_response.dart';
import 'package:flutter_basic/app/network/api_call.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<ToDoListPaginatedResponse> getUserToDoList(int pageNumber) async {
  try {
    dynamic dioCall = DioProvider.dioClient
        .get("${dotenv.get("BASE_URL")}/todos/?page=$pageNumber");

    return callApiWithErrorParser(dioCall)
        .then((response) => ToDoListPaginatedResponse.fromJson(response.data));
  } catch (exception) {
    rethrow;
  }
}
