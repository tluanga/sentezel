import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/debtSettlement/model/debtor_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';

final debtorListControllerProvider =
    StateNotifierProvider<DebtorListController, AsyncValue<List<Debtor>>>(
        (ref) => DebtorListController(ref.read)..loadData());

class DebtorListController extends StateNotifier<AsyncValue<List<Debtor>>> {
  final Reader _read;
  DebtorListController(this._read) : super(const AsyncValue.loading());
  loadData({String ledgerName = ''}) async {
    try {
      //--First get all party Ledger--
      final ledgerMasterDataList = await _read(ledgerMasterRepositoryProvider)
          .getList(searchString: ledgerName, type: LedgerMasterType.party);
      List<Debtor> debtorList = [];
      //---------Iterate Ledger Master List-------------
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterDataList[i].id);
        int _credit = 0;
        int _debit = 0;
        for (int j = 0; j < _transactionList.length; j++) {
          // debit side ledger null means that it is a full credit by party
          if (_transactionList[j].debitSideLedger == null) {
            _debit += _transactionList[j].debitAmount;
            // if debit side ledger is cash/bank, its a partial credit by party
          } else if (_transactionList[j].debitSideLedger ==
                  LedgerMasterIndex.cash ||
              _transactionList[j].debitSideLedger == LedgerMasterIndex.bank) {
            if (_transactionList[j].transactionCategoryId ==
                TransactionCategoryIndex.customerDebtSettlement) {
              _credit += _transactionList[j].creditAmount;
            } else {
              _debit += _transactionList[j].debitAmount;
            }
          }
        }
        int _balance = 0;
        if (_debit > _credit) {
          _balance = _debit - _credit;
        }
        if (_balance > 0) {
          debtorList.add(
            Debtor(
              amount: _balance,
              party: ledgerMasterDataList[i],
            ),
          );
        }
      }

      //-----------Assign it to the state----------
      state = AsyncData(debtorList);
    } catch (e) {
      throw (e.toString());
    }
  }
}
