import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/models/todo.dart';
import 'package:flutter_basic/app/data/models/profile.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/profile_update/controllers/profile_update_controller.dart';
import 'package:flutter_basic/app/network/profile/get_profile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final PreferenceManager _preferenceManager = Get.find();
  ProfileUpdateController profileUpdateController = Get.find();

  RxString username = "".obs;
  RxInt completedTotal = 0.obs;
  RxInt completedPercentage = 0.obs;
  RxInt inCompletedTotal = 0.obs;
  RxInt inCompletedPercentage = 0.obs;
  RxString rxImageUrl = "".obs;
  RxBool showLoader = false.obs;

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
    Profile? profile = await getProfile();
    if (profile != null) {
      username.value = profile.username!;
      rxImageUrl.value = profile.imageUrl!;
      _setProfileInfoInPreferenceManager(profile);
      Log.debug(profile.username!);
    }
  }

  void _setProfileInfoInPreferenceManager(dynamic profile) {
    _preferenceManager.setString(PreferenceManager.userName, profile!.username);
    _preferenceManager.setInt(PreferenceManager.userId, profile!.id);
    _preferenceManager.setString(PreferenceManager.email, profile!.email);
    _preferenceManager.setString(PreferenceManager.password, profile!.password);
    _preferenceManager.setString(
        PreferenceManager.profilePictureLink, profile!.imageUrl);
  }

  void countCompletedAndInCompletedToDos(List<ToDo> taskList) {
    int completed = 0;
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].completed == true) {
        completed++;
      }
    }
    completedTotal.value = completed;
    inCompletedTotal.value = taskList.length - completed;
  }

  void uploadImageInFirebase(XFile file) async {
    showLoader.value = true;
    final storageRef = FirebaseStorage.instance;
    dynamic folderRef = storageRef.ref().child(username.value);
    const String fileName = "profileImage.jpg";
    dynamic imageRef = folderRef.child(fileName);
    await imageRef.putFile(File(file.path));
    final String imageDownloadUrl = await imageRef.getDownloadURL();
    if (imageDownloadUrl.isNotEmpty) {
      rxImageUrl.value = imageDownloadUrl;
    }
    showLoader.value = false;
  }

  Future<void> selectImageFromGallery() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      Log.debug(image!.path.toString());
      uploadImageInFirebase(image);
    } catch (exception) {
      Log.debug(exception.toString());
    }
  }
}
