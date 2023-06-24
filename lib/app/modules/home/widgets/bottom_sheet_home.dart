import 'package:flutter/material.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

void showBottomSheetContent(BuildContext context, HomeController controller) {
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
            const Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Row(
              children: [
                Obx(() => Radio<bool>(
                  value: true,
                  groupValue: controller.createTaskStatus.value,
                  onChanged: (bool? value) {
                    controller.createTaskStatus.value = value!;
                  },
                )),
                const Text("Completed"),
                const SizedBox(width: 16),
                Obx(() => Radio<bool>(
                  value: false,
                  groupValue: controller.createTaskStatus.value,
                  onChanged: (bool? value) {
                    controller.createTaskStatus.value = value!;
                  },
                )),
                const Text("Incompleted"),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Log.debug(controller.createTaskStatus.value.toString());
                  Navigator.pop(context);
                },
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