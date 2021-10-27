import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.xAxisScalingValues,
    required this.maxYaxisValue,
    required this.yAxissalesSpots,
    required this.yAxisexpenseSpots,
  }) : super(key: key);

  final List<String> xAxisScalingValues;
  final double maxYaxisValue;
  final List<double> yAxissalesSpots;
  final List<double> yAxisexpenseSpots;

  @override
  Widget build(BuildContext context) {
    List<Color> salesColors = [
      Colors.green
      // Color(0xff23b6e6),
      // Color(0xff02d39a),
    ];
    List<Color> expenseColors = [
      Colors.red.shade200,
    ];
    return LineChart(LineChartData(
        titlesData: FlTitlesData(
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTextStyles: (context, val) => const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                getTitles: (x) {
                  switch (x.toInt()) {
                    case 0:
                      return xAxisScalingValues[0];
                    case 2:
                      return xAxisScalingValues[1];
                    case 4:
                      return xAxisScalingValues[2];
                    case 6:
                      return xAxisScalingValues[3];
                    case 8:
                      return xAxisScalingValues[4];
                    case 10:
                      return xAxisScalingValues[5];
                    case 12:
                      return xAxisScalingValues[6];
                  }
                  return '';
                }),
            leftTitles: SideTitles(
                interval: maxYaxisValue / 5,
                reservedSize: MediaQuery.of(context).size.width * 0.1,
                showTitles: true,
                getTextStyles: (context, val) => const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                getTitles: (y) {
                  return y.toInt().toString();
                })),
        minX: 0,
        maxX: 12,
        minY: 0,
        // finding the max value of sales per day
        maxY: maxYaxisValue,
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, yAxissalesSpots[0]),
                FlSpot(2, yAxissalesSpots[1]),
                FlSpot(4, yAxissalesSpots[2]),
                FlSpot(6, yAxissalesSpots[3]),
                FlSpot(8, yAxissalesSpots[4]),
                FlSpot(10, yAxissalesSpots[5]),
                FlSpot(12, yAxissalesSpots[6]),
              ],
              isCurved: true,
              colors: salesColors,
              barWidth: 5,
              belowBarData: BarAreaData(
                show: true,
                colors: salesColors.map((e) => e.withOpacity(0.3)).toList(),
              ),
              dotData: FlDotData(
                show: true,
              )),
          LineChartBarData(
              spots: [
                FlSpot(0, yAxisexpenseSpots[0]),
                FlSpot(2, yAxisexpenseSpots[1]),
                FlSpot(4, yAxisexpenseSpots[2]),
                FlSpot(6, yAxisexpenseSpots[3]),
                FlSpot(8, yAxisexpenseSpots[4]),
                FlSpot(10, yAxisexpenseSpots[5]),
                FlSpot(12, yAxisexpenseSpots[6]),
              ],
              isCurved: true,
              colors: expenseColors,
              barWidth: 5,
              belowBarData: BarAreaData(
                show: true,
                colors: expenseColors.map((e) => e.withOpacity(0.3)).toList(),
              ),
              dotData: FlDotData(
                show: true,
              )),
        ]));
  }
}
