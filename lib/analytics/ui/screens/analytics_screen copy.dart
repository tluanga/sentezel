// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:sentezel/analytics/analytics_controller.dart';
// import 'package:sentezel/analytics/analytics_model.dart';
// import 'package:sentezel/analytics/controller_provider.dart';
// import 'package:sentezel/analytics/enum.dart';
// import 'package:sentezel/analytics/screens/line_chart.dart';
// import 'package:sentezel/analytics/screens/pie_chart.dart';
// import 'package:sentezel/analytics/ui/indicator.dart';
// import 'package:sentezel/analytics/ui/widgets/analytics_appbar.dart';

// class AnalyticsScreen extends HookConsumerWidget {
//   const AnalyticsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(analyticsControllerProvider);
//     useEffect(() {
//       ref.watch(analyticsControllerProvider.notifier).loadData();
//     }, []);
//     return state.when(data: (data) {
//       final state = ref.watch(analyticsControllerProvider);
//       // print(data.salesPerDay);
//       // print(data.expensePerDay);
//       // print(data.salesPerMonth);
//       // print(data.salesPerDay.length);
//       // print(data.salesPerMonth.length);
//       // ---------Setting up the values of X-Axis and Y-Axis----------
//       List<double> yAxissalesSpots = [0, 0, 0, 0, 0, 0, 0];
//       List<double> yAxisexpenseSpots = [0, 0, 0, 0, 0, 0, 0];
//       List<String> xAxisScalingValues = ['', '', '', '', '', '', ''];
//       for (int i = 0; i < 7; i++) {
//         if (data.timePeriod == TimePeriod.daily) {
//           yAxissalesSpots[i] = data.salesPerDay[i];
//           yAxisexpenseSpots[i] = data.expensePerDay[i];
//         } else if (data.timePeriod == TimePeriod.monthly) {
//           yAxissalesSpots[i] = data.salesPerMonth[i];
//           yAxisexpenseSpots[i] = data.expensePerMonth[i];
//         }
//       }
//       double maxYaxisValue = 0;
//       if (data.timePeriod == TimePeriod.daily) {
//         maxYaxisValue = data.salesPerDay
//                     .reduce((curr, next) => curr > next ? curr : next) >
//                 data.expensePerDay
//                     .reduce((curr, next) => curr > next ? curr : next)
//             ? data.salesPerDay.reduce((curr, next) => curr > next ? curr : next)
//             : data.expensePerDay
//                 .reduce((curr, next) => curr > next ? curr : next);
//       } else if (data.timePeriod == TimePeriod.monthly) {
//         maxYaxisValue = data.salesPerMonth
//                     .reduce((curr, next) => curr > next ? curr : next) >
//                 data.expensePerMonth
//                     .reduce((curr, next) => curr > next ? curr : next)
//             ? data.salesPerMonth
//                 .reduce((curr, next) => curr > next ? curr : next)
//             : data.expensePerMonth
//                 .reduce((curr, next) => curr > next ? curr : next);
//       }
//       for (int i = 0; i < 7; i++) {
//         if (data.timePeriod == TimePeriod.daily) {
//           xAxisScalingValues[i] = DateFormat('dd/MM').format(DateTime(
//               DateTime.now().year,
//               DateTime.now().month,
//               DateTime.now().day - i));
//         } else if (data.timePeriod == TimePeriod.monthly) {
//           xAxisScalingValues[i] = DateFormat('MMM')
//               .format(DateTime(DateTime.now().year, DateTime.now().month - i));
//         }
//       }
//       // -----------Completing Setup-------------------
//       return Container(
//         color: Colors.white,
//         child: SafeArea(
//           child: Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.only(
//                   left: 10, right: 10, top: 8, bottom: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   analyticsAppBar(),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text('Pawisa lut leh chhuak',
//                       style: GoogleFonts.archivo(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey.shade700)),
//                   // state.data!.value.timePeriod == TimePeriod.daily ||
//                   //         state.data!.value.timePeriod == TimePeriod.monthly
//                   //     ?
//                   SizedBox(
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Indicator(
//                             color: Colors.blue.shade200,
//                             text: 'Hmanral',
//                             isSquare: false),
//                         const SizedBox(
//                           width: 50,
//                         ),
//                         const Indicator(
//                             color: Colors.green,
//                             text: 'Lakluh',
//                             isSquare: false)
//                       ],
//                     ),
//                   ),
//                   //  : Container(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   state.data!.value.timePeriod == TimePeriod.daily ||
//                           state.data!.value.timePeriod == TimePeriod.monthly
//                       ? Expanded(
//                           child: LineChartWidget(
//                               xAxisScalingValues: xAxisScalingValues,
//                               maxYaxisValue: maxYaxisValue,
//                               yAxissalesSpots: yAxissalesSpots,
//                               yAxisexpenseSpots: yAxisexpenseSpots),
//                         )
//                       : Expanded(
//                           child: PieChartWidget(
//                             totalAccountingYearExpense:
//                                 data.totalAccountingYearExpense,
//                             totalAccountingYearSales:
//                                 data.totalAccountingYearSales,
//                           ),
//                         ),
//                   // const SizedBox(
//                   //   height: 10,
//                   // ),
//                   //  Spacer(),
//                   Center(
//                     child: Container(
//                       height: 38,
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Colors.grey.shade900, width: 0.5),
//                           borderRadius: BorderRadius.circular(20)),
//                       child: DropdownButton<String>(
//                         dropdownColor: Colors.grey.shade300,
//                         underline: Container(
//                           color: Colors.transparent,
//                         ),
//                         hint: Text(ref
//                             .watch(periodController.notifier)
//                             .state
//                             .toString()),
//                         elevation: 0,
//                         //value: Text,
//                         // ref.watch(periodController.notifier).state.toString(),
//                         items: <String>[
//                           'Nitin',
//                           'Thlatin',
//                           'Financial Year',
//                         ].map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               //style: const TextStyle(color: Colors.red),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (_) {
//                           if (_ == 'Nitin') {
//                             ref.read(periodController.notifier).state =
//                                 'Nitin (Daily)';
//                             ref
//                                 .watch(analyticsControllerProvider.notifier)
//                                 .setState(state.data!.value
//                                     .copyWith(timePeriod: TimePeriod.daily));
//                           }
//                           if (_ == 'Thlatin') {
//                             ref.read(periodController.notifier).state =
//                                 'Thlatin (Monthly)';
//                             ref
//                                 .watch(analyticsControllerProvider.notifier)
//                                 .setState(state.data!.value
//                                     .copyWith(timePeriod: TimePeriod.monthly));
//                           }
//                           if (_ == 'Financial Year') {
//                             ref.read(periodController.notifier).state =
//                                 'Financial Year';
//                             ref
//                                 .watch(analyticsControllerProvider.notifier)
//                                 .setState(state.data!.value.copyWith(
//                                     timePeriod: TimePeriod.financialYear));
//                           }
//                         },
//                       ),
//                     ),
//                   )

