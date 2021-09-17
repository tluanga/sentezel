import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

part 'purchase_return_model.freezed.dart';

@freezed
class PurchaseReturn with _$PurchaseReturn {
  factory PurchaseReturn({
    @Default(0) int amount,
    @Default(0) int creditAmount,
    @Default(0) int debitAmount,
    String? particular,
    required DateTime date,
    @Default(TransactionMode.paymentByCash) TransactionMode? mode,
    TransactionCategory? category,
    LedgerMaster? creditSideLedger,
    LedgerMaster? debitSideLedger, //The only debit side leddger
    required List<String> errorMessages,
  }) = _PurchaseReturn;
}
