import 'package:flutter/material.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

void createToBottomSheetContent(BuildContext context, HomeController controller) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Create New Task",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.createTaskTitleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.createTaskDescriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.createTaskStatusController,
              decoration: const InputDecoration(
                labelText: "Status",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Obx(() => Radio<bool>(
                      value: true,
                      groupValue: controller.createTaskIsCompleted.value,
                      onChanged: (bool? value) {
                        controller.createTaskIsCompleted.value = value!;
                      },
                    )),
                const Text("Completed"),
                const SizedBox(width: 16),
                Obx(() => Radio<bool>(
                      value: false,
                      groupValue: controller.createTaskIsCompleted.value,
                      onChanged: (bool? value) {
                        controller.createTaskIsCompleted.value = value!;
                      },
                    )),
                const Text("Incompleted"),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _createButtonAction(controller, context),
                child: const Text(
                  "Create",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _createButtonAction(HomeController controller, BuildContext context) {
  controller.createToDo();
  Navigator.pop(context);
}
