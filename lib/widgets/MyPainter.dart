
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {

  MyPainter({
    this.points,
  });

  final List<Map> points;    // 保存偏移量

  @override
  void paint(Canvas canvas, Size size) {

    var paint = new Paint()
//      ..color = pencilColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
//      ..strokeWidth = width
      ..strokeJoin = StrokeJoin.bevel;

    for (int i = 0; i < points.length - 1; ++i) {
      if (points[i] != null && points[i + 1] != null) {
        Color color1 = points[i]['color'];
        double width1 = points[i]['width'];
        Offset offset1 = points[i]['offset'];

        Offset offset2 = points[i+1]['offset'];

        paint
          ..strokeWidth = width1
          ..color = color1;

        canvas.drawLine(offset1, offset2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(MyPainter other) => other.points != points;
}