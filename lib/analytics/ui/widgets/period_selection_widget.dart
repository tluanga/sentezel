import 'package:flutter/material.dart';

class PeriodSelectionWidget extends StatelessWidget {
  const PeriodSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('This year'),
        ],
      ),
    );
  }
}
