import 'package:flutter_basic/app/data/models/profile.dart';

class RegistrationResponse {
  Profile? profile;
  int? status;

  RegistrationResponse({
    this.profile,
    this.status,
  });

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    profile = json['data'] != null ? Profile.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['data'] = profile!.toJson();
    }
    data['status'] = status;
    return data;
  }
}
