import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class NotificationPermissionDialog extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final HomeController _homeController = Get.find();

  NotificationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Notification Permission'),
      content: Text('This app would like to send you notifications.'),
      actions: [
        ElevatedButton(
          child: Text('Deny'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Allow'),
          onPressed: () async {
            Navigator.of(context).pop();
            await _requestPermission();
          },
        ),
      ],
    );
  }

  Future<void> _requestPermission() async {
    await _firebaseMessaging.requestPermission().then(
          (value) => _homeController.updateUserDeviceToken(),
        );
  }
}
