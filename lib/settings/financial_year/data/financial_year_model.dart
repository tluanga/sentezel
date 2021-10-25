import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_year_model.freezed.dart';
part 'financial_year_model.g.dart';

@freezed
class FinancialYear with _$FinancialYear {
  factory FinancialYear(
      {required DateTime startDate,
      required DateTime endDate}) = _FinancialYear;

  factory FinancialYear.fromJson(Map<String, dynamic> json) =>
      _$FinancialYearFromJson(json);
}
