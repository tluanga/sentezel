// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentTearOff {
  const _$PaymentTearOff();

  _Payment call(
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
      required List<String> errorMessages}) {
    return _Payment(
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
      errorMessages: errorMessages,
    );
  }
}

/// @nodoc
const $Payment = _$PaymentTearOff();

/// @nodoc
mixin _$Payment {
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
  List<String> get errorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
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
      List<String> errorMessages});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

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
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) then) =
      __$PaymentCopyWithImpl<$Res>;
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
      List<String> errorMessages});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(_Payment _value, $Res Function(_Payment) _then)
      : super(_value, (v) => _then(v as _Payment));

  @override
  _Payment get _value => super._value as _Payment;

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
    Object? errorMessages = freezed,
  }) {
    return _then(_Payment(
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
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Payment implements _Payment {
  _$_Payment(
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
  final List<String> errorMessages;

  @override
  String toString() {
    return 'Payment(amount: $amount, creditAmount: $creditAmount, debitAmount: $debitAmount, partialPaymentAmount: $partialPaymentAmount, particular: $particular, date: $date, mode: $mode, category: $category, creditSideLedger: $creditSideLedger, debitSideLedger: $debitSideLedger, errorMessages: $errorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payment &&
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
      const DeepCollectionEquality().hash(errorMessages);

  @JsonKey(ignore: true)
  @override
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);
}

abstract class _Payment implements Payment {
  factory _Payment(
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
      required List<String> errorMessages}) = _$_Payment;

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
  List<String> get errorMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentCopyWith<_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
