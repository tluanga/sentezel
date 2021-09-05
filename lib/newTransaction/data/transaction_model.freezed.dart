// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Transaction call(
      int? id,
      int amount,
      int debitAmount,
      int creditAmount,
      String particular,
      TransactionMode mode,
      DateTime date,
      int transactionCategoryId,
      int? partyLedgerId,
      int? assetLedgerId,
      int? debitSideLedger,
      int? creditSideLedger) {
    return _Transaction(
      id,
      amount,
      debitAmount,
      creditAmount,
      particular,
      mode,
      date,
      transactionCategoryId,
      partyLedgerId,
      assetLedgerId,
      debitSideLedger,
      creditSideLedger,
    );
  }

  Transaction fromJson(Map<String, Object> json) {
    return Transaction.fromJson(json);
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  int? get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  String get particular => throw _privateConstructorUsedError;
  TransactionMode get mode =>
      throw _privateConstructorUsedError; //user input--can be credit or Cashdown
  DateTime get date => throw _privateConstructorUsedError; //user input
  int get transactionCategoryId => throw _privateConstructorUsedError;
  int? get partyLedgerId => throw _privateConstructorUsedError;
  int? get assetLedgerId => throw _privateConstructorUsedError;
  int? get debitSideLedger => throw _privateConstructorUsedError;
  int? get creditSideLedger => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int amount,
      int debitAmount,
      int creditAmount,
      String particular,
      TransactionMode mode,
      DateTime date,
      int transactionCategoryId,
      int? partyLedgerId,
      int? assetLedgerId,
      int? debitSideLedger,
      int? creditSideLedger});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? debitAmount = freezed,
    Object? creditAmount = freezed,
    Object? particular = freezed,
    Object? mode = freezed,
    Object? date = freezed,
    Object? transactionCategoryId = freezed,
    Object? partyLedgerId = freezed,
    Object? assetLedgerId = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      debitAmount: debitAmount == freezed
          ? _value.debitAmount
          : debitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      creditAmount: creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as int,
      particular: particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TransactionMode,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionCategoryId: transactionCategoryId == freezed
          ? _value.transactionCategoryId
          : transactionCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      partyLedgerId: partyLedgerId == freezed
          ? _value.partyLedgerId
          : partyLedgerId // ignore: cast_nullable_to_non_nullable
              as int?,
      assetLedgerId: assetLedgerId == freezed
          ? _value.assetLedgerId
          : assetLedgerId // ignore: cast_nullable_to_non_nullable
              as int?,
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) then) =
      __$TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int amount,
      int debitAmount,
      int creditAmount,
      String particular,
      TransactionMode mode,
      DateTime date,
      int transactionCategoryId,
      int? partyLedgerId,
      int? assetLedgerId,
      int? debitSideLedger,
      int? creditSideLedger});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(
      _Transaction _value, $Res Function(_Transaction) _then)
      : super(_value, (v) => _then(v as _Transaction));

  @override
  _Transaction get _value => super._value as _Transaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? debitAmount = freezed,
    Object? creditAmount = freezed,
    Object? particular = freezed,
    Object? mode = freezed,
    Object? date = freezed,
    Object? transactionCategoryId = freezed,
    Object? partyLedgerId = freezed,
    Object? assetLedgerId = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
  }) {
    return _then(_Transaction(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      debitAmount == freezed
          ? _value.debitAmount
          : debitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as int,
      particular == freezed
          ? _value.particular
          : particular // ignore: cast_nullable_to_non_nullable
              as String,
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as TransactionMode,
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionCategoryId == freezed
          ? _value.transactionCategoryId
          : transactionCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      partyLedgerId == freezed
          ? _value.partyLedgerId
          : partyLedgerId // ignore: cast_nullable_to_non_nullable
              as int?,
      assetLedgerId == freezed
          ? _value.assetLedgerId
          : assetLedgerId // ignore: cast_nullable_to_non_nullable
              as int?,
      debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  _$_Transaction(
      this.id,
      this.amount,
      this.debitAmount,
      this.creditAmount,
      this.particular,
      this.mode,
      this.date,
      this.transactionCategoryId,
      this.partyLedgerId,
      this.assetLedgerId,
      this.debitSideLedger,
      this.creditSideLedger);

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionFromJson(json);

  @override
  final int? id;
  @override
  final int amount;
  @override
  final int debitAmount;
  @override
  final int creditAmount;
  @override
  final String particular;
  @override
  final TransactionMode mode;
  @override //user input--can be credit or Cashdown
  final DateTime date;
  @override //user input
  final int transactionCategoryId;
  @override
  final int? partyLedgerId;
  @override
  final int? assetLedgerId;
  @override
  final int? debitSideLedger;
  @override
  final int? creditSideLedger;

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, debitAmount: $debitAmount, creditAmount: $creditAmount, particular: $particular, mode: $mode, date: $date, transactionCategoryId: $transactionCategoryId, partyLedgerId: $partyLedgerId, assetLedgerId: $assetLedgerId, debitSideLedger: $debitSideLedger, creditSideLedger: $creditSideLedger)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Transaction &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.debitAmount, debitAmount) ||
                const DeepCollectionEquality()
                    .equals(other.debitAmount, debitAmount)) &&
            (identical(other.creditAmount, creditAmount) ||
                const DeepCollectionEquality()
                    .equals(other.creditAmount, creditAmount)) &&
            (identical(other.particular, particular) ||
                const DeepCollectionEquality()
                    .equals(other.particular, particular)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.transactionCategoryId, transactionCategoryId) ||
                const DeepCollectionEquality().equals(
                    other.transactionCategoryId, transactionCategoryId)) &&
            (identical(other.partyLedgerId, partyLedgerId) ||
                const DeepCollectionEquality()
                    .equals(other.partyLedgerId, partyLedgerId)) &&
            (identical(other.assetLedgerId, assetLedgerId) ||
                const DeepCollectionEquality()
                    .equals(other.assetLedgerId, assetLedgerId)) &&
            (identical(other.debitSideLedger, debitSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.debitSideLedger, debitSideLedger)) &&
            (identical(other.creditSideLedger, creditSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.creditSideLedger, creditSideLedger)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(debitAmount) ^
      const DeepCollectionEquality().hash(creditAmount) ^
      const DeepCollectionEquality().hash(particular) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(transactionCategoryId) ^
      const DeepCollectionEquality().hash(partyLedgerId) ^
      const DeepCollectionEquality().hash(assetLedgerId) ^
      const DeepCollectionEquality().hash(debitSideLedger) ^
      const DeepCollectionEquality().hash(creditSideLedger);

  @JsonKey(ignore: true)
  @override
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionToJson(this);
  }
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      int? id,
      int amount,
      int debitAmount,
      int creditAmount,
      String particular,
      TransactionMode mode,
      DateTime date,
      int transactionCategoryId,
      int? partyLedgerId,
      int? assetLedgerId,
      int? debitSideLedger,
      int? creditSideLedger) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  int get debitAmount => throw _privateConstructorUsedError;
  @override
  int get creditAmount => throw _privateConstructorUsedError;
  @override
  String get particular => throw _privateConstructorUsedError;
  @override
  TransactionMode get mode => throw _privateConstructorUsedError;
  @override //user input--can be credit or Cashdown
  DateTime get date => throw _privateConstructorUsedError;
  @override //user input
  int get transactionCategoryId => throw _privateConstructorUsedError;
  @override
  int? get partyLedgerId => throw _privateConstructorUsedError;
  @override
  int? get assetLedgerId => throw _privateConstructorUsedError;
  @override
  int? get debitSideLedger => throw _privateConstructorUsedError;
  @override
  int? get creditSideLedger => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionCopyWith<_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
