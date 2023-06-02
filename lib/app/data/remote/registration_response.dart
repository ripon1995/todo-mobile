class RegistrationResponse {
  Data? data;
  int? status;

  RegistrationResponse({
    this.data,
    this.status,
  });

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  bool? isSuperuser;
  String? username;
  String? email;
  String? password;
  List<String>? groups;
  List<String>? userPermissions;

  Data({
    this.id,
    this.isSuperuser,
    this.username,
    this.email,
    this.password,
    this.groups,
    this.userPermissions,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    if (json['groups'] != null) {
      groups = <String>[];
      json['groups'].forEach((v) {
        groups!.add(v);
      });
    }
    if (json['user_permissions'] != null) {
      userPermissions = <String>[];
      json['user_permissions'].forEach((v) {
        userPermissions!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_superuser'] = isSuperuser;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v).toList();
    }
    if (userPermissions != null) {
      data['user_permissions'] = userPermissions!.map((v) => v).toList();
    }
    return data;
  }
}
