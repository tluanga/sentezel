// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';



// class AnalyticsTimeFrameSelection extends StatefulWidget {
//   AnalyticsTimeFrameSelection({Key? key}) : super(key: key);

//   @override
//   _AnalyticsTimeFrameSelectionState createState() =>
//       _AnalyticsTimeFrameSelectionState();
// }

// class _AnalyticsTimeFrameSelectionState
//     extends State<AnalyticsTimeFrameSelection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 2,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             child: Row(
//               children: [
//                 Text(
//                   'Pay Period',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 // Icon(
//                 //   CupertinoIcons.chevron_down,
//                 //   size: 16,
//                 // )
//               ],
//             ),
//           ),
//           _dayWiseSelection(),
//         ],
//       ),
//     );
//   }

//   //-------------Day Wise- Date Range Selector---------------
//   //-----------Selection of 7 Days which are continous------------

//   _dayWiseSelection() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.6,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () async {
//               //open Date Seletor
//               DateTime? date = DateTime.now();
//               date = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(DateTime.now().year),
//                 lastDate: DateTime.now().add(
//                   Duration(
//                     days: 100,
//                   ),
//                 ),
//               );

//               model.startDate = date!;
//             },
//             child: Container(
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_today,
//                     size: 20,
//                   ),
//                   Text(
//                     DateFormat('d-MM-y ').format(model.startDate),
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Icon(
//                     CupertinoIcons.chevron_down,
//                     size: 16,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () async {
//               //open Date Seletor
//               var date = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(DateTime.now().year),
//                 lastDate: DateTime.now().add(
//                   Duration(
//                     days: 100,
//                   ),
//                 ),
//               );
//               Provider.of<AnalyticsProvider>(context, listen: false).endDate =
//                   date!;
//             },
//             child: Container(
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_today,
//                     size: 20,
//                   ),
//                   Text(
//                     DateFormat('d-MM-y ').format(model.endDate),
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Icon(
//                     CupertinoIcons.chevron_down,
//                     size: 18,
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // _weekSelection(AnalyticsProvider model) {
//   //   return Container(
//   //     width: MediaQuery.of(context).size.width * 0.6,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );

//   //             model.startDate = date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Year',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 16,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );
//   //             Provider.of<AnalyticsProvider>(context, listen: false).endDate =
//   //                 date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Month',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 18,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );
//   //             Provider.of<AnalyticsProvider>(context, listen: false).endDate =
//   //                 date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Week',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 18,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   // // -------------Selection of  Month------------------------
//   // _monthSelection(AnalyticsProvider model) {
//   //   return Container(
//   //     width: MediaQuery.of(context).size.width * 0.6,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );

//   //             model.startDate = date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Select Year',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 16,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );
//   //             Provider.of<AnalyticsProvider>(context, listen: false).endDate =
//   //                 date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Select Month',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 18,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   // _yearSelection(AnalyticsProvider model) {
//   //   return Container(
//   //     width: MediaQuery.of(context).size.width * 0.6,
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         GestureDetector(
//   //           onTap: () async {
//   //             //open Date Seletor
//   //             var date = await showDatePicker(
//   //               context: context,
//   //               initialDate: DateTime.now(),
//   //               firstDate: DateTime(DateTime.now().year),
//   //               lastDate: DateTime.now(),
//   //             );

//   //             model.startDate = date!;
//   //           },
//   //           child: Container(
//   //             child: Row(
//   //               children: [
//   //                 Icon(
//   //                   Icons.calendar_today,
//   //                   size: 20,
//   //                 ),
//   //                 Text(
//   //                   'Select Year',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                   ),
//   //                 ),
//   //                 Icon(
//   //                   CupertinoIcons.chevron_down,
//   //                   size: 16,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
