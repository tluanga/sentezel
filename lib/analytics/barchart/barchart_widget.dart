import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/barChart/barchart_scale_yvalue_helper.dart';
import 'package:sentezel/analytics/barchart/bar_chart_controller.dart';

import 'bar_chart_controller.dart';

class BarChartWidget extends HookConsumerWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Color leftBarColor = Color(0xff53fdd7);
    const Color rightBarColor = Color(0xffff5182);
    const double width = 7;

    late List<BarChartGroupData> rawBarGroups;
    late List<BarChartGroupData> showingBarGroups;

    int touchedGroupIndex = -1;
    final state = ref.watch(barChartControllerProvider);

    useEffect(() {
      ref.watch(barChartControllerProvider.notifier).loadData();
      final barGroup1 = makeGroupData(0, 5, 12);
      showingBarGroups = [barGroup1];
    }, []);
    return Material(
      child: Container(
        child: state.when(
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
                          const Text(
                            'Transactions',
                            style: TextStyle(color: Colors.white, fontSize: 22),
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
                      // Expanded(
                      //   child: BarChart(
                      //     BarChartData(
                      //       maxY: 20,
                      //       titlesData: FlTitlesData(
                      //         show: true,
                      //         bottomTitles: _bottomTitles(
                      //           generateLeftTitle(highestValue: 1000),
                      //         ),
                      //       ),
                      //       barGroups: showingBarGroups,
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   child: BarChart(
                      //     BarChartData(
                      //       maxY: 20,
                      //       // titlesData: FlTitlesData(
                      //       //   show: true,
                      //       //   rightTitles: SideTitles(showTitles: false),
                      //       //   topTitles: SideTitles(showTitles: false),
                      //       //   bottomTitles: _bottomTitles(),
                      //       //   leftTitles: _leftTitles(
                      //       //       leftTitles:
                      //       //           generateLeftTitle(highestValue: 12)),
                      //       // ),
                      //       // borderData: FlBorderData(
                      //       //   show: false,
                      //       // ),
                      //       barGroups: showingBarGroups,
                      //       gridData: FlGridData(show: false),
                      //     ),
                      //   ),
                      // ),
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

// class BarChartSample2 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => BarChartSample2State();
// }

// class BarChartSample2State extends State<BarChartSample2> {
//   final Color leftBarColor = const Color(0xff53fdd7);
//   final Color rightBarColor = const Color(0xffff5182);
//   final double width = 7;

//   late List<BarChartGroupData> rawBarGroups;
//   late List<BarChartGroupData> showingBarGroups;

//   int touchedGroupIndex = -1;

//   @override
//   void initState() {
//     super.initState();
//     final barGroup1 = makeGroupData(0, 5, 12);
//     final barGroup2 = makeGroupData(1, 16, 12);
//     final barGroup3 = makeGroupData(2, 18, 5);
//     final barGroup4 = makeGroupData(3, 20, 16);
//     final barGroup5 = makeGroupData(4, 17, 6);
//     final barGroup6 = makeGroupData(5, 19, 1.5);
//     final barGroup7 = makeGroupData(6, 10, 1.5);

//     final items = [
//       barGroup1,
//       barGroup2,
//       barGroup3,
//       barGroup4,
//       barGroup5,
//       barGroup6,
//       barGroup7,
//     ];

//     rawBarGroups = items;

//     showingBarGroups = rawBarGroups;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Card(
//         elevation: 0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         color: const Color(0xff2c4260),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   makeTransactionsIcon(),
//                   const SizedBox(
//                     width: 38,
//                   ),
//                   const Text(
//                     'Transactions',
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                   const SizedBox(
//                     width: 50,
//                   ),
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.arrow_left,
//                           color: Colors.white,
//                           size: 50,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Icon(
//                           Icons.arrow_right,
//                           color: Colors.white,
//                           size: 50,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 38,
//               ),
//               Expanded(
//                 child: BarChart(
//                   BarChartData(
//                     maxY: 20,
//                     titlesData: FlTitlesData(
//                       show: true,
//                       rightTitles: SideTitles(showTitles: true),
//                       topTitles: SideTitles(showTitles: false),
//                       bottomTitles: _bottomTitles(),
//                       leftTitles: _leftTitles(),
//                     ),
//                     borderData: FlBorderData(
//                       show: false,
//                     ),
//                     barGroups: showingBarGroups,
//                     gridData: FlGridData(show: false),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

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
      } else
        return leftTitles[5];
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
