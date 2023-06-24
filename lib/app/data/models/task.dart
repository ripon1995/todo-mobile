class Task {
  int? id;
  String? title;
  String? description;
  String? status;
  String? createdDate;
  bool? completed;
  int? user;

  Task({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdDate,
    this.completed,
    this.user,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdDate = json['createdDate'];
    completed = json['completed'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['createdDate'] = createdDate;
    data['completed'] = completed;
    data['user'] = user;
    return data;
  }
}
