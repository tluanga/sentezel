import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction(
    int? id,
    int amount,
    int debitAmount,
    int creditAmount,
    String particular,
    TransactionMode mode, //user input--can be credit or Cashdown
    DateTime date, //user input
    int transactionCategoryId,
    int? partyLedgerId,
    int? assetLedgerId,
    int? debitSideLedger,
    int? creditSideLedger,
  ) = _Transaction;
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
