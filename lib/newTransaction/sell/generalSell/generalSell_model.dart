import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';

class GeneralSell {
  int amount;
  int creditAmount;
  int debitAmount;
  int partialPaymentAmount;
  String particular;
  LedgerMaster? debitSideLedger;
  LedgerMaster? creditSideLedger;
  LedgerMaster? party;
  DateTime date;
  TransactionMode mode;
  GeneralSell({
    required this.amount,
    this.creditAmount = 0,
    this.debitAmount = 0,
    this.partialPaymentAmount = 0,
    required this.particular,
    this.debitSideLedger,
    this.creditSideLedger,
    this.party,
    required this.date,
    required this.mode,
  });

  GeneralSell copyWith({
    int? amount,
    int? creditAmount,
    int? debitAmount,
    int? partialPaymentAmount,
    String? particular,
    LedgerMaster? debitSideLedger,
    LedgerMaster? creditSideLedger,
    LedgerMaster? party,
    DateTime? date,
    TransactionMode? mode,
  }) {
    return GeneralSell(
      amount: amount ?? this.amount,
      creditAmount: creditAmount ?? this.creditAmount,
      debitAmount: debitAmount ?? this.debitAmount,
      partialPaymentAmount: partialPaymentAmount ?? this.partialPaymentAmount,
      particular: particular ?? this.particular,
      debitSideLedger: debitSideLedger ?? this.debitSideLedger,
      creditSideLedger: creditSideLedger ?? this.creditSideLedger,
      party: party ?? this.party,
      date: date ?? this.date,
      mode: mode ?? this.mode,
    );
  }
}
