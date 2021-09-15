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
  TrialBalanceController(this._read) : super(const AsyncValue.loading());
  loadData() async {
    try {
      final _ledgerMasterList =
          await _read(ledgerMasterRepositoryProvider).getList();
      List<TrialBalance> _trialBalanceList = [];
      for (int i = 0; i < _ledgerMasterList.length; i++) {
        int _totalDebit = 0;
        int _totalCredit = 0;
        String _ledgerName = _ledgerMasterList[i].name;
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: _ledgerMasterList[i].id);
        for (int j = 0; j < _transactionList.length; j++) {
          if (_transactionList[j].debitSideLedger == _ledgerMasterList[i].id) {
            _totalDebit += _transactionList[j].debitAmount;
          } else if (_transactionList[j].creditSideLedger ==
              _ledgerMasterList[i].id) {
            _totalCredit += _transactionList[j].creditAmount;
          }
        }
        TrialBalance _trialBalance = TrialBalance(
            ledgerName: _ledgerName,
            totalCredit: _totalCredit,
            totalDebit: _totalDebit,
            balance: (_totalCredit - _totalDebit).abs());
        _trialBalanceList.add(_trialBalance);
      }
      state = AsyncData(_trialBalanceList);
    } catch (e) {
      throw (e.toString());
    }
  }
}
