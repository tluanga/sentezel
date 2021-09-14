// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:lytworkshift/constants/analysisPeriod_constant.dart';
// import 'package:lytworkshift/constants/palette_constant.dart';
// import 'package:lytworkshift/helpers/dateTime_helper.dart';
// import 'package:lytworkshift/models/barChartDataElement.dart';
// import 'package:lytworkshift/models/dayEarning_models.dart';
// import 'package:lytworkshift/models/shift_model.dart';
// import 'package:lytworkshift/services/shift_service.dart';
// import 'package:quiver/iterables.dart';
// // import 'package:lytworkshift/helpers/debug/debug.dart';

// class AnalyticsProvider extends ChangeNotifier {
//   // ignore: unused_field
//   List<Shift> _shiftList = [];
//   String _analysisPeriod = AnalysisPeriodConstant.day;
//   String get analysisPeriod => _analysisPeriod;
//   set analysisPeriod(String value) {
//     _analysisPeriod = value;
//     notifyListeners();
//   }

//   // ignore: unused_field
//   List<DayEarning> _dayEarnings = <DayEarning>[];
//   List<DayEarning> get dayEarnings => _dayEarnings;

//   int _totalEarning = 0;
//   int get totalEarning => _totalEarning;

//   Shift? _mostValuableShift;
//   int get mostValuableShift => _mostValuableShift!.workPay;

//   Shift? _leastValuableShift;
//   int get leastValuableShift => _leastValuableShift!.workPay;

//   Shift? _shortestShift;
//   int get shortestShift => _shortestShift!.shiftDuration;

//   Shift? _longestShift;
//   int get longestShift => _longestShift!.shiftDuration;

//   int _totalTaxAmount = 0;
//   int get totalTaxAmount => _totalTaxAmount;

//   //----------For Chart----------------
//   List<String> bottomTitles = [];
//   List<String> leftTitles = [];

//   List<BarChartGroupData> barChartGroupDataList = [];
//   List<BarChartDataElement> barChartDataElementList = [];
//   int chunkSize = 0;

//   // ignore: unused_field
//   int _totalNoOfHours = 0;
//   //--------------Input Dates From User--------------
//   DateTime _startDate =
//       DateTime.now().subtract(Duration(days: 6)); //Seven Days from current date
//   DateTime get startDate => _startDate;
//   set startDate(DateTime date) {
//     _startDate = date;
//     loadData();
//     notifyListeners();
//   }

//   DateTime _endDate = DateTime.now();
//   DateTime get endDate => _endDate;
//   set endDate(DateTime date) {
//     _endDate = date;
//     loadData();
//     notifyListeners();
//   }

//   int _totalNoOfDays = 0;
//   int get totalNumberOfHours => _totalNoOfDays;

//   int _averageWagePerDay = 0;
//   int get averageWagePerDay => _averageWagePerDay;

//   int _averageWagePerShift = 0;
//   int get averageWagePerShift => _averageWagePerShift;

//   int _averageHoursInaDay = 0;
//   int get averagePerHoursInaDay => _averageHoursInaDay;

//   int _totalNoOfShift = 0;
//   int get totalNoOfShift => _totalNoOfShift;

//   int _maxHoursInDay = 0;
//   int get maxHoursInDay => _maxHoursInDay;

//   int _maxWagePerDay = 0;
//   int get maxWagePerDay => _maxWagePerDay;

//   bool isLoading = true;
//   ShiftService _shiftService = new ShiftService();
//   void loadData() async {
//     //---------Initial Data-----------------
//     _totalEarning = 0;
//     _totalNoOfDays = 0;
//     _totalNoOfShift = 0;
//     _averageWagePerDay = 0;
//     _averageWagePerShift = 0;
//     _mostValuableShift = null;
//     _leastValuableShift = null;
//     _shortestShift = null;
//     _longestShift = null;
//     barChartDataElementList = [];
//     leftTitles = [];

//     _totalTaxAmount = 0;

//     barChartGroupDataList = [];
//     bottomTitles = [];
//     isLoading = true;

//     _shiftList = await _shiftService.getAllShift(
//       startDate: _startDate,
//       endDate: _endDate,
//     );
//     _shiftList.sort((a, b) => a.saveOnDate.compareTo(b.saveOnDate));
//     if (_shiftList.length > 0) {
//       processData();
//       isLoading = false;
//     }

//     notifyListeners();
//   }

//   //------------processing Data---------------
//   processData() async {
//     _totalNoOfShift = _shiftList.length;
//     _totalEarning = 0;
//     _totalNoOfHours = 0;
//     _averageWagePerDay = 0;
//     _averageWagePerShift = 0;
//     _dayEarnings = [];

