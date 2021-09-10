// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financialYear_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FinancialYear _$_$_FinancialYearFromJson(Map<String, dynamic> json) {
  return _$_FinancialYear(
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
  );
}

Map<String, dynamic> _$_$_FinancialYearToJson(_$_FinancialYear instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
