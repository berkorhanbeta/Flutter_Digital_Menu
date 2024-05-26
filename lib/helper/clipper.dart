import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    /*
    path.lineTo(0, 120);
    path.quadraticBezierTo(
        size.width / 4, 160 /*180*/, size.width / 2, 175);
    path.quadraticBezierTo(
        3 / 4 * size.width, 190, size.width, 130);
    path.lineTo(size.width, 0);
    path.close();
     */
    path.lineTo(0, 50);
    path.quadraticBezierTo(
        size.width / 4, 200, size.width / 2, 200);
    path.quadraticBezierTo(
        size.width - size.width / 4, 200, size.width, 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}