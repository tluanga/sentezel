import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_controller.dart';
import 'package:sentezel/analytics/barChart/barchart_widget.dart';
import 'package:sentezel/analytics/chart_mode_enum.dart';

import 'package:sentezel/analytics/ui/pie_chart.dart';

import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/analytics_time_frame_selection_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class AnalyticsScreen extends HookConsumerWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(analyticsControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBarWidget(
                title: 'Analytics',
                onClose: () {
                  Navigator.pop(context);
                },
              ),
              AnalyticsTimeFrameSelection(
                  onTimeSelect: (DateTime startDate, DateTime endDate) {
                ref.read(analyticsControllerProvider.notifier).setState(
                      state.copyWith(startDate: startDate, endDate: endDate),
                    );
              }),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: state.chartMode == ChartMode.barChart
                    ? const BarChartWidget()
                    : const PieChartSample(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(analyticsControllerProvider.notifier)
                            .changeChartMode(ChartMode.barChart);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.bar_chart),
                              Text(
                                'Bar Chart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(analyticsControllerProvider.notifier)
                            .changeChartMode(ChartMode.pieChart);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.pie_chart),
                              Text(
                                'Pie Chart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
