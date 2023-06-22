import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/dio_request_retrier.dart';
import 'package:flutter_basic/app/network/error_handlers.dart';
import 'package:flutter_basic/app/network/exceptions/base_exception.dart';
import 'package:flutter_basic/app/network/refresh_todo_token.dart';

class TokenRefreshInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_isUserNotAuthorized(err)) {
      try {
        var response = await _retry(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final DioRequestRetrier requestRetrier =
        DioRequestRetrier(requestOptions: requestOptions);

    try {
      await refreshToDoToken();
      var response = await requestRetrier.retry();
      if (response.statusCode != HttpStatus.ok) {
        throw handleError(response.data['access']);
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      Log.error(
          "Token refresher > retrier: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      Log.error("Token refresher > retrier: Generic error >>>>>>> $error");
      throw handleError("$error");
    }
  }

  bool _isUserNotAuthorized(DioError err) {
    return err.response?.statusCode == HttpStatus.unauthorized ||
        err.response?.statusCode == HttpStatus.forbidden;
  }
}
