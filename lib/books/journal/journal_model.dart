import 'package:sentezel/common/enums/transaction_type_enum.dart';

// import 'package:sentezel/settings/transactionCategory/data/transaction_type_enum.dart';

class Journal {
  String particular;
  int amount;
  DateTime date;
  String transactionCategory;
  TransactionType transactionType;
  String? creditSideLedgerName;
  String? debitSideLedgerName;
  String? partyLedgerName;
  String? assetLedgerName;
  String mode;
  Journal({
    required this.particular,
    required this.amount,
    required this.date,
    required this.transactionCategory,
    required this.transactionType,
    this.creditSideLedgerName,
    this.debitSideLedgerName,
    this.partyLedgerName,
    this.assetLedgerName,
    required this.mode,
  });
}

// part 'journal_model.freezed.dart';

// @freezed
// class Journal with _$Journal {
//   factory Journal({
//     required String particular,
//     required int amount,
//     required DateTime date,
//     required String transactionCategory,
//     required TransactionType transactionType,
//     String? creditSideLedgerName,
//     String? debitSideLedgerName,
//     String? partyLedgerName,
//     String? assetLedgerName,
//     required String mode,
//   }) = _Journal;
// }
