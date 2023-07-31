import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    var path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w*.25, h*.5, w*.5, h*.75);
    path.quadraticBezierTo(w*.75, h, w, h*.5);
    path.lineTo(w,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}