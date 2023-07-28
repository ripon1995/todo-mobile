import 'package:flutter/material.dart';
import 'package:flutter_basic/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_basic/app/utils/elevated_button_decoration.dart';

void deleteToDoBottomSheetContent(BuildContext context,
    HomeController controller, int taskId, String toDoTitle) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
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
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Want to Delete?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.title_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      toDoTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: () =>
                    _deleteButtonAction(controller, context, taskId),
                  text: "Delete", iconData: Icons.delete_forever_outlined,
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
