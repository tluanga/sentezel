import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/newTransaction/data/transaction_mode_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

part 'receipt_model.freezed.dart';

@freezed
class Receipt with _$Receipt {
  factory Receipt({
    @Default(0) int amount,
    @Default(0) int creditAmount,
    @Default(0) int debitAmount,
    @Default(0) int partialPaymentAmount,
    String? particular,
    required DateTime date,
    @Default(TransactionMode.paymentByCash) TransactionMode? mode,
    TransactionCategory? category,
    LedgerMaster? creditSideLedger,
    LedgerMaster? debitSideLedger, //The only debit side leddger

    required List<String> errorMessages,
  }) = _Receipt;
}
