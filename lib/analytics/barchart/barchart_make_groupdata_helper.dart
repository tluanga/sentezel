import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/analytics/barchart/barchart_scale_yvalue_helper.dart';
import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';

List<BarChartGroupData> generateBarchartGroupDataList(
    List<BarChartElement> barchartElementList) {
  List<BarChartGroupData> _listBarChartGroupData = [];

  //--------Find the the highes income in the list
  final highestIncome = barchartElementList.reduce(
      (value, element) => value.income > element.income ? value : element);
  print(highestIncome);

  //----------- find the highest expense in the list
  final highestExpense = barchartElementList.reduce(
      (value, element) => value.expense > element.expense ? value : element);
  print(highestExpense);

  for (int i = 0; i < barchartElementList.length; i++) {
    //----scale the value--------
    final scaledIncomeValue = scaleYValue(
        value: barchartElementList[i].income,
        highestValue: highestIncome.income);

    print('scaled income value--$scaledIncomeValue');
    print('---------Expense---------------------');
    print('Expense value --${barchartElementList[i].expense}');
    print('Highest Expense value is ${highestExpense.expense}');
    final scaledExpenseValue = scaleYValue(
        value: barchartElementList[i].expense,
        highestValue: highestExpense.expense);
    print('scaled expense value--$scaledExpenseValue');
    print('--##############--');

    final data = makeGroupData(
        i, scaledIncomeValue.toDouble(), scaledExpenseValue.toDouble());
    _listBarChartGroupData.add(data);
  }
  for (var element in _listBarChartGroupData) {
    print('------------------------');
    for (var element1 in element.barRods) {
      print(element1.y);
    }
    print('-#####################----');
  }
  return _listBarChartGroupData;
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
