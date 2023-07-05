import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/models/todo.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/modules/home/widgets/delete_todo_bottom_sheet_content.dart';
import 'package:flutter_basic/app/modules/home/widgets/update_todo_bottom_sheet.dart';

Widget listItem(
    BuildContext context, ToDo task, HomeController controller, int index) {

  controller.resetColors();

  return GestureDetector(
    onTap: () {
      controller.resetColors();
      controller.colors[index] == 0
          ? controller.colors[index] = 1
          : controller.colors[index] = 0;
      controller.setTextEditingControllerToUpdateToDoData(task);
      _listItemOnTapAction(context, task, controller);
    },
    onLongPress: () {
      controller.setTextEditingControllerToUpdateToDoData(task);
      _listItemOnLongPressedAction(context, controller, task.id!);
    },
    child: AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: controller.colors[index] == 1 ? Colors.green : Colors.black,
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      duration: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.task,
            color: Colors.white,
          ),
          Text(
            task.title!,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            task.status!,
            style: TextStyle(
              fontSize: 16,
              color: controller.colors[index] == 1 ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

void _listItemOnTapAction(
    BuildContext context, ToDo task, HomeController controller) {
  updateToBottomSheetContent(context, controller, task.id!);
}

void _listItemOnLongPressedAction(BuildContext context, HomeController controller, int taskId) {
  deleteToDoBottomSheetContent(context, controller, taskId);
}
