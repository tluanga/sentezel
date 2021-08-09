import 'package:flutter/material.dart';

class AnalyticsPeriodSelectionBar extends StatelessWidget {
  const AnalyticsPeriodSelectionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              child: Text('Monthly'),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Text('weekly'),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Text('Daily'),
            ),
          ),
        ],
      ),
    );
  }
}
