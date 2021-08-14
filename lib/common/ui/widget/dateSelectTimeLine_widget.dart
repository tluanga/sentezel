import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class DateSelectTimeLineWidget extends StatelessWidget {
  const DateSelectTimeLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          Duration(days: 365),
        ),
        lastDate: DateTime.now().add(Duration(days: 30)),
        onDateSelected: (date) => () {},
        leftMargin: 20,
        monthColor: Colors.blueGrey,
        dayNameColor: Colors.white,
        dayColor: Colors.black,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Colors.redAccent[100],
        dotsColor: Color(0xFF333A47),
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',
      ),
    );
  }
}
