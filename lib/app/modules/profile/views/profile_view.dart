import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _profileInfo(),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20,top: 50),
            child: const Text(
              "Task Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
      ],
    ));
  }

  Widget _profileImageBackground() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Transform.rotate(
          angle: -15 * (pi / 180),
          child: FractionallySizedBox(
              widthFactor: 1.5,
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                height: 150,
                color: const Color(0xFFB12340),
              )),
        ),
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40)),
                child: const Icon(
                  Icons.person,
                  size: 80,
                )),
          ),
        )
      ],
    );
  }

  Widget _profileInfo() {
    return Column(
      children: [
        _profileImageBackground(),
        const SizedBox(
          height: 70,
        ),
        Obx(
          () => Text(
            controller.username.value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
