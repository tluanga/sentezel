// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:table_calendar/table_calendar.dart';

// class WeeklyTableCalendarWidget extends StatefulWidget {
//   WeeklyTableCalendarWidget({Key? key}) : super(key: key);

//   @override
//   _WeeklyTableCalendarWidgetState createState() =>
//       _WeeklyTableCalendarWidgetState();
// }

// class _WeeklyTableCalendarWidgetState extends State<WeeklyTableCalendarWidget> {
//   CalendarFormat _calendarFormat = CalendarFormat.week;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TableCalendar(
//         firstDay: DateTime.now().subtract(
//           Duration(days: 365),
//         ),
//         lastDay: DateTime.now().add(Duration(days: 50)),
//         focusedDay: DateTime.now(),
//         calendarFormat: _calendarFormat,
//         startingDayOfWeek: StartingDayOfWeek.monday,
//         headerStyle: HeaderStyle(
//           formatButtonVisible: true,
//           formatButtonTextStyle: TextStyle(color: Colors.black),
//           formatButtonShowsNext: true,
//           leftChevronVisible: true,
//           rightChevronVisible: true,
//           titleCentered: true,
//           titleTextFormatter: (date, locale) {
//             return DateFormat('MMMM dd,yyyy').format(date);
//           },
//           titleTextStyle: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPageChanged: (value) {
//           print('Page Changed value $value');
//           // Provider.of<WeeklyReportProvider>(context, listen: false)
//           //     .setWeekPeriod(value);
//         },
//         calendarStyle:
//             CalendarStyle(markerDecoration: BoxDecoration(color: Colors.red)),
//         daysOfWeekVisible: false,
//         calendarBuilders: CalendarBuilders(
//           //------Default Builder--
//           defaultBuilder: (context, date, _) {
//             return GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width * 0.13,
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       (DateFormat('EE').format(date)).toUpperCase(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       DateFormat('d').format(date),
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           outsideBuilder: (context, date, _) {
//             return GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width * 0.13,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       (DateFormat('EE').format(date)).toUpperCase(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       DateFormat('d').format(date),
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           //-------Today Builder---------
//           todayBuilder: (context, date, _) {
//             return GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width * 0.13,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       (DateFormat('EE').format(date)).toUpperCase(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       DateFormat('d').format(date),
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // setttingStartDayOfWeek(int date) {
// //   switch (date) {
// //     case FirstDayOfWeekConstant.monday:
// //       return StartingDayOfWeek.monday;
// //     case FirstDayOfWeekConstant.tuesday:
// //       return StartingDayOfWeek.tuesday;
// //     case FirstDayOfWeekConstant.wednesday:
// //       return StartingDayOfWeek.wednesday;
// //     case FirstDayOfWeekConstant.thursday:
// //       return StartingDayOfWeek.thursday;
// //     case FirstDayOfWeekConstant.friday:
// //       return StartingDayOfWeek.friday;
// //     case FirstDayOfWeekConstant.saturday:
// //       return StartingDayOfWeek.saturday;
// //     case FirstDayOfWeekConstant.sunday:
// //       return StartingDayOfWeek.sunday;

// //     default:
// //   }
// // }
