import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/creditSettlement/model/creditor_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';

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
        int _credit = 0;
        int _debit = 0;

        for (int j = 0; j < _transactionList.length; j++) {
          //  credit side ledger null means that it is a full credit to party
          if (_transactionList[j].creditSideLedger == null) {
            _credit += _transactionList[j].creditAmount;
            // if credit side ledger is cash/bank, its a partial credit to party
          } else if (_transactionList[j].creditSideLedger ==
                  LedgerMasterIndex.cash ||
              _transactionList[j].creditSideLedger == LedgerMasterIndex.bank) {
            if (_transactionList[j].transactionCategoryId ==
                TransactionCategoryIndex.businessDebtSettlement) {
              _debit += _transactionList[j].debitAmount;
            } else {
              _credit += _transactionList[j].creditAmount;
            }
          }
        }
        int _balance = 0;
        if (_credit > _debit) {
          _balance = _credit - _debit;
        }
        if (_balance > 0) {
          creditorList.add(
            Creditor(
              amount: _balance,
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
