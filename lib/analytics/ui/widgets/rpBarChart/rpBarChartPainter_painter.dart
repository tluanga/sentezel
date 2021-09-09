//----------RP(RUATPUII) BARCHART--------
//---------Creator Lalliantluanga Hauhnar father of late Lalruatpuii Hauhnar father of late

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sentezel/analytics/ui/widgets/rpBarChart/rpBarChartElement_model.dart';
import 'package:sentezel/common/ui/pallete.dart';

class RPBarChartPainter extends CustomPainter {
  List<RPBarChartElement> list;
  List<String> leftTitle;
  //--Using constructor to assign values--
  RPBarChartPainter({
    required this.list,
    required this.leftTitle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //---Drawing vertical bar and horizontal bar
    //---------X and Y Coordinate
    Paint xAndYLinePaint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path xAndYLinePath = Path();
    xAndYLinePath.moveTo(size.width * 0.1, size.height * 0.0);
    xAndYLinePath.lineTo(size.width * 0.1, size.height * 1);
    xAndYLinePath.lineTo(size.width * 0.97, size.height * 1);
    canvas.drawPath(xAndYLinePath, xAndYLinePaint);

    //---Right and Top Border
    Paint borderPaint = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path borderPath = Path();
    borderPath.moveTo(size.width * 0.1, size.height * 0.0);
    borderPath.lineTo(size.width * 0.97, size.height * 0.0);
    borderPath.lineTo(size.width * 0.97, size.height * 1);

    canvas.drawPath(borderPath, borderPaint);
    if (list.isNotEmpty) {
      for (int i = 1; i <= 5; i++) {
        const gap = 0.20;
        const double width1 = 0.1;
        const double width2 = 0.97;
        final double height = ((i * gap) - 1).abs(); //must be between 1-9

        // //-------Painting y bar---
        Paint yBarPaint = new Paint()
          ..color = Colors.red.shade300
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;
        Path yBarPath = Path();
        yBarPath.moveTo(size.width * width1, size.height * height);
        yBarPath.lineTo(size.width * width2, size.height * height);
        canvas.drawPath(yBarPath, yBarPaint);

        //left Title --
        //-------Title field-----------
        final textStyle = TextStyle(
          color: Palette.color1,
          fontSize: 14,
        );
        final textSpan = TextSpan(
          text: leftTitle[i.toInt() - 1],
          style: textStyle,
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(
          minWidth: 0,
          maxWidth: size.width,
        );
        final xCenter = size.width * 0.01;
        final yCenter = size.height * (height - 0.03);
        final offset = Offset(xCenter, yCenter);
        textPainter.paint(canvas, offset);
      }

      // Generate Bar with bar title
      for (int i = 1; i <= list.length; i++) {
        const double gap = 0.110;
        Paint barPaint = new Paint()
          ..color = list[i - 1].y != 0 ? Palette.color1 : Colors.grey.shade300
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20;

        Path barPath = Path();
        double width = 0.1 + (gap * i);
        double height = 0;
        // ---Y value must be between 0-5
        if (list[i - 1].y != 0) {
          height = ((list[i - 1].y * 0.20) - 1).abs();
        } else {
          double a = i / 10;
          double ran = Random(4).nextDouble();
          height = (((a + ran) * 0.50) - 1).abs();
        }

        // double height = ((list[i - 1].y * 0.20) - 1).abs();
        barPath.moveTo(size.width * width, size.height * height);
        barPath.lineTo(size.width * width, size.height * 1);
        canvas.drawPath(barPath, barPaint);

        //-------Title field-----------
        final textStyle = TextStyle(
          color: Palette.color1,
          fontSize: 16,
        );
        final textSpan = TextSpan(
          text: list[i - 1].label,
          style: textStyle,
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(
          minWidth: 0,
          maxWidth: size.width,
        );
        final xCenter = size.width * (width - 0.025);
        final yCenter = size.height * 1;
        final offset = Offset(xCenter, yCenter);
        textPainter.paint(canvas, offset);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
