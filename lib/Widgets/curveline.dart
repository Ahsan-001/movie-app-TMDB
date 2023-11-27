import 'package:flutter/material.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = secondaryColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(50, 50);
    path.quadraticBezierTo(150, 0, 250, 50);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
