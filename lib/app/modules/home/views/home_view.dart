import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_basic/app/data/models/task.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/modules/home/widgets/bottom_sheet_home.dart';
import 'package:flutter_basic/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../widgets/todo_item_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _floatingButtonAction(context),
        backgroundColor: Colors.black,
        splashColor: Colors.green,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [_profileIcon()],
      ),
      body: SizedBox(
        height: 120,
        child: Obx(
          () => ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              controller.profileController.rxTaskList.length,
              (index) => listItem(
                controller.profileController.rxTaskList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _profileButtonAction() {
    controller.profileController.profile();
    controller.profileController.getToDoList();
    Get.toNamed(Routes.PROFILE);
  }

  void _floatingButtonAction(BuildContext context) {
    showBottomSheetContent(context, controller);
  }

  Widget _profileIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        onPressed: _profileButtonAction,
        icon: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
