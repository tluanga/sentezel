// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'capital_injection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CapitalInjectionTearOff {
  const _$CapitalInjectionTearOff();

  _CapitalInjection call(
      {int amount = 0,
      int creditAmount = 0,
      int debitAmount = 0,
      String? particular,
      required DateTime date,
      TransactionMode? mode = TransactionMode.paymentByCash,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      required List<String> errorMessages}) {
    return _CapitalInjection(
      amount: amount,
      creditAmount: creditAmount,
      debitAmount: debitAmount,
      particular: particular,
      date: date,
      mode: mode,
      category: category,
      creditSideLedger: creditSideLedger,
      debitSideLedger: debitSideLedger,
      errorMessages: errorMessages,
    );
  }
}

/// @nodoc
const $CapitalInjection = _$CapitalInjectionTearOff();

/// @nodoc
mixin _$CapitalInjection {
  int get amount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  String? get particular => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionMode? get mode => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get debitSideLedger =>
      throw _privateConstructorUsedError; //The only debit side leddger
  List<String> get errorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CapitalInjectionCopyWith<CapitalInjection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapitalInjectionCopyWith<$Res> {
  factory $CapitalInjectionCopyWith(
          CapitalInjection value, $Res Function(CapitalInjection) then) =
      _$CapitalInjectionCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      List<String> errorMessages});

  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$CapitalInjectionCopyWithImpl<$Res>
    implements $CapitalInjectionCopyWith<$Res> {
  _$CapitalInjectionCopyWithImpl(this._value, this._then);

  final CapitalInjection _value;
  // ignore: unused_field
  final $Res Function(CapitalInjection) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? errorMessages = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      creditAmount: creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as int,
      debitAmount: debitAmount == freezed
          ? _value.debitAmount
          : debitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      particular: particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TransactionMode?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $TransactionCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TransactionCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$CapitalInjectionCopyWith<$Res>
    implements $CapitalInjectionCopyWith<$Res> {
  factory _$CapitalInjectionCopyWith(
          _CapitalInjection value, $Res Function(_CapitalInjection) then) =
      __$CapitalInjectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      List<String> errorMessages});

  @override
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$CapitalInjectionCopyWithImpl<$Res>
    extends _$CapitalInjectionCopyWithImpl<$Res>
    implements _$CapitalInjectionCopyWith<$Res> {
  __$CapitalInjectionCopyWithImpl(
      _CapitalInjection _value, $Res Function(_CapitalInjection) _then)
      : super(_value, (v) => _then(v as _CapitalInjection));

  @override
  _CapitalInjection get _value => super._value as _CapitalInjection;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? errorMessages = freezed,
  }) {
    return _then(_CapitalInjection(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      creditAmount: creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as int,
      debitAmount: debitAmount == freezed
          ? _value.debitAmount
          : debitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      particular: particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TransactionMode?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CapitalInjection implements _CapitalInjection {
  _$_CapitalInjection(
      {this.amount = 0,
      this.creditAmount = 0,
      this.debitAmount = 0,
      this.particular,
      required this.date,
      this.mode = TransactionMode.paymentByCash,
      this.category,
      this.creditSideLedger,
      this.debitSideLedger,
      required this.errorMessages});

  @JsonKey(defaultValue: 0)
  @override
  final int amount;
  @JsonKey(defaultValue: 0)
  @override
  final int creditAmount;
  @JsonKey(defaultValue: 0)
  @override
  final int debitAmount;
  @override
  final String? particular;
  @override
  final DateTime date;
  @JsonKey(defaultValue: TransactionMode.paymentByCash)
  @override
  final TransactionMode? mode;
  @override
  final TransactionCategory? category;
  @override
  final LedgerMaster? creditSideLedger;
  @override
  final LedgerMaster? debitSideLedger;
  @override //The only debit side leddger
  final List<String> errorMessages;

  @override
  String toString() {
    return 'CapitalInjection(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, particular: $particular, date: $date, mode: $mode, category: $category, creditSideLedger: $creditSideLedger, debitSideLedger: $debitSideLedger, errorMessages: $errorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CapitalInjection &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.creditAmount, creditAmount) ||
                const DeepCollectionEquality()
                    .equals(other.creditAmount, creditAmount)) &&
            (identical(other.debitAmount, debitAmount) ||
                const DeepCollectionEquality()
                    .equals(other.debitAmount, debitAmount)) &&
            (identical(other.particular, particular) ||
                const DeepCollectionEquality()
                    .equals(other.particular, particular)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.creditSideLedger, creditSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.creditSideLedger, creditSideLedger)) &&
            (identical(other.debitSideLedger, debitSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.debitSideLedger, debitSideLedger)) &&
            (identical(other.errorMessages, errorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessages, errorMessages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(creditAmount) ^
      const DeepCollectionEquality().hash(debitAmount) ^
      const DeepCollectionEquality().hash(particular) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(creditSideLedger) ^
      const DeepCollectionEquality().hash(debitSideLedger) ^
      const DeepCollectionEquality().hash(errorMessages);

  @JsonKey(ignore: true)
  @override
  _$CapitalInjectionCopyWith<_CapitalInjection> get copyWith =>
      __$CapitalInjectionCopyWithImpl<_CapitalInjection>(this, _$identity);
}

abstract class _CapitalInjection implements CapitalInjection {
  factory _CapitalInjection(
      {int amount,
      int creditAmount,
      int debitAmount,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      required List<String> errorMessages}) = _$_CapitalInjection;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  int get creditAmount => throw _privateConstructorUsedError;
  @override
  int get debitAmount => throw _privateConstructorUsedError;
  @override
  String? get particular => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  TransactionMode? get mode => throw _privateConstructorUsedError;
  @override
  TransactionCategory? get category => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  @override //The only debit side leddger
  List<String> get errorMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CapitalInjectionCopyWith<_CapitalInjection> get copyWith =>
      throw _privateConstructorUsedError;
}
