import 'package:sentezel/analytics/chart_mode_enum.dart';

class Analytics {
  DateTime startDate;
  DateTime endDate;
  ChartMode chartMode;
  List<double> salesPerDay;
  List<double> expensePerDay;
  Analytics({
    required this.startDate,
    required this.endDate,
    required this.chartMode,
    required this.salesPerDay,
    required this.expensePerDay,
  });

  Analytics copyWith({
    DateTime? startDate,
    DateTime? endDate,
    ChartMode? chartMode,
  }) {
    return Analytics(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      chartMode: chartMode ?? this.chartMode,
      salesPerDay: [],
      expensePerDay: [],
    );
  }
}
