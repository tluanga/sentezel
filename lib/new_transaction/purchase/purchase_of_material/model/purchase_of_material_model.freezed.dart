// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'purchase_of_material_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PurchaseOfMaterialTearOff {
  const _$PurchaseOfMaterialTearOff();

  _PurchaseOfMaterial call(
      {int amount = 0,
      int creditAmount = 0,
      int debitAmount = 0,
      int partialPaymentAmount = 0,
      String? particular,
      required DateTime date,
      TransactionMode? mode = TransactionMode.paymentByCash,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) {
    return _PurchaseOfMaterial(
      amount: amount,
      creditAmount: creditAmount,
      debitAmount: debitAmount,
      partialPaymentAmount: partialPaymentAmount,
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
const $PurchaseOfMaterial = _$PurchaseOfMaterialTearOff();

/// @nodoc
mixin _$PurchaseOfMaterial {
  int get amount => throw _privateConstructorUsedError;
  int get creditAmount => throw _privateConstructorUsedError;
  int get debitAmount => throw _privateConstructorUsedError;
  int get partialPaymentAmount => throw _privateConstructorUsedError;
  String? get particular => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionMode? get mode => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  LedgerMaster? get debitSideLedger =>
      throw _privateConstructorUsedError; //The only debit side leddger
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseOfMaterialCopyWith<PurchaseOfMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOfMaterialCopyWith<$Res> {
  factory $PurchaseOfMaterialCopyWith(
          PurchaseOfMaterial value, $Res Function(PurchaseOfMaterial) then) =
      _$PurchaseOfMaterialCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      int creditAmount,
      int debitAmount,
      int partialPaymentAmount,
      String? particular,
      DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$PurchaseOfMaterialCopyWithImpl<$Res>
    implements $PurchaseOfMaterialCopyWith<$Res> {
  _$PurchaseOfMaterialCopyWithImpl(this._value, this._then);

  final PurchaseOfMaterial _value;
  // ignore: unused_field
  final $Res Function(PurchaseOfMaterial) _then;

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
abstract class _$PurchaseOfMaterialCopyWith<$Res>
    implements $PurchaseOfMaterialCopyWith<$Res> {
  factory _$PurchaseOfMaterialCopyWith(
          _PurchaseOfMaterial value, $Res Function(_PurchaseOfMaterial) then) =
      __$PurchaseOfMaterialCopyWithImpl<$Res>;
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
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      List<String> errorMessages});

  @override
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$PurchaseOfMaterialCopyWithImpl<$Res>
    extends _$PurchaseOfMaterialCopyWithImpl<$Res>
    implements _$PurchaseOfMaterialCopyWith<$Res> {
  __$PurchaseOfMaterialCopyWithImpl(
      _PurchaseOfMaterial _value, $Res Function(_PurchaseOfMaterial) _then)
      : super(_value, (v) => _then(v as _PurchaseOfMaterial));

  @override
  _PurchaseOfMaterial get _value => super._value as _PurchaseOfMaterial;

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
    Object? creditSideLedger = freezed,
    Object? debitSideLedger = freezed,
    Object? partyLedger = freezed,
    Object? errorMessages = freezed,
  }) {
    return _then(_PurchaseOfMaterial(
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

class _$_PurchaseOfMaterial implements _PurchaseOfMaterial {
  _$_PurchaseOfMaterial(
      {this.amount = 0,
      this.creditAmount = 0,
      this.debitAmount = 0,
      this.partialPaymentAmount = 0,
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
  @JsonKey(defaultValue: 0)
  @override
  final int partialPaymentAmount;
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
  final LedgerMaster? partyLedger;
  @override
  final List<String> errorMessages;

  @override
  String toString() {
    return 'PurchaseOfMaterial(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, partialPaymentAmount: $partialPaymentAmount, particular: $particular, date: $date, mode: $mode, category: $category, creditSideLedger: $creditSideLedger, debitSideLedger: $debitSideLedger, partyLedger: $partyLedger, errorMessages: $errorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PurchaseOfMaterial &&
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
      const DeepCollectionEquality().hash(partialPaymentAmount) ^
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
  _$PurchaseOfMaterialCopyWith<_PurchaseOfMaterial> get copyWith =>
      __$PurchaseOfMaterialCopyWithImpl<_PurchaseOfMaterial>(this, _$identity);
}

abstract class _PurchaseOfMaterial implements PurchaseOfMaterial {
  factory _PurchaseOfMaterial(
      {int amount,
      int creditAmount,
      int debitAmount,
      int partialPaymentAmount,
      String? particular,
      required DateTime date,
      TransactionMode? mode,
      TransactionCategory? category,
      LedgerMaster? creditSideLedger,
      LedgerMaster? debitSideLedger,
      LedgerMaster? partyLedger,
      required List<String> errorMessages}) = _$_PurchaseOfMaterial;

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
  LedgerMaster? get creditSideLedger => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get debitSideLedger => throw _privateConstructorUsedError;
  @override //The only debit side leddger
  LedgerMaster? get partyLedger => throw _privateConstructorUsedError;
  @override
  List<String> get errorMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PurchaseOfMaterialCopyWith<_PurchaseOfMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
