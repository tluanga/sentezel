import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/analytics/enum.dart';

part 'analytics_model.freezed.dart';

@freezed
class Analytics with _$Analytics {
  factory Analytics({
    @Default(TimePeriod.daily) TimePeriod timePeriod,
    required List<double> salesPerDay,
    required List<double> expensePerDay,
    required List<double> salesPerMonth,
    required List<double> expensePerMonth,
  }) = _Analytics;
}
