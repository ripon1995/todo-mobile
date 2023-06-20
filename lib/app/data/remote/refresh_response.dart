class RefreshResponse {
  String? accessToken;

  RefreshResponse({
    this.accessToken,
  });

  RefreshResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = accessToken;
    return data;
  }
}
