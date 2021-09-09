import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransaction_model.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/enums/debitOrCredit_enum.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final ledgerControllerProvider =
    StateNotifierProvider<LedgerController, AsyncValue<List<LedgerReport>>>(
  (ref) => LedgerController(ref.read)..loadData(ledgerName: ''),
);

class LedgerController extends StateNotifier<AsyncValue<List<LedgerReport>>> {
  Reader _read;

  LedgerController(this._read) : super(AsyncValue.loading());

  loadData({String ledgerName = ''}) async {
    print('Load data');
    try {
      List<LedgerReport> _ledgerReportList = [];
      final ledgerMasterDataList =
          await _read(ledgerMasterRepositoryProvider).getList(
        searchString: ledgerName,
      );
      print(ledgerMasterDataList.length);

      //---------Iterate Ledger Master List-------------
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterDataList[i].id);
        int _creditAmount = 0;
        int _debitAmount = 0;
        List<LedgerTransaction> _ledgerTransactionList = [];
        LedgerReport _ledgerReport = LedgerReport(
          ledgerId: ledgerMasterDataList[i].id,
          name: ledgerMasterDataList[i].name,
          description: ledgerMasterDataList[i].description,
          creditAmount: _creditAmount,
          debitAmount: _debitAmount,
          ledgerTransaction: _ledgerTransactionList,
        );

        for (int j = 0; j < _transactionList.length; j++) {
          LedgerTransaction _ledgerTransaction = LedgerTransaction(
            amount: 0,
            debitOrCredit: DebitOrCredit.credit,
            transaction: _transactionList[j],
          );

          //calculate credit and debit amount
          //determin debit or credit
          TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);

          //We have to check for debit or Credit

          if (_transactionCategory.transactionType == TransactionType.hralh ||
              _transactionCategory.transactionType == TransactionType.lakluh) {
            //----------If Party---
            _ledgerReport.debitAmount += _transactionList[j].debitAmount;
            _ledgerTransaction.amount = _transactionList[j].debitAmount;
            _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            if (_transactionList[j].assetLedgerId == _ledgerReport.ledgerId) {
              //purcahse of Asset-----
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
            }
            _ledgerReport.creditAmount += _transactionList[j].creditAmount;
            _ledgerTransaction.amount = _transactionList[j].creditAmount;
            _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
          }

          //-----------Contra---------------

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

  LedgerReport getLedgerDetail(int ledgerid) {
    var data =
        state.data!.value.firstWhere((element) => element.ledgerId == ledgerid);
    return data;
  }
}
