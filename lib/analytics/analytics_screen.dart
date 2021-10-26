import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/analytics/analytics_controller.dart';
import 'package:sentezel/analytics/enum.dart';

class AnalyticsScreen extends HookConsumerWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

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
      final state = ref.watch(analyticsControllerProvider);
      // print(data.salesPerDay);
      // print(data.expensePerDay);
      print(data.salesPerMonth);
      // print(data.salesPerDay.length);
      // print(data.salesPerMonth.length);
      // ---------Setting up the values of X-Axis and Y-Axis----------
      List<double> yAxissalesSpots = [0, 0, 0, 0, 0, 0, 0];
      List<double> yAxisexpenseSpots = [0, 0, 0, 0, 0, 0, 0];
      List xAxisScalingValues = [];
      for (int i = 0; i < 7; i++) {
        if (data.timePeriod == TimePeriod.daily) {
          yAxissalesSpots[i] = data.salesPerDay[i];
          yAxisexpenseSpots[i] = data.expensePerDay[i];
        } else if (data.timePeriod == TimePeriod.monthly) {
          yAxissalesSpots[i] = data.salesPerMonth[i];
          yAxisexpenseSpots[i] = data.expensePerMonth[i];
        }
      }
      double maxYaxisValue = 0;
      if (data.timePeriod == TimePeriod.daily) {
        maxYaxisValue = data.salesPerDay
                    .reduce((curr, next) => curr > next ? curr : next) >
                data.expensePerDay
                    .reduce((curr, next) => curr > next ? curr : next)
            ? data.salesPerDay.reduce((curr, next) => curr > next ? curr : next)
            : data.expensePerDay
                .reduce((curr, next) => curr > next ? curr : next);
      } else if (data.timePeriod == TimePeriod.monthly) {
        maxYaxisValue = data.salesPerMonth
                    .reduce((curr, next) => curr > next ? curr : next) >
                data.expensePerMonth
                    .reduce((curr, next) => curr > next ? curr : next)
            ? data.salesPerMonth
                .reduce((curr, next) => curr > next ? curr : next)
            : data.expensePerMonth
                .reduce((curr, next) => curr > next ? curr : next);
      }
      for (int i = 0; i < 7; i++) {
        if (data.timePeriod == TimePeriod.daily) {
          xAxisScalingValues.add(DateFormat('dd/MMM').format(DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day - i)));
        } else if (data.timePeriod == TimePeriod.monthly) {
          xAxisScalingValues.add(DateFormat('MMM')
              .format(DateTime(DateTime.now().year, DateTime.now().month - i)));
        }
      }
      // -----------Completing Setup-------------------
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.watch(analyticsControllerProvider.notifier).setState(
                          state.data!.value
                              .copyWith(timePeriod: TimePeriod.daily));
                      print(yAxissalesSpots);
                      print(yAxisexpenseSpots);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color:
                              state.data!.value.timePeriod == TimePeriod.daily
                                  ? Colors.green
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        'Daily',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.watch(analyticsControllerProvider.notifier).setState(
                          state.data!.value
                              .copyWith(timePeriod: TimePeriod.monthly));
                      print(yAxissalesSpots);
                      print(yAxisexpenseSpots);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color:
                              state.data!.value.timePeriod == TimePeriod.monthly
                                  ? Colors.green
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        'Monthly',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
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
                                  return DateFormat('dd/MM')
                                      .format(DateTime.now());
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
                            interval: maxYaxisValue / 5,
                            reservedSize: 60,
                            showTitles: true,
                            getTextStyles: (context, val) => const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
                            FlSpot(0, yAxisexpenseSpots[0]),
                            FlSpot(2, yAxisexpenseSpots[1]),
                            FlSpot(4, yAxisexpenseSpots[2]),
                            FlSpot(6, yAxisexpenseSpots[3]),
                            FlSpot(8, yAxisexpenseSpots[4]),
                            FlSpot(10, yAxisexpenseSpots[5]),
                            FlSpot(12, yAxisexpenseSpots[6]),
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
            ],
          ),
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
