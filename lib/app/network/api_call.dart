import 'package:dio/dio.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/error_handlers.dart';
import 'package:flutter_basic/app/network/exceptions/base_exception.dart';

Future<Response<T>> callApiWithErrorParser<T>(
    Future<Response<T>> dioCall) async {
  try {
    Response<T> response = await dioCall;

    return response;
  } on DioError catch (dioError) {
    Exception exception = handleDioError(dioError);
    Log.error(
        "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
    throw exception;
  } catch (error) {
    Log.error("Generic error: >>>>>>> $error");

    if (error is BaseException) {
      rethrow;
    }

    throw handleError("$error");
  }
}
