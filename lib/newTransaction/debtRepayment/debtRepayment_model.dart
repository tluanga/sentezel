import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

class DebtRePayment {
  int amount;
  String particular;
  LedgerMaster? debitSideLedger;
  LedgerMaster? creditSideLedger;
  DateTime date;
  TransactionMode mode;
  List<Transaction>? debtList = [];

  DebtRePayment({
    required this.amount,
    required this.particular,
    this.debitSideLedger,
    this.creditSideLedger,
    required this.date,
    required this.mode,
    this.debtList,
  });

  DebtRePayment copyWith({
    int? amount,
    String? particular,
    LedgerMaster? debitSideLedger,
    LedgerMaster? creditSideLedger,
    DateTime? date,
    TransactionMode? mode,
    TransactionType? receiptTransactionType,
  }) {
    return DebtRePayment(
        amount: amount ?? this.amount,
        particular: particular ?? this.particular,
        debitSideLedger: debitSideLedger ?? this.debitSideLedger,
        creditSideLedger: creditSideLedger ?? this.creditSideLedger,
        date: date ?? this.date,
        mode: mode ?? this.mode,
        debtList: debtList);
  }
}
