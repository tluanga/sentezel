// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalyticsTearOff {
  const _$AnalyticsTearOff();

  _Analytics call(
      {TimePeriod timePeriod = TimePeriod.daily,
      required List<double> salesPerDay,
      required List<double> expensePerDay,
      required List<double> salesPerMonth,
      required List<double> expensePerMonth,
      required int totalAccountingYearSales,
      required int totalAccountingYearExpense}) {
    return _Analytics(
      timePeriod: timePeriod,
      salesPerDay: salesPerDay,
      expensePerDay: expensePerDay,
      salesPerMonth: salesPerMonth,
      expensePerMonth: expensePerMonth,
      totalAccountingYearSales: totalAccountingYearSales,
      totalAccountingYearExpense: totalAccountingYearExpense,
    );
  }
}

/// @nodoc
const $Analytics = _$AnalyticsTearOff();

/// @nodoc
mixin _$Analytics {
  TimePeriod get timePeriod => throw _privateConstructorUsedError;
  List<double> get salesPerDay => throw _privateConstructorUsedError;
  List<double> get expensePerDay => throw _privateConstructorUsedError;
  List<double> get salesPerMonth => throw _privateConstructorUsedError;
  List<double> get expensePerMonth => throw _privateConstructorUsedError;
  int get totalAccountingYearSales => throw _privateConstructorUsedError;
  int get totalAccountingYearExpense => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyticsCopyWith<Analytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsCopyWith<$Res> {
  factory $AnalyticsCopyWith(Analytics value, $Res Function(Analytics) then) =
      _$AnalyticsCopyWithImpl<$Res>;
  $Res call(
      {TimePeriod timePeriod,
      List<double> salesPerDay,
      List<double> expensePerDay,
      List<double> salesPerMonth,
      List<double> expensePerMonth,
      int totalAccountingYearSales,
      int totalAccountingYearExpense});
}

/// @nodoc
class _$AnalyticsCopyWithImpl<$Res> implements $AnalyticsCopyWith<$Res> {
  _$AnalyticsCopyWithImpl(this._value, this._then);

  final Analytics _value;
  // ignore: unused_field
  final $Res Function(Analytics) _then;

  @override
  $Res call({
    Object? timePeriod = freezed,
    Object? salesPerDay = freezed,
    Object? expensePerDay = freezed,
    Object? salesPerMonth = freezed,
    Object? expensePerMonth = freezed,
    Object? totalAccountingYearSales = freezed,
    Object? totalAccountingYearExpense = freezed,
  }) {
    return _then(_value.copyWith(
      timePeriod: timePeriod == freezed
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as TimePeriod,
      salesPerDay: salesPerDay == freezed
          ? _value.salesPerDay
          : salesPerDay // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expensePerDay: expensePerDay == freezed
          ? _value.expensePerDay
          : expensePerDay // ignore: cast_nullable_to_non_nullable
              as List<double>,
      salesPerMonth: salesPerMonth == freezed
          ? _value.salesPerMonth
          : salesPerMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expensePerMonth: expensePerMonth == freezed
          ? _value.expensePerMonth
          : expensePerMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
      totalAccountingYearSales: totalAccountingYearSales == freezed
          ? _value.totalAccountingYearSales
          : totalAccountingYearSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalAccountingYearExpense: totalAccountingYearExpense == freezed
          ? _value.totalAccountingYearExpense
          : totalAccountingYearExpense // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AnalyticsCopyWith<$Res> implements $AnalyticsCopyWith<$Res> {
  factory _$AnalyticsCopyWith(
          _Analytics value, $Res Function(_Analytics) then) =
      __$AnalyticsCopyWithImpl<$Res>;
  @override
  $Res call(
      {TimePeriod timePeriod,
      List<double> salesPerDay,
      List<double> expensePerDay,
      List<double> salesPerMonth,
      List<double> expensePerMonth,
      int totalAccountingYearSales,
      int totalAccountingYearExpense});
}

/// @nodoc
class __$AnalyticsCopyWithImpl<$Res> extends _$AnalyticsCopyWithImpl<$Res>
    implements _$AnalyticsCopyWith<$Res> {
  __$AnalyticsCopyWithImpl(_Analytics _value, $Res Function(_Analytics) _then)
      : super(_value, (v) => _then(v as _Analytics));

  @override
  _Analytics get _value => super._value as _Analytics;

  @override
  $Res call({
    Object? timePeriod = freezed,
    Object? salesPerDay = freezed,
    Object? expensePerDay = freezed,
    Object? salesPerMonth = freezed,
    Object? expensePerMonth = freezed,
    Object? totalAccountingYearSales = freezed,
    Object? totalAccountingYearExpense = freezed,
  }) {
    return _then(_Analytics(
      timePeriod: timePeriod == freezed
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as TimePeriod,
      salesPerDay: salesPerDay == freezed
          ? _value.salesPerDay
          : salesPerDay // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expensePerDay: expensePerDay == freezed
          ? _value.expensePerDay
          : expensePerDay // ignore: cast_nullable_to_non_nullable
              as List<double>,
      salesPerMonth: salesPerMonth == freezed
          ? _value.salesPerMonth
          : salesPerMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expensePerMonth: expensePerMonth == freezed
          ? _value.expensePerMonth
          : expensePerMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
      totalAccountingYearSales: totalAccountingYearSales == freezed
          ? _value.totalAccountingYearSales
          : totalAccountingYearSales // ignore: cast_nullable_to_non_nullable
              as int,
      totalAccountingYearExpense: totalAccountingYearExpense == freezed
          ? _value.totalAccountingYearExpense
          : totalAccountingYearExpense // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Analytics implements _Analytics {
  _$_Analytics(
      {this.timePeriod = TimePeriod.daily,
      required this.salesPerDay,
      required this.expensePerDay,
      required this.salesPerMonth,
      required this.expensePerMonth,
      required this.totalAccountingYearSales,
      required this.totalAccountingYearExpense});

  @JsonKey(defaultValue: TimePeriod.daily)
  @override
  final TimePeriod timePeriod;
  @override
  final List<double> salesPerDay;
  @override
  final List<double> expensePerDay;
  @override
  final List<double> salesPerMonth;
  @override
  final List<double> expensePerMonth;
  @override
  final int totalAccountingYearSales;
  @override
  final int totalAccountingYearExpense;

  @override
  String toString() {
    return 'Analytics(timePeriod: $timePeriod, salesPerDay: $salesPerDay, expensePerDay: $expensePerDay, salesPerMonth: $salesPerMonth, expensePerMonth: $expensePerMonth, totalAccountingYearSales: $totalAccountingYearSales, totalAccountingYearExpense: $totalAccountingYearExpense)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Analytics &&
            (identical(other.timePeriod, timePeriod) ||
                const DeepCollectionEquality()
                    .equals(other.timePeriod, timePeriod)) &&
            (identical(other.salesPerDay, salesPerDay) ||
                const DeepCollectionEquality()
                    .equals(other.salesPerDay, salesPerDay)) &&
            (identical(other.expensePerDay, expensePerDay) ||
                const DeepCollectionEquality()
                    .equals(other.expensePerDay, expensePerDay)) &&
            (identical(other.salesPerMonth, salesPerMonth) ||
                const DeepCollectionEquality()
                    .equals(other.salesPerMonth, salesPerMonth)) &&
            (identical(other.expensePerMonth, expensePerMonth) ||
                const DeepCollectionEquality()
                    .equals(other.expensePerMonth, expensePerMonth)) &&
            (identical(
                    other.totalAccountingYearSales, totalAccountingYearSales) ||
                const DeepCollectionEquality().equals(
                    other.totalAccountingYearSales,
                    totalAccountingYearSales)) &&
            (identical(other.totalAccountingYearExpense,
                    totalAccountingYearExpense) ||
                const DeepCollectionEquality().equals(
                    other.totalAccountingYearExpense,
                    totalAccountingYearExpense)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timePeriod) ^
      const DeepCollectionEquality().hash(salesPerDay) ^
      const DeepCollectionEquality().hash(expensePerDay) ^
      const DeepCollectionEquality().hash(salesPerMonth) ^
      const DeepCollectionEquality().hash(expensePerMonth) ^
      const DeepCollectionEquality().hash(totalAccountingYearSales) ^
      const DeepCollectionEquality().hash(totalAccountingYearExpense);

  @JsonKey(ignore: true)
  @override
  _$AnalyticsCopyWith<_Analytics> get copyWith =>
      __$AnalyticsCopyWithImpl<_Analytics>(this, _$identity);
}

abstract class _Analytics implements Analytics {
  factory _Analytics(
      {TimePeriod timePeriod,
      required List<double> salesPerDay,
      required List<double> expensePerDay,
      required List<double> salesPerMonth,
      required List<double> expensePerMonth,
      required int totalAccountingYearSales,
      required int totalAccountingYearExpense}) = _$_Analytics;

  @override
  TimePeriod get timePeriod => throw _privateConstructorUsedError;
  @override
  List<double> get salesPerDay => throw _privateConstructorUsedError;
  @override
  List<double> get expensePerDay => throw _privateConstructorUsedError;
  @override
  List<double> get salesPerMonth => throw _privateConstructorUsedError;
  @override
  List<double> get expensePerMonth => throw _privateConstructorUsedError;
  @override
  int get totalAccountingYearSales => throw _privateConstructorUsedError;
  @override
  int get totalAccountingYearExpense => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnalyticsCopyWith<_Analytics> get copyWith =>
      throw _privateConstructorUsedError;
}
