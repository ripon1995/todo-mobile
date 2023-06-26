import 'package:flutter_basic/app/log.dart';

class ToDoDeleteResponse {
  String? message;

  ToDoDeleteResponse({
    this.message,
  });

  ToDoDeleteResponse.fromJson(Map<String, dynamic> json) {
    try{
      message = json['message'] as String;
    } catch(exception) {
      Log.debug("exception : $exception");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    return data;
  }
}
