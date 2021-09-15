import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/trial_balance/trial_balance_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

final trialBalanceControllerProvider = StateNotifierProvider<
    TrialBalanceController, AsyncValue<List<TrialBalance>>>(
  (ref) => TrialBalanceController(ref.read)..loadData(),
);

class TrialBalanceController
    extends StateNotifier<AsyncValue<List<TrialBalance>>> {
  final Reader _read;
  TrialBalanceController(this._read) : super(AsyncValue.loading());
  loadData() async {
    final _ledgerMasterList =
        await _read(ledgerMasterRepositoryProvider).getList();

    for (int i = 0; i < _ledgerMasterList.length; i++) {
      final _transactionList = await _read(transactionRepositoryProvider)
          .getTransactionByLedgerMaster(
              ledgerMasterId: _ledgerMasterList[i].id);
    }
  }
}
