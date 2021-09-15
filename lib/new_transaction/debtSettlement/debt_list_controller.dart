import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/debtSettlement/model/debtor_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final debtorListControllerProvider =
    StateNotifierProvider<DebtorListController, AsyncValue<List<Debtor>>>(
        (ref) => DebtorListController(ref.read)..loadData());

class DebtorListController extends StateNotifier<AsyncValue<List<Debtor>>> {
  final Reader _read;

  DebtorListController(this._read) : super(AsyncValue.loading());

  loadData({String ledgerName = ''}) async {
    print('Load data');
    try {
      //--First get all party Ledger--
      final ledgerMasterDataList = await _read(ledgerMasterRepositoryProvider)
          .getList(searchString: ledgerName, type: LedgerMasterType.party);
      print(ledgerMasterDataList.length);

      List<Debtor> debtorList = [];

      //---------Iterate Ledger Master List-------------
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterDataList[i].id);
        int _creditAmount = 0;
        int _debitAmount = 0;

        for (int j = 0; j < _transactionList.length; j++) {
          //--get Transaction Category----------
          TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);

          //Party--
          //We have to check for debit or Credit
          if (_transactionCategory.debitSideLedger == LedgerMasterIndex.Bank ||
              _transactionCategory.debitSideLedger == LedgerMasterIndex.Cash) {
            //----Party is in the debit side-
            //Because BAnk/Cash when in credit replaced by party
            _debitAmount = _transactionList[j].debitAmount;
            ;
          } else {
            _creditAmount += _transactionList[j].creditAmount;
          }
        }
        if ((_debitAmount - _creditAmount) > 0) {
          //The party has a debt in business
          debtorList.add(
            Debtor(
              amount: (_debitAmount - _creditAmount).abs(),
              party: ledgerMasterDataList[i],
            ),
          );
        }
      }

      //-----------Assign it to the state----------
      state = AsyncData(debtorList);
    } catch (e) {
      print(e.toString());
    }
  }
}
