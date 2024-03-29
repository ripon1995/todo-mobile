class Profile {
  int? id;
  bool? isSuperuser;
  String? username;
  String? email;
  String? password;
  String? deviceToken;
  String? imageUrl;
  String? firstName;
  String? lastName;
  List<String>? groups;
  List<String>? userPermissions;

  Profile({
    this.id,
    this.isSuperuser,
    this.username,
    this.email,
    this.password,
    this.deviceToken,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.groups,
    this.userPermissions,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    deviceToken = json['device_token'];
    imageUrl = json['image_url'];
    firstName = json['first_name'];
    lastName = json['last_name'];
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
    data['device_token'] = deviceToken;
    data['image_url'] = imageUrl;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v).toList();
    }
    if (userPermissions != null) {
      data['user_permissions'] = userPermissions!.map((v) => v).toList();
    }
    return data;
  }
}
