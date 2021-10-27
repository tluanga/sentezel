import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/analytics/analytics_controller.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/analytics/enum.dart';
import 'package:sentezel/analytics/screens/line_chart.dart';
import 'package:sentezel/analytics/screens/pie_chart.dart';
import 'package:sentezel/analytics/ui/indicator.dart';

class AnalyticsScreen extends HookConsumerWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analyticsControllerProvider);
    useEffect(() {
      ref.watch(analyticsControllerProvider.notifier).loadData();
    }, []);
    return state.when(data: (data) {
      final state = ref.watch(analyticsControllerProvider);
      // print(data.salesPerDay);
      // print(data.expensePerDay);
      // print(data.salesPerMonth);
      // print(data.salesPerDay.length);
      // print(data.salesPerMonth.length);
      // ---------Setting up the values of X-Axis and Y-Axis----------
      List<double> yAxissalesSpots = [0, 0, 0, 0, 0, 0, 0];
      List<double> yAxisexpenseSpots = [0, 0, 0, 0, 0, 0, 0];
      List<String> xAxisScalingValues = ['', '', '', '', '', '', ''];
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
          xAxisScalingValues[i] = DateFormat('dd/MM').format(DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day - i));
        } else if (data.timePeriod == TimePeriod.monthly) {
          xAxisScalingValues[i] = DateFormat('MMM')
              .format(DateTime(DateTime.now().year, DateTime.now().month - i));
        }
      }
      // -----------Completing Setup-------------------
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TimePeriodTab(
                      state: state,
                      ref: ref,
                      title: 'Daily',
                      selectedTimePeriod: TimePeriod.daily,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TimePeriodTab(
                        ref: ref,
                        title: 'Monthly',
                        state: state,
                        selectedTimePeriod: TimePeriod.monthly),
                    const SizedBox(
                      width: 10,
                    ),
                    TimePeriodTab(
                        ref: ref,
                        title: 'Financial Year',
                        state: state,
                        selectedTimePeriod: TimePeriod.financialYear)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                state.data!.value.timePeriod == TimePeriod.daily ||
                        state.data!.value.timePeriod == TimePeriod.monthly
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: LineChartWidget(
                              xAxisScalingValues: xAxisScalingValues,
                              maxYaxisValue: maxYaxisValue,
                              yAxissalesSpots: yAxissalesSpots,
                              yAxisexpenseSpots: yAxisexpenseSpots),
                        ),
                      )
                    : PieChartWidget(
                        totalAccountingYearExpense:
                            data.totalAccountingYearExpense,
                        totalAccountingYearSales: data.totalAccountingYearSales,
                      ),
                state.data!.value.timePeriod == TimePeriod.daily ||
                        state.data!.value.timePeriod == TimePeriod.monthly
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Indicator(
                              color: Colors.red.shade200,
                              text: 'Expense',
                              isSquare: true),
                          const Indicator(
                              color: Colors.green,
                              text: 'Sales',
                              isSquare: true)
                        ],
                      )
                    : Container()
              ],
            ),
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

class TimePeriodTab extends StatelessWidget {
  final TimePeriod selectedTimePeriod;
  final WidgetRef ref;
  final String title;
  const TimePeriodTab({
    Key? key,
    required this.ref,
    required this.title,
    required this.state,
    required this.selectedTimePeriod,
  }) : super(key: key);

  final AsyncValue<Analytics> state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.watch(analyticsControllerProvider.notifier).setState(
            state.data!.value.copyWith(timePeriod: selectedTimePeriod));
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: state.data!.value.timePeriod == selectedTimePeriod ? 0 : 10,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              color: state.data!.value.timePeriod == selectedTimePeriod
                  ? Colors.cyan[300]
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: AutoSizeText(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
