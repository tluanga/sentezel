import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/new_transaction/creditSettlement/model/creditor_model.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

part 'credit_settlement_model.freezed.dart';

@freezed
class CreditSettlement with _$CreditSettlement {
  factory CreditSettlement({
    @Default(0) int amount,
    @Default(0) int creditAmount,
    @Default(0) int debitAmount,
    Creditor? creditor,
    String? particular,
    required DateTime date,
    @Default(TransactionMode.paymentByCash) TransactionMode? mode,
    TransactionCategory? category,
    LedgerMaster? creditSideLedger,
    LedgerMaster? debitSideLedger,
    LedgerMaster? partyLedger,
    required List<String> errorMessages,
  }) = _CrditSettlement;
}
