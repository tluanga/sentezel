import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/analytics/enum.dart';

class Analytics {
  DateTime startDate;
  DateTime endDate;
  ChartMode chartMode;
  @Default(TimePeriod.daily)
  TimePeriod timePeriod;
  List<double> salesPerDay;
  List<double> expensePerDay;
  List<double> salesPerMonth;
  List<double> expensePerMonth;
  Analytics({
    required this.startDate,
    required this.endDate,
    required this.chartMode,
    required this.timePeriod,
    required this.salesPerDay,
    required this.expensePerDay,
    required this.salesPerMonth,
    required this.expensePerMonth,
  });

  Analytics copyWith({
    DateTime? startDate,
    DateTime? endDate,
    ChartMode? chartMode,
    TimePeriod? timePeriod,
  }) {
    return Analytics(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      chartMode: chartMode ?? this.chartMode,
      salesPerDay: [],
      expensePerDay: [],
      expensePerMonth: [],
      salesPerMonth: [],
      timePeriod: timePeriod ?? this.timePeriod,
    );
  }
}
