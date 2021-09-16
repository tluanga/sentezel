import 'package:fl_chart/fl_chart.dart';
import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';

class BarChartState {
  List<String> leftTitle;
  List<String> bottomTitle;
  List<BarChartElement> barchartElementList;
  List<BarChartGroupData> barGroupList;

  BarChartState({
    required this.leftTitle,
    required this.bottomTitle,
    required this.barchartElementList,
    required this.barGroupList,
  });
}
