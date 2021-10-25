// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'financial_year_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FinancialYear _$FinancialYearFromJson(Map<String, dynamic> json) {
  return _FinancialYear.fromJson(json);
}

/// @nodoc
class _$FinancialYearTearOff {
  const _$FinancialYearTearOff();

  _FinancialYear call(
      {required DateTime startDate, required DateTime endDate}) {
    return _FinancialYear(
      startDate: startDate,
      endDate: endDate,
    );
  }

  FinancialYear fromJson(Map<String, Object> json) {
    return FinancialYear.fromJson(json);
  }
}

/// @nodoc
const $FinancialYear = _$FinancialYearTearOff();

/// @nodoc
mixin _$FinancialYear {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialYearCopyWith<FinancialYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialYearCopyWith<$Res> {
  factory $FinancialYearCopyWith(
          FinancialYear value, $Res Function(FinancialYear) then) =
      _$FinancialYearCopyWithImpl<$Res>;
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$FinancialYearCopyWithImpl<$Res>
    implements $FinancialYearCopyWith<$Res> {
  _$FinancialYearCopyWithImpl(this._value, this._then);

  final FinancialYear _value;
  // ignore: unused_field
  final $Res Function(FinancialYear) _then;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FinancialYearCopyWith<$Res>
    implements $FinancialYearCopyWith<$Res> {
  factory _$FinancialYearCopyWith(
          _FinancialYear value, $Res Function(_FinancialYear) then) =
      __$FinancialYearCopyWithImpl<$Res>;
  @override
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$FinancialYearCopyWithImpl<$Res>
    extends _$FinancialYearCopyWithImpl<$Res>
    implements _$FinancialYearCopyWith<$Res> {
  __$FinancialYearCopyWithImpl(
      _FinancialYear _value, $Res Function(_FinancialYear) _then)
      : super(_value, (v) => _then(v as _FinancialYear));

  @override
  _FinancialYear get _value => super._value as _FinancialYear;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_FinancialYear(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FinancialYear implements _FinancialYear {
  _$_FinancialYear({required this.startDate, required this.endDate});

  factory _$_FinancialYear.fromJson(Map<String, dynamic> json) =>
      _$_$_FinancialYearFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'FinancialYear(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FinancialYear &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate);

  @JsonKey(ignore: true)
  @override
  _$FinancialYearCopyWith<_FinancialYear> get copyWith =>
      __$FinancialYearCopyWithImpl<_FinancialYear>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FinancialYearToJson(this);
  }
}

abstract class _FinancialYear implements FinancialYear {
  factory _FinancialYear(
      {required DateTime startDate,
      required DateTime endDate}) = _$_FinancialYear;

  factory _FinancialYear.fromJson(Map<String, dynamic> json) =
      _$_FinancialYear.fromJson;

  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FinancialYearCopyWith<_FinancialYear> get copyWith =>
      throw _privateConstructorUsedError;
}
