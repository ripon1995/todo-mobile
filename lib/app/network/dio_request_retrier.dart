import 'package:dio/dio.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/dio_provider.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';

class DioRequestRetrier {
  final dioClientWithoutRetry = DioProvider.dioClientWithoutRetry;
  final RequestOptions requestOptions;

  // It's not a good idea. We should fetch Token from data layer
  final PreferenceManager _preferenceManager = Get.find();

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    Log.debug("Retry");
    var header = await getCustomHeaders();

    return await dioClientWithoutRetry.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
        _preferenceManager.getString(PreferenceManager.accessToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
