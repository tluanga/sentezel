import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/creditSettlement/model/creditor_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';

import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final creditorListControllerProvider =
    StateNotifierProvider<CreditorListController, AsyncValue<List<Creditor>>>(
        (ref) => CreditorListController(ref.read)..loadData());

class CreditorListController extends StateNotifier<AsyncValue<List<Creditor>>> {
  final Reader _read;

  CreditorListController(this._read) : super(const AsyncValue.loading());

  loadData({String ledgerName = ''}) async {
    try {
      //--First get all party Ledger--
      final ledgerMasterDataList = await _read(ledgerMasterRepositoryProvider)
          .getList(searchString: ledgerName, type: LedgerMasterType.party);
      List<Creditor> creditorList = [];

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
          } else {
            _creditAmount += _transactionList[j].creditAmount;
          }
        }
        if ((_creditAmount - _debitAmount) > 0) {
          //The party has a debt in business
          creditorList.add(
            Creditor(
              amount: (_creditAmount - _debitAmount).abs(),
              party: ledgerMasterDataList[i],
            ),
          );
        }
      }

      //-----------Assign it to the state----------
      state = AsyncData(creditorList);
    } catch (e) {
      e.toString();
    }
  }
}
