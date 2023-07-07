import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/firebase_options.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => Log.debug("Firebase initialized"));
  }
}
