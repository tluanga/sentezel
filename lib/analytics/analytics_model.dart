import 'package:sentezel/analytics/barchart/models/barchart_model.dart';
import 'package:sentezel/analytics/chart_mode_enum.dart';

class Analytics {
  DateTime startDate;
  DateTime endDate;
  ChartMode chartMode;
  BarChartState? barChartState;
  Analytics({
    required this.startDate,
    required this.endDate,
    required this.chartMode,
    this.barChartState,
  });

  Analytics copyWith({
    DateTime? startDate,
    DateTime? endDate,
    ChartMode? chartMode,
    BarChartState? barChartState,
  }) {
    return Analytics(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      chartMode: chartMode ?? this.chartMode,
      barChartState: barChartState ?? this.barChartState,
    );
  }
}
