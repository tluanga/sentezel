import 'package:flutter/material.dart';

import 'package:sentezel/analytics/ui/bar_chart.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              BarChartSample2(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                    Container(
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
