import 'package:fl_chart/fl_chart.dart';

class BarChart {
  List<String> leftTitles = [];
  List<String> bottomTitles = [];
  List<BarChartGroupData> barChartGroupDataList = [];
  BarChart({
    required this.leftTitles,
    required this.bottomTitles,
    required this.barChartGroupDataList,
  });
}