//     int _dayIndex = 0;
//     DayEarning _newDayEarning;

//     _shiftList.asMap().forEach(
//       (index, element) {
//         //-------Tax Calculation-------

//         // ______________DAY CALCULATION_______________
//         //------Check for same day
//         if (index > 0) {
//           //Checking each Shift for most valuable shift
//           if (element.workPay > _mostValuableShift!.workPay)
//             _mostValuableShift = element;

//           // least valuable shift
//           if (element.workPay < _leastValuableShift!.workPay)
//             _leastValuableShift = element;
//           // Shortest Shift
//           if (element.shiftDuration < _shortestShift!.shiftDuration)
//             _shortestShift = element;
//           //Longest Shift
//           if (element.shiftDuration > _longestShift!.shiftDuration)
//             _longestShift = element;
//           //--------Checking for Shortest Shift----

//           // -------Check-if the new event is of a same day---
//           if (DateHelper.compareTwoDateWithoutTime(
//                   element.saveOnDate, _shiftList[index - 1].saveOnDate) ==
//               DateHelper.Equal) {
//             DayEarning _previousDay = _dayEarnings[_dayIndex - 1];

//             _previousDay.earnings += element.workPay;
//             _previousDay.totalHours += element.shiftDuration;
//             _previousDay.averageShiftDuration =
//                 (_previousDay.totalHours / _previousDay.noOfShift).round();
//             _previousDay.averageShiftPay =
//                 (_previousDay.earnings / _previousDay.noOfShift).round();
//             _previousDay.mostValuableShift =
//                 _previousDay.mostValuableShift.workPay > element.workPay
//                     ? _previousDay.mostValuableShift
//                     : element;
//             _previousDay.leastValuableShift =
//                 _previousDay.leastValuableShift.workPay < element.workPay
//                     ? _previousDay.mostValuableShift
//                     : element;
//             _dayEarnings[_dayIndex - 1] = _previousDay;
//           }

//           // -------Check-if the new event is of a seperate day---
//           if (DateHelper.compareTwoDateWithoutTime(
//                   element.saveOnDate, _shiftList[index - 1].saveOnDate) !=
//               DateHelper.Equal) {
//             DayEarning _previousDay = _dayEarnings[_dayIndex - 1];

//             _newDayEarning = DayEarning(
//               date: element.saveOnDate,
//               noOfShift: 1,
//               earnings: element.workPay,
//               totalHours: element.shiftDuration,
//               averageShiftDuration: element.shiftDuration,
//               averageShiftPay: element.workPay,
//               mostValuableShift:
//                   element.workPay > _previousDay.mostValuableShift.workPay
//                       ? element
//                       : _previousDay.mostValuableShift,
//               leastValuableShift:
//                   element.workPay < _previousDay.leastValuableShift.workPay
//                       ? element
//                       : _previousDay.leastValuableShift,
//             );

//             _dayEarnings.add(_newDayEarning);
//             _dayIndex++;
//           }
//         }

//         if (index == 0) {
//           _mostValuableShift = element;
//           _leastValuableShift = element;
//           _shortestShift = element;
//           _longestShift = element;
//           _newDayEarning = DayEarning(
//             date: element.saveOnDate,
//             noOfShift: 1,
//             earnings: element.workPay,
//             totalHours: element.shiftDuration,
//             averageShiftDuration: element.shiftDuration,
//             averageShiftPay: element.workPay,
//             mostValuableShift: element,
//             leastValuableShift: element,
//           );
//           _dayEarnings.add(_newDayEarning);
//           _dayIndex = 1;
//         }

//         //------Total---------------
//         _totalEarning += element.workPay;
//         _totalNoOfHours += element.shiftDuration;
//       },
//     );

//     processingDays();
//     generateChartData();
//     _totalTaxAmount = ((totalEarning / 100) * 10).toInt();
//     notifyListeners();
//   }

//   processingDays() {
//     //--------------------Analytics-----Processing Days--------
//     _totalNoOfDays = _dayEarnings.length;
//     _averageWagePerDay = (_totalEarning / _totalNoOfDays).round();
//     _averageWagePerShift = (_totalEarning / _totalNoOfShift).round();
//     _averageHoursInaDay = (_totalNoOfHours / _totalNoOfDays).round();

//     //--Day analysis---
//     _dayEarnings.asMap().forEach(
//       (index, element) {
//         if (index == 0) {
//           _maxHoursInDay = element.totalHours;
//           _maxWagePerDay = element.earnings;
//         }
//         if (index > 0) {
//           _maxHoursInDay = element.totalHours > _maxHoursInDay
//               ? element.totalHours
//               : _maxHoursInDay;
//           _maxWagePerDay = element.earnings > _maxWagePerDay
//               ? element.earnings
//               : _maxWagePerDay;
//         }
//         notifyListeners();
//       },
//     );
//   }

