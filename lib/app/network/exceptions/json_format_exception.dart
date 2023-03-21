import 'package:flutter_basic/app/network/exceptions/base_exception.dart';

class JsonFormatException extends BaseException {
  JsonFormatException({String message = "Unable to parse JSON data"})
      : super(message: message);
}