//                   // Center(
//                   //   child: Container(
//                   //     decoration: BoxDecoration(
//                   //         border: Border.all(color: Colors.black),
//                   //         borderRadius: BorderRadius.circular(15)),
//                   //     child: const Padding(
//                   //       padding:
//                   //           EdgeInsets.symmetric(horizontal: 20, vertical: 6),
//                   //       child: Text('Daily'),
//                   //     ),
//                   //   ),
//                   // ),
//                   // Card(
//                   //   elevation: 20,
//                   //   //color: Color(0xff232d37),
//                   //   shape: const RoundedRectangleBorder(
//                   //     borderRadius: BorderRadius.all(
//                   //       Radius.circular(10),
//                   //     ),
//                   //   ),
//                   //   child: SizedBox(
//                   //     height: 50,
//                   //     child: Row(
//                   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //       children: [
//                   //         TimePeriodTab(
//                   //           state: state,
//                   //           ref: ref,
//                   //           title: 'Daily',
//                   //           selectedTimePeriod: TimePeriod.daily,
//                   //         ),
//                   //         const SizedBox(
//                   //           width: 10,
//                   //         ),
//                   //         TimePeriodTab(
//                   //             ref: ref,
//                   //             title: 'Monthly',
//                   //             state: state,
//                   //             selectedTimePeriod: TimePeriod.monthly),
//                   //         const SizedBox(
//                   //           width: 10,
//                   //         ),
//                   //         TimePeriodTab(
//                   //             ref: ref,
//                   //             title: 'Financial Year',
//                   //             state: state,
//                   //             selectedTimePeriod: TimePeriod.financialYear)
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   ,
//                   const SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }, loading: () {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }, error: (error, stack) {
//       throw error.toString();
//     });
//   }
// }

// class TimePeriodTab extends StatelessWidget {
//   final TimePeriod selectedTimePeriod;
//   final WidgetRef ref;
//   final String title;
//   const TimePeriodTab({
//     Key? key,
//     required this.ref,
//     required this.title,
//     required this.state,
//     required this.selectedTimePeriod,
//   }) : super(key: key);

//   final AsyncValue<Analytics> state;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ref.watch(analyticsControllerProvider.notifier).setState(
//             state.data!.value.copyWith(timePeriod: selectedTimePeriod));
//       },
//       child: Material(
//         borderRadius: BorderRadius.circular(5),
//         elevation: state.data!.value.timePeriod == selectedTimePeriod ? 0 : 10,
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.25,
//           height: MediaQuery.of(context).size.height * 0.05,
//           decoration: BoxDecoration(
//               color: state.data!.value.timePeriod == selectedTimePeriod
//                   ? Colors.cyan[300]
//                   : Colors.grey[300],
//               borderRadius: BorderRadius.circular(5)),
//           child: Center(
//             child: AutoSizeText(
//               title,
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
