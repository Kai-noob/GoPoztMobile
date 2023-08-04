import 'package:flutter/material.dart';

class CustomTitleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double borderRadius = 20.0;
    double triangleHeight = 20.0;

    Path path = Path()
      ..moveTo(borderRadius, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..arcToPoint(Offset(size.width, borderRadius),
          radius: Radius.circular(borderRadius))
      ..lineTo(size.width, size.height - triangleHeight)
      ..lineTo(size.width / 2 + triangleHeight, size.height - triangleHeight)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2 - triangleHeight, size.height - triangleHeight)
      ..lineTo(borderRadius, size.height - triangleHeight)
      ..arcToPoint(Offset(0, size.height - borderRadius),
          radius: Radius.circular(borderRadius))
      ..lineTo(0, borderRadius)
      ..arcToPoint(Offset(borderRadius, 0),
          radius: Radius.circular(borderRadius));

    Paint paint = Paint()
      ..color = Colors.blue // Set the color of your shape
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
