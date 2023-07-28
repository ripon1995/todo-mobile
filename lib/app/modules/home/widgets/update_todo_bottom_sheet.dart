import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/utils/enum_status.dart';
import 'package:flutter_basic/app/utils/input_decoration.dart';
import 'package:get/get.dart';

void updateToBottomSheetContent(
    BuildContext context, HomeController controller, int taskId) {
  showModalBottomSheet(
    backgroundColor: const Color(0xFF267EBD),
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
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF408DC5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.update_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Update Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF408DC5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.createTaskTitleController,
                  decoration:
                      inputDecorationUpdateSheet(Icons.title_outlined, "title"),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF408DC5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.createTaskDescriptionController,
                  decoration: inputDecorationUpdateSheet(
                    Icons.description_outlined,
                    "description",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF408DC5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Obx(() => RadioListTile(
                          activeColor: Colors.white,
                          value: Status.New,
                          groupValue: controller.rxStatus.value,
                          onChanged: (status) {
                            if (status != null) {
                              controller.handleStatusChange(status);
                            }
                          },
                          title: const Text(
                            "New",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(() => RadioListTile(
                          activeColor: Colors.white,
                          value: Status.Active,
                          groupValue: controller.rxStatus.value,
                          onChanged: (status) {
                            if (status != null) {
                              controller.handleStatusChange(status);
                            }
                          },
                          title: const Text(
                            "Active",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Obx(() => RadioListTile(
                          activeColor: Colors.white,
                          value: Status.Completed,
                          groupValue: controller.rxStatus.value,
                          onChanged: (status) {
                            if (status != null) {
                              controller.handleStatusChange(status);
                            }
                          },
                          title: const Text(
                            "Completed",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(() => RadioListTile(
                          activeColor: Colors.white,
                          value: Status.Blocked,
                          groupValue: controller.rxStatus.value,
                          onChanged: (status) {
                            if (status != null) {
                              controller.handleStatusChange(status);
                            }
                          },
                          title: const Text(
                            "Blocked",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                      ),
                      const SizedBox(width: 16),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF408DC5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () =>
                    _updateButtonAction(controller, context, taskId),
                child: const Text(
                  "Update",
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

void _updateButtonAction(
    HomeController controller, BuildContext context, int taskId) {
  controller.updateToDo(taskId);
  Navigator.pop(context);
}
