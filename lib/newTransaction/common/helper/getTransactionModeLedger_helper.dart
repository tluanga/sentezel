import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

Future<LedgerMaster> getTransactionModeLedgerHelper(
    TransactionMode mode, Reader read) async {
  final ledgerMaster = read(ledgerMasterRepositoryProvider);
  switch (mode) {
    case TransactionMode.partialPaymentByBank:
      return ledgerMaster.getItem(id: LedgerMasterIndex.Bank)!;
    case TransactionMode.paymentByBank:
      return ledgerMaster.getItem(id: LedgerMasterIndex.Bank)!;
    case TransactionMode.partialPaymentByCash:
      return ledgerMaster.getItem(id: LedgerMasterIndex.Cash)!;
    case TransactionMode.paymentByCash:
      return ledgerMaster.getItem(id: LedgerMasterIndex.Cash)!;

    default:
      return ledgerMaster.getItem(id: LedgerMasterIndex.Cash)!;
  }
}
