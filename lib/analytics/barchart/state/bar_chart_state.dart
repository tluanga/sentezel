import 'package:fl_chart/fl_chart.dart';

class BarChartState {
  List<BarChartGroupData> barchartGroupDataList;
  FlTitlesData titlesData;
  int maxY = 20;
  BarChartState({
    required this.barchartGroupDataList,
    required this.titlesData,
    required this.maxY,
  });
}
