import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';
import 'package:sentezel/common/enums/debit_or_credit_enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
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
          // startDate: dates.startDate,
          // endDate: dates.endDate,
        );
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
            // cash and bank ledgers
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              if (_transactionList[j].mode ==
                      TransactionMode.partialPaymentByBank ||
                  _transactionList[j].mode ==
                      TransactionMode.partialPaymentByCash) {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
                _ledgerReport.debitAmount +=
                    _transactionList[j].partialPaymentAmount;
                _ledgerTransaction.amount =
                    _transactionList[j].partialPaymentAmount;
              } else if (_transactionList[j].mode ==
                      TransactionMode.paymentByBank ||
                  _transactionList[j].mode == TransactionMode.paymentByCash) {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
                _ledgerReport.debitAmount += _transactionList[j].debitAmount;
                _ledgerTransaction.amount = _transactionList[j].debitAmount;
              }
              // for party ledgers
            } else if (ledgerMasterDataList[i].id ==
                _transactionList[j].partyLedgerId) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
              //  for other ledgers
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            }
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            //----------------for asset ledgers----------
            if (_transactionList[j].assetLedgerId ==
                ledgerMasterDataList[i].id) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
              //  for party ledgers
            } else if (_transactionList[j].partyLedgerId ==
                ledgerMasterDataList[i].id) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
              //  for cash and bank ledgers
            } else if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              if (_transactionList[j].mode ==
                      TransactionMode.partialPaymentByBank ||
                  _transactionList[j].mode ==
                      TransactionMode.partialPaymentByCash) {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
                _ledgerReport.creditAmount +=
                    _transactionList[j].partialPaymentAmount;
                _ledgerTransaction.amount =
                    _transactionList[j].partialPaymentAmount;
              } else if (_transactionList[j].mode ==
                      TransactionMode.paymentByBank ||
                  _transactionList[j].mode == TransactionMode.paymentByCash) {
                _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
                _ledgerReport.creditAmount += _transactionList[j].creditAmount;
                _ledgerTransaction.amount = _transactionList[j].creditAmount;
              }
              // other ledgers
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            }
            // other transaction types which are not lei/pekchhuah or lakluh/hralh
          } else if (_transactionCategory.transactionType ==
                  TransactionType.debtRepaymentByDebtor ||
              _transactionCategory.transactionType ==
                  TransactionType.purchaseReturn ||
              _transactionCategory.transactionType ==
                  TransactionType.capitalInjection ||
              _transactionCategory.transactionType ==
                  TransactionType.openingBalanceBank ||
              _transactionCategory.transactionType ==
                  TransactionType.openingBalanceCash) {
            // transaction types where cash/ bank are debited
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            }
            //  transaction types where cash/bank are credited
          } else if (_transactionCategory.transactionType ==
                  TransactionType.debtRepaymentToCreditor ||
              _transactionCategory.transactionType ==
                  TransactionType.saleReturn) {
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash ||
                ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            } else {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            }
            //-----------Contra---------------
          } else if (_transactionCategory.transactionType ==
              TransactionType.cashToBank) {
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            } else if (ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            }
          } else if (_transactionCategory.transactionType ==
              TransactionType.bankToCash) {
            if (ledgerMasterDataList[i].id == LedgerMasterIndex.cash) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
              _ledgerReport.debitAmount += _transactionList[j].debitAmount;
              _ledgerTransaction.amount = _transactionList[j].debitAmount;
            } else if (ledgerMasterDataList[i].id == LedgerMasterIndex.bank) {
              _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
              _ledgerReport.creditAmount += _transactionList[j].creditAmount;
              _ledgerTransaction.amount = _transactionList[j].creditAmount;
            }
          }
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
