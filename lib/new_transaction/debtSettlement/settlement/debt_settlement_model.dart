import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/newTransaction/data/transaction_mode_enum.dart';
import 'package:sentezel/newTransaction/debtSettlement/model/debtor_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

part 'debt_settlement_model.freezed.dart';

@freezed
class DebtSettlement with _$DebtSettlement {
  factory DebtSettlement({
    @Default(0) int amount,
    @Default(0) int creditAmount,
    @Default(0) int debitAmount,
    Debtor? debtor,
    String? particular,
    required DateTime date,
    @Default(TransactionMode.paymentByCash) TransactionMode? mode,
    TransactionCategory? category,
    LedgerMaster? creditSideLedger,
    LedgerMaster? debitSideLedger,
    LedgerMaster? partyLedger,
    required List<String> errorMessages,
  }) = _DebtSettlement;
}
