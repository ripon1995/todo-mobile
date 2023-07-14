import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_basic/app/data/local/preference/preference_manager.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:get/get.dart';

class FirebaseService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final PreferenceManager _preferenceManager = Get.find();

  Future<void> setUpFirebase() async {
    String? token = await _firebaseMessaging.getToken();
    Log.debug("device token : $token");
    _preferenceManager.setString(PreferenceManager.deviceToken, token!);
    _configurePushNotification();
  }

  Future<void> _configurePushNotification() async {
    _configureForegroundNotification();
    _configureBackgroundNotification();
  }

  void _configureForegroundNotification() async {
    RemoteMessage? message = await _firebaseMessaging.getInitialMessage();
    Log.debug("remote message : $message");

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      Log.debug('Got a message in the foreground');
      Log.debug('Message data : ${remoteMessage.data}');

      if (remoteMessage.notification != null) {
        Log.debug(
            "Message also contained a notification : ${remoteMessage.notification}");
      }
    });
  }

  void _configureBackgroundNotification() {
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }

  Future<void> _handleBackgroundMessage(RemoteMessage remoteMessage) async {
    // Handle background message
  }
}
