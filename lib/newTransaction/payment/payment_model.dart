import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

class Payment {
  int amount;
  String particular;
  LedgerMaster? debitSideLedger;
  LedgerMaster? creditSideLedger;
  DateTime date;
  TransactionMode mode;
  TransactionType? paymentTransactionType;
  Payment({
    required this.amount,
    required this.particular,
    this.debitSideLedger,
    this.creditSideLedger,
    required this.date,
    required this.mode,
    this.paymentTransactionType,
  });

  Payment copyWith({
    int? amount,
    String? particular,
    LedgerMaster? debitSideLedger,
    LedgerMaster? creditSideLedger,
    DateTime? date,
    TransactionMode? mode,
    TransactionType? receiptTransactionType,
  }) {
    return Payment(
      amount: amount ?? this.amount,
      particular: particular ?? this.particular,
      debitSideLedger: debitSideLedger ?? this.debitSideLedger,
      creditSideLedger: creditSideLedger ?? this.creditSideLedger,
      date: date ?? this.date,
      mode: mode ?? this.mode,
      paymentTransactionType:
          receiptTransactionType ?? this.paymentTransactionType,
    );
  }
}
