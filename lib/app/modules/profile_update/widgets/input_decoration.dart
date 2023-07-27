import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  IconData iconData,
) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(15),
    prefixIcon: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurple[400],
      ),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.white, // Replace this with the desired color
          BlendMode.srcIn,
        ),
        child: Icon(iconData),
      ),
    ),
    prefixIconColor: Colors.deepPurple[50],
    prefixText: "   ",
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
  );
}
