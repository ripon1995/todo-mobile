import 'package:flutter_basic/app/data/remote/registration_response.dart';
import 'package:flutter_basic/app/network/authentication/registration.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> registerUser(
      String username, String email, String password) async {
    RegistrationResponse? registrationResponse =
        await register(username, email, password);

    if (registrationResponse != null) {
      return true;
    }
    return false;
  }
}
