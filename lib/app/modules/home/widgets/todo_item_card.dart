import 'package:flutter/material.dart';
import 'package:flutter_basic/app/data/models/task.dart';

Widget listItem(Task task) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(20),
      bottom: Radius.circular(20),
    ),
    child: Card(
      elevation: 8,
      margin: const EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.task,
            color: Colors.pinkAccent,
          ),
          Text(
            task.title!,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          const SizedBox(height: 8),
          Text(
            task.status!,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.grey
            ),
          ),
        ],
      ),
    ),
  );
}