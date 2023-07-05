import 'package:flutter_basic/app/data/models/todo.dart';

class ToDoList {
  int? count;
  String? next;
  String? previous;
  List<ToDo>? results;

  ToDoList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  ToDoList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ToDo>[];
      json['results'].forEach((v) {
        results!.add(ToDo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
