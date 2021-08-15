import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

class Transaction {
  int? id;
  int amount = 0;
  String particular;
  TransactionMode mode; //user input--can be credit or Cashdown
  DateTime date; //user input

  int? partyId; //user purchase is made by BA
  int? assetLedgerId; //if the purchase is of asset//user input
  int transactionTypeId;
  int? debitSideLedgerId; //computed-
  int? creditSideLedgerId;
  int? creditPartialPaymentAmount;

  String getInitialLetter() {
    return this.particular[0].toUpperCase();
  }

  Transaction({
    this.id,
    required this.amount,
    required this.particular,
    required this.date,
    required this.mode,
    this.partyId,
    this.assetLedgerId,
    required this.transactionTypeId,
    this.debitSideLedgerId,
    this.creditSideLedgerId,
    this.creditPartialPaymentAmount,
  });

  Transaction copyWith({
    int? id,
    int? amount,
    String? particular,
    DateTime? date,
    TransactionMode? mode,
    int? partyId,
    int? assetLedgerId,
    int? transactionTypeId,
    int? debitSideLedgerId,
    int? creditSideLedgerId,
    int? creditPartialPaymentAmount,
  }) {
    return Transaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      particular: particular ?? this.particular,
      date: date ?? this.date,
      mode: mode ?? this.mode,
      partyId: partyId ?? this.partyId,
      assetLedgerId: assetLedgerId ?? this.assetLedgerId,
      transactionTypeId: transactionTypeId ?? this.transactionTypeId,
      debitSideLedgerId: debitSideLedgerId ?? this.debitSideLedgerId,
      creditSideLedgerId: creditSideLedgerId ?? this.creditSideLedgerId,
      creditPartialPaymentAmount:
          creditPartialPaymentAmount ?? this.creditPartialPaymentAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'particular': particular,
      'date': date.microsecondsSinceEpoch,
      'mode': EnumToString.convertToString(mode),
      'partyId': partyId,
      'assetLedgerId': assetLedgerId,
      'transactionTypeId': transactionTypeId,
      'debitSideLedgerId': debitSideLedgerId,
      'creditSideLedgerId': creditSideLedgerId,
      'creditPartialPaymentAmount': creditPartialPaymentAmount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    TransactionMode _mode;
    switch (map['mode']) {
      case 'credit':
        _mode = TransactionMode.credit;
        break;
      case 'paymentByCash':
        _mode = TransactionMode.paymentByCash;
        break;
      case 'paymentByBank':
        _mode = TransactionMode.paymentByBank;
        break;
      case 'partialPaymentByCash':
        _mode = TransactionMode.partialPaymentByCash;
        break;
      case 'partialPaymentByBank':
        _mode = TransactionMode.partialPaymentByBank;
        break;
      case 'contra':
        _mode = TransactionMode.contra;
        break;
      default:
        _mode = TransactionMode.partialPaymentByCash;
    }
    return Transaction(
      id: map['id'],
      amount: map['amount'],
      particular: map['particular'],
      mode: _mode,
      date: DateTime.fromMicrosecondsSinceEpoch(map['date']),
      partyId: map['partyId'],
      assetLedgerId: map['assetLedgerId'],
      transactionTypeId: map['transactionTypeId'],
      debitSideLedgerId: map['debitSideLedgerId'],
      creditSideLedgerId: map['creditSideLedgerId'],
      creditPartialPaymentAmount: map['creditPartialPaymentAmount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    String _mode = EnumToString.convertToString(mode);
    return 'Transaction(id: $id, amount: $amount,mode:$_mode, particular: $particular, date: $date, partyId: $partyId, assetLedgerId: $assetLedgerId, transactionTypeId: $transactionTypeId, debitSideLedgerId: $debitSideLedgerId, creditSideLedgerId: $creditSideLedgerId, creditPartialPaymentAmount: $creditPartialPaymentAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.id == id &&
        other.amount == amount &&
        other.particular == particular &&
        other.date == date &&
        other.partyId == partyId &&
        other.assetLedgerId == assetLedgerId &&
        other.transactionTypeId == transactionTypeId &&
        other.debitSideLedgerId == debitSideLedgerId &&
        other.creditSideLedgerId == creditSideLedgerId &&
        other.creditPartialPaymentAmount == creditPartialPaymentAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        particular.hashCode ^
        date.hashCode ^
        partyId.hashCode ^
        assetLedgerId.hashCode ^
        transactionTypeId.hashCode ^
        debitSideLedgerId.hashCode ^
        creditSideLedgerId.hashCode ^
        creditPartialPaymentAmount.hashCode;
  }
}
