// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'creditSettlement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreditSettlementTearOff {
  const _$CreditSettlementTearOff();

  _CrditSettlement call(
      {int amount = 0,
      int creditAmount = 0,
      int debitAmount = 0,
      Creditor? creditor,
      String? particular,
      required DateTime date,
      TransactionMode? mode = TransactionMode.paymentByCash,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) {
    return _CrditSettlement(
      amount: amount,
      creditAmount: creditAmount,
      debitAmount: debitAmount,
      creditor: creditor,
      particular: particular,
      date: date,
      mode: mode,
      category: category,
      creditSideLedger: creditSideLedger,
      debitSideLedger: debitSideLedger,
      partyLedger: partyLedger,
      errorMessages: errorMessages,
    );
  }
}

/// @nodoc
const $CreditSettlement = _$CreditSettlementTearOff();

/// @nodoc
mixin _$CreditSettlement {
  int get amount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  Creditor? get creditor => throw _privateConstructorUsedError;
  String? get particular => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionMode? get mode => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditSettlementCopyWith<CreditSettlement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditSettlementCopyWith<$Res> {
  factory $CreditSettlementCopyWith(
          CreditSettlement value, $Res Function(CreditSettlement) then) =
      _$CreditSettlementCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      Creditor? creditor,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  $CreditorCopyWith<$Res>? get creditor;
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$CreditSettlementCopyWithImpl<$Res>
    implements $CreditSettlementCopyWith<$Res> {
  _$CreditSettlementCopyWithImpl(this._value, this._then);

  final CreditSettlement _value;
  // ignore: unused_field
  final $Res Function(CreditSettlement) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? creditor = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? partyLedger = freezed,
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
      creditor: creditor == freezed
          ? _value.creditor
          : creditor // ignore: cast_nullable_to_non_nullable
              as Creditor?,
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
      partyLedger: partyLedger == freezed
          ? _value.partyLedger
          : partyLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $CreditorCopyWith<$Res>? get creditor {
    if (_value.creditor == null) {
      return null;
    }

    return $CreditorCopyWith<$Res>(_value.creditor!, (value) {
      return _then(_value.copyWith(creditor: value));
    });
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
abstract class _$CrditSettlementCopyWith<$Res>
    implements $CreditSettlementCopyWith<$Res> {
  factory _$CrditSettlementCopyWith(
          _CrditSettlement value, $Res Function(_CrditSettlement) then) =
      __$CrditSettlementCopyWithImpl<$Res>;
  @override
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      Creditor? creditor,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  @override
  $CreditorCopyWith<$Res>? get creditor;
  @override
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$CrditSettlementCopyWithImpl<$Res>
    extends _$CreditSettlementCopyWithImpl<$Res>
    implements _$CrditSettlementCopyWith<$Res> {
  __$CrditSettlementCopyWithImpl(
      _CrditSettlement _value, $Res Function(_CrditSettlement) _then)
      : super(_value, (v) => _then(v as _CrditSettlement));

  @override
  _CrditSettlement get _value => super._value as _CrditSettlement;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? creditor = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? partyLedger = freezed,
    Object? errorMessages = freezed,
  }) {
    return _then(_CrditSettlement(
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
      creditor: creditor == freezed
          ? _value.creditor
          : creditor // ignore: cast_nullable_to_non_nullable
              as Creditor?,
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
      partyLedger: partyLedger == freezed
          ? _value.partyLedger
          : partyLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CrditSettlement implements _CrditSettlement {
  _$_CrditSettlement(
      {this.amount = 0,
      this.creditAmount = 0,
      this.debitAmount = 0,
      this.creditor,
      this.particular,
      required this.date,
      this.mode = TransactionMode.paymentByCash,
      this.category,
      this.creditSideLedger,
      this.debitSideLedger,
      this.partyLedger,
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
  final Creditor? creditor;
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
  @override
  final LedgerMaster? partyLedger;
  @override
  final List<String> errorMessages;

  @override
  String toString() {
    return 'CreditSettlement(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, creditor: $creditor, particular: $particular, date: $date, mode: $mode, category: $category, creditSideLedger: $creditSideLedger, debitSideLedger: $debitSideLedger, partyLedger: $partyLedger, errorMessages: $errorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CrditSettlement &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.creditAmount, creditAmount) ||
                const DeepCollectionEquality()
                    .equals(other.creditAmount, creditAmount)) &&
            (identical(other.debitAmount, debitAmount) ||
                const DeepCollectionEquality()
                    .equals(other.debitAmount, debitAmount)) &&
            (identical(other.creditor, creditor) ||
                const DeepCollectionEquality()
                    .equals(other.creditor, creditor)) &&
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
            (identical(other.partyLedger, partyLedger) ||
                const DeepCollectionEquality()
                    .equals(other.partyLedger, partyLedger)) &&
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
      const DeepCollectionEquality().hash(creditor) ^
      const DeepCollectionEquality().hash(particular) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(creditSideLedger) ^
      const DeepCollectionEquality().hash(debitSideLedger) ^
      const DeepCollectionEquality().hash(partyLedger) ^
      const DeepCollectionEquality().hash(errorMessages);

  @JsonKey(ignore: true)
  @override
  _$CrditSettlementCopyWith<_CrditSettlement> get copyWith =>
      __$CrditSettlementCopyWithImpl<_CrditSettlement>(this, _$identity);
}

abstract class _CrditSettlement implements CreditSettlement {
  factory _CrditSettlement(
      {int amount,
      int creditAmount,
      int debitAmount,
      Creditor? creditor,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) = _$_CrditSettlement;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  int get creditAmount => throw _privateConstructorUsedError;
  @override
  int get debitAmount => throw _privateConstructorUsedError;
  @override
  Creditor? get creditor => throw _privateConstructorUsedError;
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
  @override
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  @override
  List<String> get errorMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CrditSettlementCopyWith<_CrditSettlement> get copyWith =>
      throw _privateConstructorUsedError;
}
