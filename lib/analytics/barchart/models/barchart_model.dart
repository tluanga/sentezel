import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';

class BarChart {
  List<String> leftTitle;
  List<String> bottomTitle;
  List<BarChartElement> barchartElement;
  BarChart({
    required this.leftTitle,
    required this.bottomTitle,
    required this.barchartElement,
  });
}
