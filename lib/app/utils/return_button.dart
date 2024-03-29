import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ReturnButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: onTap ?? () => Get.back(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple[300],
          ),
          child: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
