import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/pretty_dio_logger.dart';
import 'package:flutter_basic/app/network/custom_token_interceptor.dart';
import 'package:flutter_basic/app/network/token_interceptor.dart';
import 'package:flutter_basic/app/network/token_refresh_interceptor.dart';

class DioProvider {
  // static final String baseUrl = dotenv.get('BASE_URL');

  static Dio? _instance;

  static final _prettyDioLogger = PrettyDioLogger();

  static final BaseOptions _options = BaseOptions(
      connectTimeout: 60 * 10000,
      receiveTimeout: 60 * 10000,
      contentType: 'application/json');

  /// returns a Plain Dio client without any token in header
  static Dio get plainDio {
    _instance ??= Dio(_options);

    _instance!.interceptors.clear();
    _instance!.interceptors.add(_prettyDioLogger);

    return _instance!;
  }

  /// Returns a Dio client with Access token in header.
  /// Also added a Refresh token retry interceptor.
  /// This Dio client should use for every network call at 1st time. For retry
  /// the API call, we should use [dioClientWithoutRetry] client.
  static Dio get dioClient {
    _instance ??= plainDio;

    _instance!.interceptors.clear();

    _instance!.interceptors.addAll(_getLoggingInterceptors());
    _instance!.interceptors.addAll(_getTokenInterceptors(true));

    // _instance!.interceptors.add(_prettyDioLogger);

    return _instance!;
  }

  /// Returns a Dio client with Access token in header.
  /// But there is no retry mechanism with refresh token.
  /// This Dio client should only use from Retry mechanism. For regular API call, use [dioClient].
  static Dio get dioClientWithoutRetry {
    _instance ??= plainDio;

    _instance!.interceptors.clear();

    _instance!.interceptors.addAll(_getTokenInterceptors(false));

    // _instance!.interceptors.add(_prettyDioLogger);

    return _instance!;
  }

  static List<Interceptor> _getTokenInterceptors(bool shouldRetryOnError) {
    List<Interceptor> interceptorList = [];
    interceptorList.add(TokenInterceptor());

    if (shouldRetryOnError) {
      interceptorList.add(TokenRefreshInterceptor());
    }

    return interceptorList;
  }

  static List<Interceptor> _getLoggingInterceptors() {
    List<Interceptor> interceptorList = [];
    if (kDebugMode) {
      interceptorList.add(_prettyDioLogger);
    }

    return interceptorList;
  }

  static Dio get dioClientWithRefreshToken {
    _instance ??= plainDio;

    _instance!.interceptors.clear();

    _instance!.interceptors.addAll(_getLoggingInterceptors());
    _instance!.interceptors.addAll(_getRefreshTokenInterceptors());

    // _instance!.interceptors.add(_prettyDioLogger);

    return _instance!;
  }

  static List<Interceptor> _getRefreshTokenInterceptors() {
    List<Interceptor> interceptorList = [];
    interceptorList.add(CustomTokenInterceptor());

    return interceptorList;
  }
}
