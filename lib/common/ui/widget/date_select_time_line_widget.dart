import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class DateSelectTimeLineWidget extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final DateTime initialDate;
  const DateSelectTimeLineWidget({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      onDateSelected: (selectedDate) {
        onDateSelected(selectedDate!);
      },
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(
        const Duration(days: 365),
      ),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      leftMargin: 20,
      monthColor: Colors.blueGrey,
      dayNameColor: Colors.white,
      dayColor: Colors.black,
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Colors.redAccent[100],

      dotsColor: const Color(0xFF333A47),
      // selectableDayPredicate: (date) => date.day != 23,
      locale: 'en_ISO',
    );
  }
}
