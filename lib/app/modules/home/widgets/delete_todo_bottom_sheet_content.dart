import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';

void deleteToDoBottomSheetContent(
    BuildContext context, HomeController controller, int taskId) {
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
                "Want to Delete?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.red,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    _deleteButtonAction(controller, context, taskId),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.black,
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

void _deleteButtonAction(
    HomeController controller, BuildContext context, int taskId) {
  controller.deleteToDo(taskId);
  Navigator.pop(context);
}
