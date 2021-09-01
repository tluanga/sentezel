import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

class Receipt {
  int amount;
  String particular;
  LedgerMaster? debitSideLedger;
  LedgerMaster? creditSideLedger;
  DateTime date;
  TransactionMode mode;
  TransactionType? receiptTransactionType;
  Receipt({
    required this.amount,
    required this.particular,
    this.debitSideLedger,
    this.creditSideLedger,
    required this.date,
    required this.mode,
    this.receiptTransactionType,
  });

  Receipt copyWith({
    int? amount,
    String? particular,
    LedgerMaster? debitSideLedger,
    LedgerMaster? creditSideLedger,
    DateTime? date,
    TransactionMode? mode,
    TransactionType? receiptTransactionType,
  }) {
    return Receipt(
      amount: amount ?? this.amount,
      particular: particular ?? this.particular,
      debitSideLedger: debitSideLedger ?? this.debitSideLedger,
      creditSideLedger: creditSideLedger ?? this.creditSideLedger,
      date: date ?? this.date,
      mode: mode ?? this.mode,
      receiptTransactionType:
          receiptTransactionType ?? this.receiptTransactionType,
    );
  }
}
