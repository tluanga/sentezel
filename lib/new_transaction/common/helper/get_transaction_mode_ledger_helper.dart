import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

Future<LedgerMaster> getTransactionModeLedgerHelper(
    TransactionMode mode, Reader read) async {
  final ledgerMaster = read(ledgerMasterRepositoryProvider);
  switch (mode) {
    case TransactionMode.partialPaymentByBank:
      return ledgerMaster.getItem(id: LedgerMasterIndex.bank)!;
    case TransactionMode.paymentByBank:
      return ledgerMaster.getItem(id: LedgerMasterIndex.bank)!;
    case TransactionMode.partialPaymentByCash:
      return ledgerMaster.getItem(id: LedgerMasterIndex.cash)!;
    case TransactionMode.paymentByCash:
      return ledgerMaster.getItem(id: LedgerMasterIndex.cash)!;

    default:
      return ledgerMaster.getItem(id: LedgerMasterIndex.cash)!;
  }
}
