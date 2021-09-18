import 'package:sentezel/analytics/chart_mode_enum.dart';

class Analytics {
  DateTime startDate;
  DateTime endDate;
  ChartMode chartMode;
  Analytics({
    required this.startDate,
    required this.endDate,
    required this.chartMode,
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
    );
  }
}
