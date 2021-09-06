import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
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
        int creditAmount = 0;
        int debitAmount = 0;

        for (int j = 0; j < _transactionList.length; j++) {
          print(_transactionList[i].debitAmount);
          //calculate credit and debit amount
          //determin debit or credit
          //--Asset----
          if (_transactionList[j].mode == TransactionMode.credit) {
            //Full Credit

          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
