import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

part 'purchaseOfAsset_model.freezed.dart';

@freezed
class PurchaseOfAsset with _$PurchaseOfAsset {
  factory PurchaseOfAsset({
    @Default(0) int amount,
    @Default(0) int creditAmount,
    @Default(0) int debitAmount,
    @Default(0) int partialPaymentAmount,
    String? particular,
    required DateTime date,
    @Default(TransactionMode.paymentByCash) TransactionMode? mode,
    TransactionCategory? category,
    LedgerMaster? debitSideLedger,
    LedgerMaster? creditSideLedger,
    LedgerMaster? assetLedger,
    LedgerMaster? partyLedger,
  }) = _PurchaseOfAsset;
}
