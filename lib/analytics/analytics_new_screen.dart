import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/analytics/analytics_controller.dart';

class AnalyticsNewScreen extends HookConsumerWidget {
  const AnalyticsNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analyticsControllerProvider);
    useEffect(() {
      ref.watch(analyticsControllerProvider.notifier).loadData();
    }, []);
    List<Color> gradientColors = const [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ];
    return state.when(data: (data) {
      print(data.salesPerDay);
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LineChart(LineChartData(
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
                            return DateFormat('dd/MM').format(DateTime.now());
                          case 2:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 1));
                          case 4:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 2));
                          case 6:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 3));
                          case 8:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 4));
                          case 10:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 5));
                          case 12:
                            return DateFormat('dd/MM').format(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day - 6));
                        }
                        return '';
                      }),
                  leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, val) => const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                      getTitles: (y) {
                        switch (y.toInt()) {
                          case 1000:
                            return '1000';
                          case 3000:
                            return '3000';
                          case 5000:
                            return '5000';
                          case 7000:
                            return '7000';
                          case 9000:
                            return '9000';
                        }
                        return '';
                      })),
              minX: 0,
              maxX: 12,
              minY: 0,
              // finding the max value of sales per day
              maxY: data.salesPerDay
                  .reduce((curr, next) => curr > next ? curr : next),
              lineBarsData: [
                LineChartBarData(
                    spots: [
                      FlSpot(0, data.salesPerDay[0]),
                      FlSpot(2, data.salesPerDay[1]),
                      FlSpot(4, data.salesPerDay[2]),
                      FlSpot(6, data.salesPerDay[3]),
                      FlSpot(8, data.salesPerDay[4]),
                      FlSpot(10, data.salesPerDay[5]),
                      FlSpot(12, data.salesPerDay[6]),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: gradientColors
                          .map((e) => e.withOpacity(0.3))
                          .toList(),
                    ),
                    dotData: FlDotData(
                      show: true,
                    )),
                LineChartBarData(
                    spots: [
                      FlSpot(0, data.expensePerDay[0]),
                      FlSpot(2, data.expensePerDay[1]),
                      FlSpot(4, data.expensePerDay[2]),
                      FlSpot(6, data.expensePerDay[3]),
                      FlSpot(8, data.expensePerDay[4]),
                      FlSpot(10, data.expensePerDay[5]),
                      FlSpot(12, data.expensePerDay[6]),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: gradientColors
                          .map((e) => e.withOpacity(0.3))
                          .toList(),
                    ),
                    dotData: FlDotData(
                      show: true,
                    )),
              ])),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, error: (error, stack) {
      throw error.toString();
    });
  }
}
