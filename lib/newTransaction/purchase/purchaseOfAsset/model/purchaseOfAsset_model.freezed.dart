// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'purchaseOfAsset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PurchaseOfAssetTearOff {
  const _$PurchaseOfAssetTearOff();

  _PurchaseOfAsset call(
      {int amount = 0,
      int creditAmount = 0,
      int debitAmount = 0,
      int partialPaymentAmount = 0,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? debitSideLedger,
      LedgerMaster? creditSideLedger,
      LedgerMaster? assetLedger,
      LedgerMaster? partyLedger}) {
    return _PurchaseOfAsset(
      amount: amount,
      creditAmount: creditAmount,
      debitAmount: debitAmount,
      partialPaymentAmount: partialPaymentAmount,
      particular: particular,
      date: date,
      mode: mode,
      category: category,
      debitSideLedger: debitSideLedger,
      creditSideLedger: creditSideLedger,
      assetLedger: assetLedger,
      partyLedger: partyLedger,
    );
  }
}

/// @nodoc
const $PurchaseOfAsset = _$PurchaseOfAssetTearOff();

/// @nodoc
mixin _$PurchaseOfAsset {
  int get amount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  int get partialPaymentAmount => throw _privateConstructorUsedError;
  String? get particular => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionMode? get mode => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get assetLedger => throw _privateConstructorUsedError;
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseOfAssetCopyWith<PurchaseOfAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOfAssetCopyWith<$Res> {
  factory $PurchaseOfAssetCopyWith(
          PurchaseOfAsset value, $Res Function(PurchaseOfAsset) then) =
      _$PurchaseOfAssetCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      int partialPaymentAmount,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? debitSideLedger,
      LedgerMaster? creditSideLedger,
      LedgerMaster? assetLedger,
      LedgerMaster? partyLedger});
}

/// @nodoc
class _$PurchaseOfAssetCopyWithImpl<$Res>
    implements $PurchaseOfAssetCopyWith<$Res> {
  _$PurchaseOfAssetCopyWithImpl(this._value, this._then);

  final PurchaseOfAsset _value;
  // ignore: unused_field
  final $Res Function(PurchaseOfAsset) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? partialPaymentAmount = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
    Object? assetLedger = freezed,
    Object? partyLedger = freezed,
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
      partialPaymentAmount: partialPaymentAmount == freezed
          ? _value.partialPaymentAmount
          : partialPaymentAmount // ignore: cast_nullable_to_non_nullable
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
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      assetLedger: assetLedger == freezed
          ? _value.assetLedger
          : assetLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      partyLedger: partyLedger == freezed
          ? _value.partyLedger
          : partyLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
    ));
  }
}

/// @nodoc
abstract class _$PurchaseOfAssetCopyWith<$Res>
    implements $PurchaseOfAssetCopyWith<$Res> {
  factory _$PurchaseOfAssetCopyWith(
          _PurchaseOfAsset value, $Res Function(_PurchaseOfAsset) then) =
      __$PurchaseOfAssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      int partialPaymentAmount,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? debitSideLedger,
      LedgerMaster? creditSideLedger,
      LedgerMaster? assetLedger,
      LedgerMaster? partyLedger});
}

/// @nodoc
class __$PurchaseOfAssetCopyWithImpl<$Res>
    extends _$PurchaseOfAssetCopyWithImpl<$Res>
    implements _$PurchaseOfAssetCopyWith<$Res> {
  __$PurchaseOfAssetCopyWithImpl(
      _PurchaseOfAsset _value, $Res Function(_PurchaseOfAsset) _then)
      : super(_value, (v) => _then(v as _PurchaseOfAsset));

  @override
  _PurchaseOfAsset get _value => super._value as _PurchaseOfAsset;

  @override
  $Res call({
    Object? amount = freezed,
    Object? creditAmount = freezed,
    Object? debitAmount = freezed,
    Object? partialPaymentAmount = freezed,
    Object? particular = freezed,
    Object? date = freezed,
    Object? mode = freezed,
    Object? category = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
    Object? assetLedger = freezed,
    Object? partyLedger = freezed,
  }) {
    return _then(_PurchaseOfAsset(
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
      partialPaymentAmount: partialPaymentAmount == freezed
          ? _value.partialPaymentAmount
          : partialPaymentAmount // ignore: cast_nullable_to_non_nullable
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
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      assetLedger: assetLedger == freezed
          ? _value.assetLedger
          : assetLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
      partyLedger: partyLedger == freezed
          ? _value.partyLedger
          : partyLedger // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
    ));
  }
}

