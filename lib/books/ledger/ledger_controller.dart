import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

final ledgerControllerProvider =
    StateNotifierProvider<LedgerController, AsyncValue<List<LedgerReport>>>(
  (ref) => LedgerController(ref.read)..loadData(),
);

class LedgerController extends StateNotifier<AsyncValue<List<LedgerReport>>> {
  Reader _read;

  LedgerController(this._read) : super(AsyncValue.loading());

  loadData() async {
    print('Load data');
    try {
      List<LedgerReport> _ledgerReportList = [];
      final ledgerMasterDataList =
          await _read(ledgerMasterRepositoryProvider).getList();
      print(ledgerMasterDataList.length);
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterDataList[i].id);
        for (int i = 0; i < _transactionList.length; i++) {
          print(_transactionList[i].amount);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
