import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_basic/app/modules/profile/widgets/logout_button.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:flutter_basic/app/utils/return_button.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: ReturnButton(
                  onTap: null,
                ),
              ),
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
              LogoutButton()
            ],
          ),
        ));
  }

  Widget _profile(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple[400],
                  ),
                  child: controller.rxImageUrl.isNotEmpty
                      ? Obx(() => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              controller.rxImageUrl.value,
                              width: 150,
                              height: 150,
                            ),
                          ))
                      : const Icon(
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
                      color: Colors.amberAccent
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: _profileUpdateButtonOnPressedAction,
                icon: const Icon(Icons.edit),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileTaskInfo() {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            elevation: 8,
            child: Container(
              color: Colors.white10,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Completed",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total : ${controller.completedTotal.value.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Percentage : ',
                        style: textStyle,
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            elevation: 8,
            child: Container(
              color: Colors.white10,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Incompleted",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total : ${controller.inCompletedTotal.value.toString()}',
                        style: textStyle,
                      ),
                      const Text(
                        'Percentage : ',
                        style: textStyle,
                      ),
                    ],
                  )),
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
