import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.7448980);
    path_0.cubicTo(size.width, size.height * 0.8857857, size.width * 0.9403040,
        size.height, size.width * 0.8666667, size.height);
    path_0.lineTo(size.width * 0.1333333, size.height);
    path_0.cubicTo(size.width * 0.05969547, size.height, 0,
        size.height * 0.8857857, 0, size.height * 0.7448980);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0, 0);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width, size.height * 0.7448980);
    path_1.cubicTo(size.width, size.height * 0.8857857, size.width * 0.9403040,
        size.height, size.width * 0.8666667, size.height);
    path_1.lineTo(size.width * 0.1333333, size.height);
    path_1.cubicTo(size.width * 0.05969547, size.height, 0,
        size.height * 0.8857857, 0, size.height * 0.7448980);
    path_1.lineTo(0, 0);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.7442747, size.height * -4.265929e-8),
        Offset(size.width * 0.7475733, size.height * 1.178740), [
      const Color(0xffFE5F5F).withOpacity(1),
      const Color(0xffFC9842).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9591253, size.height * 0.08163265);
    path_2.lineTo(size.width * 0.9591253, size.height * 0.1020408);
    path_2.cubicTo(
        size.width * 0.9612720,
        size.height * 0.1003122,
        size.width * 0.9626667,
        size.height * 0.09629133,
        size.width * 0.9626667,
        size.height * 0.09183673);
    path_2.cubicTo(
        size.width * 0.9626667,
        size.height * 0.08738214,
        size.width * 0.9612720,
        size.height * 0.08336122,
        size.width * 0.9591253,
        size.height * 0.08163265);
    path_2.close();

    Path path_3 = Path();
    path_3.moveTo(0, 0);
    path_3.lineTo(size.width, 0);
    path_3.lineTo(0, 0);
    path_3.close();
    path_3.moveTo(size.width, size.height * 0.7448980);
    path_3.cubicTo(size.width, size.height * 0.8886071, size.width * 0.9391120,
        size.height * 1.005102, size.width * 0.8640000, size.height * 1.005102);
    path_3.lineTo(size.width * 0.1360000, size.height * 1.005102);
    path_3.cubicTo(size.width * 0.06088933, size.height * 1.005102, 0,
        size.height * 0.8886071, 0, size.height * 0.7448980);
    path_3.cubicTo(
        0,
        size.height * 0.8829694,
        size.width * 0.05969547,
        size.height * 0.9948980,
        size.width * 0.1333333,
        size.height * 0.9948980);
    path_3.lineTo(size.width * 0.8666667, size.height * 0.9948980);
    path_3.cubicTo(size.width * 0.9403040, size.height * 0.9948980, size.width,
        size.height * 0.8829694, size.width, size.height * 0.7448980);
    path_3.close();
    path_3.moveTo(0, size.height);
    path_3.lineTo(0, 0);
    path_3.lineTo(0, size.height);
    path_3.close();
    path_3.moveTo(size.width, 0);
    path_3.lineTo(size.width, size.height);
    path_3.lineTo(size.width, 0);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffFFF84B).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
