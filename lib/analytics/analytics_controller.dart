import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/analytics/chart_mode_enum.dart';

final analyticsControllerProvider =
    StateNotifierProvider<AnalyticsController, Analytics>(
        (ref) => AnalyticsController(ref.read));

class AnalyticsController extends StateNotifier<Analytics> {
  final Reader _read;
  AnalyticsController(this._read)
      : super(
          Analytics(
            startDate: DateTime.now().subtract(
              const Duration(days: 7),
            ),
            endDate: DateTime.now(),
            chartMode: ChartMode.barChart,
          ),
        );

  changeChartMode(ChartMode chartMode) {
    state = state.copyWith(chartMode: chartMode);
  }
}
