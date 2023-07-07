import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/app/bindings/initial_binding.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager_impl.dart';
import 'package:flutter_basic/app/services/firebase_service.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

late PreferenceManager _preferenceManager;

void main_app() async {
  WidgetsFlutterBinding.ensureInitialized();
  _preferenceManager = Get.put(PreferenceManagerImpl());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseService firebaseService = FirebaseService();
  firebaseService.setUpFirebase();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      color: Colors.red,
      debugShowCheckedModeBanner: false,
    ),
  );
}
