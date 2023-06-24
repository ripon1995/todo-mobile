import 'package:dio/dio.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';

class TokenInterceptor extends InterceptorsWrapper {
  final PreferenceManager _preferenceManager = Get.find();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    getTokenHeaders().then((headers) => options.headers.addAll(headers));

    return handler.next(options);
  }

  Future<Map<String, String>> getTokenHeaders() async {
    final accessToken =
        _preferenceManager.getString(PreferenceManager.accessToken);

    var customHeaders = {'content-type': 'application/json'};

    customHeaders.addAll({'Authorization': 'Bearer $accessToken'});

    return customHeaders;
  }
}
