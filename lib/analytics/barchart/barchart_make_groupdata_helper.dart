import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';

List<BarChartGroupData> _barchartGroupDataList(
    List<BarChartElement> barchartElementList) {
  List<BarChartGroupData> _listBarChartGroupData = [];

  for (int i = 0; i < barchartElementList.length; i++) {
    //--------Find the the highes income in the list
    //----------- find the lowest expense in the list
    final data = makeGroupData(i, barchartElementList[i].income.toDouble(),
        barchartElementList[i].expense.toDouble());
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  const Color leftBarColor = Color(0xff53fdd7);
  const Color rightBarColor = Color(0xffff5182);
  const double width = 7;
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
