import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/pallete.dart';

double scaleYValue({
  required int value,
  required int highestValue,
}) {
  double percentage = (value / highestValue) * 100;
  double result = (percentage / 100) * 5;
  return result > 5 ? result.roundToDouble() : result;
}

makeGroupData(int x, double y, doubley2) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
        y: y,
        width: 40,
        rodStackItems: [
          BarChartRodStackItem(0, 1, Palette.color1),
          BarChartRodStackItem(1, 2, Colors.yellow.shade500),
          BarChartRodStackItem(2, 3, Colors.red.shade200),
          BarChartRodStackItem(3, 4, Colors.orange.shade200),
          BarChartRodStackItem(4, 5, Colors.green.shade200),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
    ],
    // showingTooltipIndicators: [0],
  );
}
