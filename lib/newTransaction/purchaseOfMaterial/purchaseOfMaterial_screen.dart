import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/common/ui/widget/weeklyTableCalendar_widget.dart';

class PurchaseOfMaterialScreen extends HookConsumerWidget {
  const PurchaseOfMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWithSaveWidget(
              title: 'Purchase of Material',
              onSave: () {},
            ),
            WeeklyTableCalendarWidget(
              onDateSelect: (selectedDate) {},
            ),
            //----BA Or Ba Lo
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text('BA'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