/// @nodoc

class _$_PurchaseOfAsset implements _PurchaseOfAsset {
  _$_PurchaseOfAsset(
      {this.amount = 0,
      this.creditAmount = 0,
      this.debitAmount = 0,
      this.partialPaymentAmount = 0,
      this.particular,
      required this.date,
      this.mode,
      this.category,
      this.debitSideLedger,
      this.creditSideLedger,
      this.assetLedger,
      this.partyLedger});

  @JsonKey(defaultValue: 0)
  @override
  final int amount;
  @JsonKey(defaultValue: 0)
  @override
  final int creditAmount;
  @JsonKey(defaultValue: 0)
  @override
  final int debitAmount;
  @JsonKey(defaultValue: 0)
  @override
  final int partialPaymentAmount;
  @override
  final String? particular;
  @override
  final DateTime date;
  @override
  final TransactionMode? mode;
  @override
  final TransactionCategory? category;
  @override
  final LedgerMaster? debitSideLedger;
  @override
  final LedgerMaster? creditSideLedger;
  @override
  final LedgerMaster? assetLedger;
  @override
  final LedgerMaster? partyLedger;

  @override
  String toString() {
    return 'PurchaseOfAsset(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, partialPaymentAmount: $partialPaymentAmount, particular: $particular, date: $date, mode: $mode, category: $category, debitSideLedger: $debitSideLedger, creditSideLedger: $creditSideLedger, assetLedger: $assetLedger, partyLedger: $partyLedger)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PurchaseOfAsset &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.creditAmount, creditAmount) ||
                const DeepCollectionEquality()
                    .equals(other.creditAmount, creditAmount)) &&
            (identical(other.debitAmount, debitAmount) ||
                const DeepCollectionEquality()
                    .equals(other.debitAmount, debitAmount)) &&
            (identical(other.partialPaymentAmount, partialPaymentAmount) ||
                const DeepCollectionEquality().equals(
                    other.partialPaymentAmount, partialPaymentAmount)) &&
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
            (identical(other.debitSideLedger, debitSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.debitSideLedger, debitSideLedger)) &&
            (identical(other.creditSideLedger, creditSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.creditSideLedger, creditSideLedger)) &&
            (identical(other.assetLedger, assetLedger) ||
                const DeepCollectionEquality()
                    .equals(other.assetLedger, assetLedger)) &&
            (identical(other.partyLedger, partyLedger) ||
                const DeepCollectionEquality()
                    .equals(other.partyLedger, partyLedger)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(creditAmount) ^
      const DeepCollectionEquality().hash(debitAmount) ^
      const DeepCollectionEquality().hash(partialPaymentAmount) ^
      const DeepCollectionEquality().hash(particular) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(debitSideLedger) ^
      const DeepCollectionEquality().hash(creditSideLedger) ^
      const DeepCollectionEquality().hash(assetLedger) ^
      const DeepCollectionEquality().hash(partyLedger);

  @JsonKey(ignore: true)
  @override
  _$PurchaseOfAssetCopyWith<_PurchaseOfAsset> get copyWith =>
      __$PurchaseOfAssetCopyWithImpl<_PurchaseOfAsset>(this, _$identity);
}

abstract class _PurchaseOfAsset implements PurchaseOfAsset {
  factory _PurchaseOfAsset(
      {int amount,
      int creditAmount,
      int debitAmount,
      int partialPaymentAmount,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? debitSideLedger,
      LedgerMaster? creditSideLedger,
      LedgerMaster? assetLedger,
      LedgerMaster? partyLedger}) = _$_PurchaseOfAsset;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  int get creditAmount => throw _privateConstructorUsedError;
  @override
  int get debitAmount => throw _privateConstructorUsedError;
  @override
  int get partialPaymentAmount => throw _privateConstructorUsedError;
  @override
  String? get particular => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  TransactionMode? get mode => throw _privateConstructorUsedError;
  @override
  TransactionCategory? get category => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get assetLedger => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PurchaseOfAssetCopyWith<_PurchaseOfAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
