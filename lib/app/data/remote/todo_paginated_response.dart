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

// class Results {
//   int? id;
//   int? user;
//   String? title;
//   String? description;
//   String? status;
//   String? createdDate;
//   bool? completed;
//
//   Results(
//       {this.id,
//       this.user,
//       this.title,
//       this.description,
//       this.status,
//       this.createdDate,
//       this.completed});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     user = json['user'];
//     title = json['title'];
//     description = json['description'];
//     status = json['status'];
//     createdDate = json['createdDate'];
//     completed = json['completed'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['user'] = user;
//     data['title'] = title;
//     data['description'] = description;
//     data['status'] = status;
//     data['createdDate'] = createdDate;
//     data['completed'] = completed;
//     return data;
//   }
// }
