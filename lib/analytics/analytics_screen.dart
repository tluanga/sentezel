import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/analytics/ui/bar_chart.dart';
import 'package:sentezel/analytics/ui/pie_chart.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/analyticsTimeFrameSelection_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';

class AnalyticsScreen extends HookConsumerWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _chartMode = useState(0);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBarWidget(
                title: 'Analytics',
                onClose: () {
                  Navigator.pop(context);
                },
              ),
              AnalyticsTimeFrameSelection(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: _chartMode.value == 0
                    ? BarChartSample2()
                    : PieChartSample2(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _chartMode.value = 0;
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
                            children: [
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
                        _chartMode.value = 1;
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
                            children: [
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
