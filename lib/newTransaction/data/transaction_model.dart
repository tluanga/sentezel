import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    int? id,
    required int debitAmount,
    required int creditAmount,
    required int partialPaymentAmount,
    required String particular,
    required TransactionMode mode, //user input--can be credit or Cashdown

    required DateTime date, //user input
    required int transactionCategoryId,
    int? partyLedgerId,
    int? assetLedgerId,
    int? debitSideLedger,
    int? creditSideLedger,
  }) = _Transaction;
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
