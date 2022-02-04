import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PieChartWidget extends StatefulWidget {
  final int totalAccountingYearSales;
  final int totalAccountingYearExpense;
  const PieChartWidget({
    Key? key,
    required this.totalAccountingYearSales,
    required this.totalAccountingYearExpense,
  }) : super(key: key);

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 2,
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 60,
                  sections: showingSections(
                      expenseTotal: widget.totalAccountingYearExpense,
                      salesTotal: widget.totalAccountingYearSales)),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        // Column(
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: const <Widget>[
        //     Indicator(color: Color(0xff0293ee), text: 'Sales', isSquare: true),
        //     SizedBox(
        //       height: 4,
        //     ),
        //     Indicator(color: Color(0xfff8b250), text: 'Expense', isSquare: true)
        //   ],
        // ),
        // const SizedBox(
        //   width: 28,
        // ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      {required int salesTotal, required int expenseTotal}) {
    return List.generate(2, (i) {
      final int total = salesTotal + expenseTotal;
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: ((salesTotal / total) * 100).toDouble(),
            title: salesTotal.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blue.shade400,
            value: ((expenseTotal / total) * 100).toDouble(),
            title: expenseTotal.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
