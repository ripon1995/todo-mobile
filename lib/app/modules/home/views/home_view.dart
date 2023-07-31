import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/modules/home/widgets/create_todo_bottom_sheet_home.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:flutter_basic/app/services/notification_permission_dialogue.dart';
import 'package:flutter_basic/app/utils/custom_clip_path.dart';
import 'package:get/get.dart';
import 'package:flutter_basic/app/modules/home/widgets/todo_item_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showNotificationPermissionDialog();
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _floatingButtonAction(context),
        backgroundColor: Colors.deepPurple[400],
        splashColor: Colors.green,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClip(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[500],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 500,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 5),
              child: Column(
                children: [
                  Obx(
                    () => SizedBox(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            controller.rxToDoList.length,
                            (index) => listItem(
                              context,
                              controller.rxToDoList[index],
                              controller,
                              index,
                            ),
                          ),
                          if (controller.rxToDoListNext.isNotEmpty)
                            IconButton(
                              onPressed: controller.getToDoList,
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: _profileIcon(),
            ),
          ),
        ],
      ),
    );
  }

  void _profileButtonAction() {
    controller.profileController.profile();
    Get.toNamed(Routes.PROFILE);
  }

  void _floatingButtonAction(BuildContext context) {
    createToBottomSheetContent(context, controller);
  }

  Widget _profileIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: IconButton(
        onPressed: _profileButtonAction,
        icon: CircleAvatar(
          backgroundColor: Colors.deepPurple[400],
          child: const Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _showNotificationPermissionDialog() async {
    await showDialog(
      context: Get.context!,
      builder: (context) => NotificationPermissionDialog(),
    );
  }
}
