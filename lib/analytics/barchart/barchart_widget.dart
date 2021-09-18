import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_controller.dart';
import 'package:sentezel/analytics/barchart/bar_chart_controller.dart';

class BarChartWidget extends HookConsumerWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Color incomeColor = Color(0xff53fdd7);
    const Color expenseColor = Color(0xffff5182);
    final analyticsState = ref.watch(analyticsControllerProvider);
    useEffect(() {
      ref
          .read(barChartControllerProvider.notifier)
          .loadData(analyticsState.startDate, analyticsState.endDate);
    }, []);
    print(analyticsState);
    return Material(
      child: Container(
        child: ref.watch(barChartControllerProvider).when(
              data: (data) {
                return AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: const Color(0xff2c4260),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              makeTransactionsIcon(),
                              const SizedBox(
                                width: 38,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Transactions',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Income',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          decoration: const BoxDecoration(
                                              color: incomeColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Expense',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          decoration: const BoxDecoration(
                                              color: expenseColor),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_left,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_right,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                maxY: 5,
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: _bottomTitles(data.bottomTitle),
                                  leftTitles:
                                      _leftTitles(leftTitles: data.leftTitle),
                                ),
                                barGroups: data.barGroupList,
                                gridData: FlGridData(show: false),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              error: (error, stack) {},
            ),
      ),
    );
  }
}

_bottomTitles(List<String> bottomTitles) {
  return SideTitles(
    showTitles: true,
    getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
    margin: 20,
    getTitles: (values) {
      switch (values.toInt()) {
        case 0:
          return bottomTitles[0];
        case 1:
          return bottomTitles[1];
        case 2:
          return bottomTitles[2];
        case 3:
          return bottomTitles[3];
        case 4:
          return bottomTitles[4];
        case 5:
          return bottomTitles[5];
        case 6:
          return bottomTitles[6];
        case 7:
          return bottomTitles[7];
        case 8:
          return bottomTitles[8];
        default:
          return '';
      }
    },
  );
}

_leftTitles({required List<String> leftTitles}) {
  return SideTitles(
    showTitles: true,
    getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
    margin: 8,
    reservedSize: 28,
    interval: 1,
    getTitles: (values) {
      if (values == 0) {
        return leftTitles[0];
      } else if (values <= 1) {
        return leftTitles[1];
      } else if (values <= 2) {
        return leftTitles[2];
      } else if (values <= 3) {
        return leftTitles[3];
      } else if (values <= 4) {
        return leftTitles[4];
      } else {
        return leftTitles[5];
      }
    },
  );
}

// BarChartGroupData makeGroupData(int x, double y1, double y2) {
//   return BarChartGroupData(barsSpace: 4, x: x, barRods: [
//     BarChartRodData(
//       y: y1,
//       colors: [leftBarColor],
//       width: width,
//     ),
//     BarChartRodData(
//       y: y2,
//       colors: [rightBarColor],
//       width: width,
//     ),
//   ]);
// }

Widget makeTransactionsIcon() {
  const width = 4.5;
  const space = 3.5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 42,
        color: Colors.white.withOpacity(1),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
    ],
  );
}
