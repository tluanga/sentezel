import 'package:flutter/material.dart';
import 'package:sentezel/analytics/analyticsPeriodSelectionBar_widget.dart';
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
              AnalyticsPeriodSelectionBar(),
            ],
          ),
        ),
      ),
    );
  }
}
