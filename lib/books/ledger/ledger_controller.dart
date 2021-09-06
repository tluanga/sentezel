import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransaction_model.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/enums/debitOrCredit_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

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

      //---------Iterate Ledger Master List-------------
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterDataList[i].id);
        int _creditAmount = 0;
        int _debitAmount = 0;
        LedgerReport _ledgerReport = LedgerReport(
          ledgerId: ledgerMasterDataList[i].id,
          name: ledgerMasterDataList[i].name,
          description: ledgerMasterDataList[i].description,
          creditAmount: _creditAmount,
          debitAmount: _debitAmount,
        );
        List<LedgerTransaction> _ledgerTransactionList = [];
        for (int j = 0; j < _transactionList.length; j++) {
          LedgerTransaction _ledgerTransaction = LedgerTransaction(
            particular: _transactionList[j].particular,
            amount: 0,
            debitOrCredit: DebitOrCredit.credit,
            date: _transactionList[j].date,
          );

          //calculate credit and debit amount
          //determin debit or credit
          TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);

          if (_transactionCategory.creditSideLedger ==
              ledgerMasterDataList[i].id) {
            _ledgerReport.creditAmount += _transactionList[j].creditAmount;
          }

          if (_transactionCategory.debitSideLedger ==
              ledgerMasterDataList[i].id) {
            _ledgerReport.debitAmount += _transactionList[j].debitAmount;
          }

          //--Asset----
          if (_transactionList[j].assetLedgerId == ledgerMasterDataList[i].id) {
            _ledgerReport.debitAmount += _transactionList[j].debitAmount;
          }

          //Party--
          //We have to check for debit or Credit
          if (_transactionList[j].partyLedgerId == ledgerMasterDataList[i].id) {
            if (_transactionCategory.debitSideLedger ==
                    LedgerMasterIndex.Bank ||
                _transactionCategory.debitSideLedger ==
                    LedgerMasterIndex.Cash) {
              //----Party is in the debit side-
              //Because BAnk/Cash when in credit replaced by party
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
            } else {
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
            }
          }
          _ledgerTransactionList.add(_ledgerTransaction);
        }
        _ledgerReportList.add(_ledgerReport);
      }

      print(_ledgerReportList.length);
      //-----------Assign it to the state----------
      state = AsyncData(_ledgerReportList);
    } catch (e) {
      print(e.toString());
    }
  }
}
