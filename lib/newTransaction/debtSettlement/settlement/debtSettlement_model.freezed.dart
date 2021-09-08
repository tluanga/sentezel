// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'debtSettlement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DebtSettlementTearOff {
  const _$DebtSettlementTearOff();

  _DebtSettlement call(
      {int amount = 0,
      int creditAmount = 0,
      int debitAmount = 0,
      Debtor? debtor,
      String? particular,
      required DateTime date,
      TransactionMode? mode = TransactionMode.paymentByCash,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) {
    return _DebtSettlement(
      amount: amount,
      creditAmount: creditAmount,
      debitAmount: debitAmount,
      debtor: debtor,
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
const $DebtSettlement = _$DebtSettlementTearOff();

/// @nodoc
mixin _$DebtSettlement {
  int get amount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  Debtor? get debtor => throw _privateConstructorUsedError;
  String? get particular => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionMode? get mode => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DebtSettlementCopyWith<DebtSettlement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtSettlementCopyWith<$Res> {
  factory $DebtSettlementCopyWith(
          DebtSettlement value, $Res Function(DebtSettlement) then) =
      _$DebtSettlementCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      Debtor? debtor,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  $DebtorCopyWith<$Res>? get debtor;
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$DebtSettlementCopyWithImpl<$Res>
    implements $DebtSettlementCopyWith<$Res> {
  _$DebtSettlementCopyWithImpl(this._value, this._then);

  final DebtSettlement _value;
  // ignore: unused_field
  final $Res Function(DebtSettlement) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? debtor = freezed,
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
      debtor: debtor == freezed
          ? _value.debtor
          : debtor // ignore: cast_nullable_to_non_nullable
              as Debtor?,
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
  $DebtorCopyWith<$Res>? get debtor {
    if (_value.debtor == null) {
      return null;
    }

    return $DebtorCopyWith<$Res>(_value.debtor!, (value) {
      return _then(_value.copyWith(debtor: value));
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
abstract class _$DebtSettlementCopyWith<$Res>
    implements $DebtSettlementCopyWith<$Res> {
  factory _$DebtSettlementCopyWith(
          _DebtSettlement value, $Res Function(_DebtSettlement) then) =
      __$DebtSettlementCopyWithImpl<$Res>;
  @override
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      Debtor? debtor,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  @override
  $DebtorCopyWith<$Res>? get debtor;
  @override
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$DebtSettlementCopyWithImpl<$Res>
    extends _$DebtSettlementCopyWithImpl<$Res>
    implements _$DebtSettlementCopyWith<$Res> {
  __$DebtSettlementCopyWithImpl(
      _DebtSettlement _value, $Res Function(_DebtSettlement) _then)
      : super(_value, (v) => _then(v as _DebtSettlement));

  @override
  _DebtSettlement get _value => super._value as _DebtSettlement;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? debtor = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? partyLedger = freezed,
    Object? errorMessages = freezed,
  }) {
    return _then(_DebtSettlement(
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
      debtor: debtor == freezed
          ? _value.debtor
          : debtor // ignore: cast_nullable_to_non_nullable
              as Debtor?,
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

class _$_DebtSettlement implements _DebtSettlement {
  _$_DebtSettlement(
      {this.amount = 0,
      this.creditAmount = 0,
      this.debitAmount = 0,
      this.debtor,
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
  final Debtor? debtor;
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
    return 'DebtSettlement(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, debtor: $debtor, particular: $particular, date: $date, mode: $mode, category: $category, creditSideLedger: $creditSideLedger, debitSideLedger: $debitSideLedger, partyLedger: $partyLedger, errorMessages: $errorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DebtSettlement &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.creditAmount, creditAmount) ||
                const DeepCollectionEquality()
                    .equals(other.creditAmount, creditAmount)) &&
            (identical(other.debitAmount, debitAmount) ||
                const DeepCollectionEquality()
                    .equals(other.debitAmount, debitAmount)) &&
            (identical(other.debtor, debtor) ||
                const DeepCollectionEquality().equals(other.debtor, debtor)) &&
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
      const DeepCollectionEquality().hash(debtor) ^
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
  _$DebtSettlementCopyWith<_DebtSettlement> get copyWith =>
      __$DebtSettlementCopyWithImpl<_DebtSettlement>(this, _$identity);
}

abstract class _DebtSettlement implements DebtSettlement {
  factory _DebtSettlement(
      {int amount,
      int creditAmount,
      int debitAmount,
      Debtor? debtor,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) = _$_DebtSettlement;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  int get creditAmount => throw _privateConstructorUsedError;
  @override
  int get debitAmount => throw _privateConstructorUsedError;
  @override
  Debtor? get debtor => throw _privateConstructorUsedError;
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
  _$DebtSettlementCopyWith<_DebtSettlement> get copyWith =>
      throw _privateConstructorUsedError;
}
