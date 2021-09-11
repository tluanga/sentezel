import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [leftBarColor],
      width: width,
    ),
    BarChartRodData(
      y: y2,
      colors: [rightBarColor],
      width: width,
    ),
  ]);
}
