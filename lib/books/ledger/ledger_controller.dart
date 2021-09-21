import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';
import 'package:sentezel/common/enums/debit_or_credit_enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection.controller.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final ledgerControllerProvider =
    StateNotifierProvider<LedgerController, AsyncValue<List<LedgerReport>>>(
        (ref) {
  return LedgerController(ref.read, ref)
    ..loadData(
      ledgerName: '',
    );
});

class LedgerController extends StateNotifier<AsyncValue<List<LedgerReport>>> {
  final Reader _read;
  final ProviderRefBase ref;

  LedgerController(this._read, this.ref) : super(const AsyncValue.loading());

  loadData({String ledgerName = ''}) async {
    final dates = ref.watch(timeFrameSelectionControllerProvider);
    try {
      List<LedgerReport> _ledgerReportList = [];
      final ledgerMasterDataList =
          await _read(ledgerMasterRepositoryProvider).getList(
        searchString: ledgerName,
      );

      //---------Iterate Ledger Master List-------------
      for (int i = 0; i < ledgerMasterDataList.length; i++) {
        //

        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
          ledgerMasterId: ledgerMasterDataList[i].id,
          startDate: dates.startDate,
          endDate: dates.endDate,
        );
        print(_transactionList.length);
        //s
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

            //Checking for cash/bank or other ledger for correction of debit and credit
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.bank ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.cash) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            }

            // _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            if (_transactionList[j].assetLedgerId == _ledgerReport.ledgerId) {
              //purcahse of Asset-----

              //Checking for cash/bank or other ledger for correction of debit and credit
              if (ledgerMasterDataList[i].id == LedgerMasterIndex.bank ||
                  ledgerMasterDataList[i].id == LedgerMasterIndex.cash) {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
                _ledgerReport.creditAmount += _transactionList[j].creditAmount;
                _ledgerTransaction.amount = _transactionList[j].creditAmount;
              } else {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
                _ledgerReport.debitAmount += _transactionList[j].debitAmount;
                _ledgerTransaction.amount = _transactionList[j].debitAmount;
              }
              // _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
            }

            //Checking for cash/bank or other ledger for correction of debit and credit
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.bank ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.cash) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            }
            // _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
          }

          //-----------Contra---------------

          _ledgerTransactionList.add(_ledgerTransaction);
        }
        _ledgerReportList.add(_ledgerReport);
      }

      //-----------Assign it to the state----------
      state = AsyncData(_ledgerReportList);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  LedgerReport getLedgerDetail(int ledgerid) {
    var data =
        state.data!.value.firstWhere((element) => element.ledgerId == ledgerid);
    return data;
  }
}