//   generateChartData() {
//     //-------------As the chart can only display 7 bars at a time, all data selected will be devided into 7 groups
//     Iterable<List<DayEarning>> splitData = [];
//     barChartDataElementList = [];
//     int highestEarning = 0;

//     if (_dayEarnings.length > 4) {
//       chunkSize = ((_dayEarnings.length / 4).ceilToDouble()).toInt();
//       splitData = partition(_dayEarnings, chunkSize);
//       splitData.forEach(
//         (splitDataElement) {
//           splitDataElement.asMap().forEach(
//             (int index, DayEarning element) {
//               // --Check for the first-----
//               if (index == 0) {
//                 barChartDataElementList.add(
//                   BarChartDataElement(
//                     startDate: element.date,
//                     endDate: element.date,
//                     noOfShift: element.noOfShift,
//                     earnings: element.earnings,
//                     totalHours: element.totalHours,
//                     noOfDay: 1,
//                   ),
//                 );
//               } else if (index == (splitDataElement.length - 1)) {
//                 // ---The Last Item-----------
//                 barChartDataElementList.last.endDate = element.date;
//                 barChartDataElementList.last.noOfShift += element.noOfShift;
//                 barChartDataElementList.last.earnings += element.earnings;
//                 barChartDataElementList.last.totalHours += element.totalHours;
//                 barChartDataElementList.last.noOfDay++;
//               } else {
//                 // ----if the element is inbetween---
//                 barChartDataElementList.last.noOfShift += element.noOfShift;
//                 barChartDataElementList.last.earnings += element.earnings;
//                 barChartDataElementList.last.totalHours += element.totalHours;
//                 barChartDataElementList.last.noOfDay++;
//               }
//             },
//           );
//         },
//       );
//     }

//     //--generating the list--------
//     if (barChartDataElementList.isNotEmpty) {
//       //--------Find highest earning value----------
//       barChartDataElementList.forEach((element) {
//         if (element.earnings > highestEarning) {
//           print('finding highest earning');
//           print('highest earning $highestEarning');
//           print('new value ${element.earnings}');
//           highestEarning = element.earnings;
//           print('New highest earning $highestEarning');
//           print('-----------');
//         }
//       });

//       barChartDataElementList.asMap().forEach(
//         (index, element) {
//           //---------------Generating ChartGroup Data------------

//           //Scaling the value
//           barChartGroupDataList.add(
//             makeGroupData(
//               index,
//               scaleYValue(
//                   earning: element.earnings, highestEarning: highestEarning),
//             ),
//           );

//           //-------------------Bottom LabelText------------
//           if (element.startDate.month == element.endDate.month) {
//             bottomTitles.add(
//               DateFormat('d').format(element.startDate) +
//                   '-' +
//                   DateFormat('d').format(element.endDate) +
//                   '/' +
//                   DateFormat('M').format(element.endDate),
//             );
//           }
//         },
//       );
//       notifyListeners();
//     } else {
//       _dayEarnings.forEach((element) {
//         if (element.earnings > highestEarning) {
//           print('finding highest earning');
//           print('highest earning $highestEarning');
//           print('new value ${element.earnings}');
//           highestEarning = element.earnings;
//           print('New highest earning $highestEarning');
//           print('-----------');
//         }
//       });

//       _dayEarnings.asMap().forEach(
//         (index, element) async {
//           //--------Find highest earning value----------

//           barChartGroupDataList.add(
//             makeGroupData(
//               index,
//               scaleYValue(
//                 earning: element.earnings,
//                 highestEarning: highestEarning,
//               ),
//             ),
//           );
//           //------Generate Bottom Titles--
//           bottomTitles.add(DateFormat('dd-MM').format(element.date));
//         },
//       );
//     }

//     generateLeftTitle(highestEarning);
//   }

  

  

//   reset() {
//     _startDate = DateTime.now().subtract(Duration(days: 6));
//     _endDate = DateTime.now();
//     // _totalEarning = 0;
//     // _totalNoOfDays = 0;
//     // _totalNoOfShift = 0;
//     // _averageWagePerDay = 0;
//     // _averageWagePerShift = 0;
//     // // _mostValuableShift = null;
//     // // _leastValuableShift = null;
//     // barChartGroupDataList = [];
//     // bottomTitles = [];

//     notifyListeners();
//   }
// }
