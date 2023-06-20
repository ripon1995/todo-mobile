import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              _profile(context),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Task Information",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              _profileTaskInfo(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget _profile(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Card(
        elevation: 8,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                    ),
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
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: _profileUpdateButtonOnPressedAction,
                icon: const Icon(Icons.edit),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileTaskInfo() {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            height: 150,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Completed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total : ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  'Percentage : ',
                  style: textStyle,
                ),
                Text(
                  'Text 3',
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber,
            height: 150,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Incompleted",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total : ',
                  style: textStyle,
                ),
                Text(
                  'Percentage : ',
                  style: textStyle,
                ),
                Text(
                  'Text 6',
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _profileUpdateButtonOnPressedAction() {
    controller.profileUpdateController.updateVariable();
    Get.toNamed(Routes.PROFILE_UPDATE);
  }
}
