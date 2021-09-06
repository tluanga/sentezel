// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'journal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JournalTearOff {
  const _$JournalTearOff();

  _Journal call(
      {required String particular,
      required int amount,
      required DateTime date,
      required String transactionCategory,
      String? creditSideLedgerName,
      String? debitSideLedgerName,
      String? partyLedgerName,
      String? assetLedgerName,
      required String mode}) {
    return _Journal(
      particular: particular,
      amount: amount,
      date: date,
      transactionCategory: transactionCategory,
      creditSideLedgerName: creditSideLedgerName,
      debitSideLedgerName: debitSideLedgerName,
      partyLedgerName: partyLedgerName,
      assetLedgerName: assetLedgerName,
      mode: mode,
    );
  }
}

/// @nodoc
const $Journal = _$JournalTearOff();

/// @nodoc
mixin _$Journal {
  String get particular => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get transactionCategory => throw _privateConstructorUsedError;
  String? get creditSideLedgerName => throw _privateConstructorUsedError;
  String? get debitSideLedgerName => throw _privateConstructorUsedError;
  String? get partyLedgerName => throw _privateConstructorUsedError;
  String? get assetLedgerName => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res>;
  $Res call(
      {String particular,
      int amount,
      DateTime date,
      String transactionCategory,
      String? creditSideLedgerName,
      String? debitSideLedgerName,
      String? partyLedgerName,
      String? assetLedgerName,
      String mode});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res> implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  final Journal _value;
  // ignore: unused_field
  final $Res Function(Journal) _then;

  @override
  $Res call({
    Object? particular = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? transactionCategory = freezed,
    Object? creditSideLedgerName = freezed,
    Object? debitSideLedgerName = freezed,
    Object? partyLedgerName = freezed,
    Object? assetLedgerName = freezed,
    Object? mode = freezed,
  }) {
    return _then(_value.copyWith(
      particular: particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionCategory: transactionCategory == freezed
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      creditSideLedgerName: creditSideLedgerName == freezed
          ? _value.creditSideLedgerName
          : creditSideLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      debitSideLedgerName: debitSideLedgerName == freezed
          ? _value.debitSideLedgerName
          : debitSideLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      partyLedgerName: partyLedgerName == freezed
          ? _value.partyLedgerName
          : partyLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLedgerName: assetLedgerName == freezed
          ? _value.assetLedgerName
          : assetLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$JournalCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$JournalCopyWith(_Journal value, $Res Function(_Journal) then) =
      __$JournalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String particular,
      int amount,
      DateTime date,
      String transactionCategory,
      String? creditSideLedgerName,
      String? debitSideLedgerName,
      String? partyLedgerName,
      String? assetLedgerName,
      String mode});
}

/// @nodoc
class __$JournalCopyWithImpl<$Res> extends _$JournalCopyWithImpl<$Res>
    implements _$JournalCopyWith<$Res> {
  __$JournalCopyWithImpl(_Journal _value, $Res Function(_Journal) _then)
      : super(_value, (v) => _then(v as _Journal));

  @override
  _Journal get _value => super._value as _Journal;

  @override
  $Res call({
    Object? particular = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? transactionCategory = freezed,
    Object? creditSideLedgerName = freezed,
    Object? debitSideLedgerName = freezed,
    Object? partyLedgerName = freezed,
    Object? assetLedgerName = freezed,
    Object? mode = freezed,
  }) {
    return _then(_Journal(
      particular: particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionCategory: transactionCategory == freezed
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      creditSideLedgerName: creditSideLedgerName == freezed
          ? _value.creditSideLedgerName
          : creditSideLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      debitSideLedgerName: debitSideLedgerName == freezed
          ? _value.debitSideLedgerName
          : debitSideLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      partyLedgerName: partyLedgerName == freezed
          ? _value.partyLedgerName
          : partyLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLedgerName: assetLedgerName == freezed
          ? _value.assetLedgerName
          : assetLedgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Journal implements _Journal {
  _$_Journal(
      {required this.particular,
      required this.amount,
      required this.date,
      required this.transactionCategory,
      this.creditSideLedgerName,
      this.debitSideLedgerName,
      this.partyLedgerName,
      this.assetLedgerName,
      required this.mode});

  @override
  final String particular;
  @override
  final int amount;
  @override
  final DateTime date;
  @override
  final String transactionCategory;
  @override
  final String? creditSideLedgerName;
  @override
  final String? debitSideLedgerName;
  @override
  final String? partyLedgerName;
  @override
  final String? assetLedgerName;
  @override
  final String mode;

  @override
  String toString() {
    return 'Journal(particular: $particular, amount: $amount, date: $date, transactionCategory: $transactionCategory, creditSideLedgerName: $creditSideLedgerName, debitSideLedgerName: $debitSideLedgerName, partyLedgerName: $partyLedgerName, assetLedgerName: $assetLedgerName, mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Journal &&
            (identical(other.particular, particular) ||
                const DeepCollectionEquality()
                    .equals(other.particular, particular)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.transactionCategory, transactionCategory) ||
                const DeepCollectionEquality()
                    .equals(other.transactionCategory, transactionCategory)) &&
            (identical(other.creditSideLedgerName, creditSideLedgerName) ||
                const DeepCollectionEquality().equals(
                    other.creditSideLedgerName, creditSideLedgerName)) &&
            (identical(other.debitSideLedgerName, debitSideLedgerName) ||
                const DeepCollectionEquality()
                    .equals(other.debitSideLedgerName, debitSideLedgerName)) &&
            (identical(other.partyLedgerName, partyLedgerName) ||
                const DeepCollectionEquality()
                    .equals(other.partyLedgerName, partyLedgerName)) &&
            (identical(other.assetLedgerName, assetLedgerName) ||
                const DeepCollectionEquality()
                    .equals(other.assetLedgerName, assetLedgerName)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(particular) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(transactionCategory) ^
      const DeepCollectionEquality().hash(creditSideLedgerName) ^
      const DeepCollectionEquality().hash(debitSideLedgerName) ^
      const DeepCollectionEquality().hash(partyLedgerName) ^
      const DeepCollectionEquality().hash(assetLedgerName) ^
      const DeepCollectionEquality().hash(mode);

  @JsonKey(ignore: true)
  @override
  _$JournalCopyWith<_Journal> get copyWith =>
      __$JournalCopyWithImpl<_Journal>(this, _$identity);
}

abstract class _Journal implements Journal {
  factory _Journal(
      {required String particular,
      required int amount,
      required DateTime date,
      required String transactionCategory,
      String? creditSideLedgerName,
      String? debitSideLedgerName,
      String? partyLedgerName,
      String? assetLedgerName,
      required String mode}) = _$_Journal;

  @override
  String get particular => throw _privateConstructorUsedError;
  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  String get transactionCategory => throw _privateConstructorUsedError;
  @override
  String? get creditSideLedgerName => throw _privateConstructorUsedError;
  @override
  String? get debitSideLedgerName => throw _privateConstructorUsedError;
  @override
  String? get partyLedgerName => throw _privateConstructorUsedError;
  @override
  String? get assetLedgerName => throw _privateConstructorUsedError;
  @override
  String get mode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JournalCopyWith<_Journal> get copyWith =>
      throw _privateConstructorUsedError;
}
