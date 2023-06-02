class LoginResponse {
  String? accessToken;
  String? refreshToken;

  LoginResponse({
    this.accessToken,
    this.refreshToken,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['data']['access_token'] as String?;
    refreshToken = json['data']['refresh_token'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
