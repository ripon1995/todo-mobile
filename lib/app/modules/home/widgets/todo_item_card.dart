import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/models/todo.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/modules/home/widgets/delete_todo_bottom_sheet_content.dart';
import 'package:flutter_basic/app/modules/home/widgets/update_todo_bottom_sheet.dart';

Widget listItem(
    BuildContext context, ToDo task, HomeController controller, int index) {
  return GestureDetector(
    onTap: () {
      controller.setTextEditingControllerToUpdateToDoData(task);
      _listItemOnTapAction(context, task, controller);
    },
    onLongPress: () {
      controller.setTextEditingControllerToUpdateToDoData(task);
      _listItemOnLongPressedAction(context, controller, task.id!);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurple[400],
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.deepPurple[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.task,
              color: Colors.white,
            ),
          ),
          Text(
            task.title!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            task.status!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
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

void _listItemOnLongPressedAction(
    BuildContext context, HomeController controller, int taskId) {
  deleteToDoBottomSheetContent(context, controller, taskId);
}
