import 'package:flutter_basic/app/data/remote/profile_response.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/get_profile.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  RxString username = "".obs;

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

  void profile() async {
    ProfileResponse? profileResponse = await getProfile(1);
    if (profileResponse != null) {
      Log.debug(profileResponse.data!.username!);
      username.value = profileResponse.data!.username!;
    }
  }
}
