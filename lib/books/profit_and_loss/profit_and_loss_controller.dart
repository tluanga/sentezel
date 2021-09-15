import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_model.dart';
import 'package:sentezel/books/trading_account/trading_account_model.dart';

import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final profitAndLossControllerProvider = StateNotifierProvider<
        ProfitAndLossController, AsyncValue<List<ProfitAndLoss>>>(
    (ref) => ProfitAndLossController(ref.read)..loadData());

class ProfitAndLossController
    extends StateNotifier<AsyncValue<List<ProfitAndLoss>>> {
  final Reader _read;
  ProfitAndLossController(this._read) : super(AsyncValue.loading());
  loadData() async {
    try {
      List<ProfitAndLoss> _profitAndLossList = [];
      List<DirectIncome> _directIncomeList = [];
      List<DirectExpense> _directExpenseList = [];
      List<IndirectIncome> _indirectIncomeList = [];
      List<IndirectExpense> _indirectExpenseList = [];

      // DIRECT LEDGERS
      final _directLedgerMasterDataList =
          await _read(ledgerMasterRepositoryProvider)
              .getList(type: LedgerMasterType.direct);
      // first nested for loop
      for (int i = 0; i < _directLedgerMasterDataList.length; i++) {
        int _incomeOrExpense =
            0; // variable for determining income or expense, 0 for income, 1 for expense,
        // variables for Income
        int _totalIncomeCredit = 0;
        int _totalIncomeDebit = 0;
        DirectIncome _directIncome = DirectIncome(
            ledgerName: _directLedgerMasterDataList[i].name,
            totalCredit: _totalIncomeCredit,
            totalDebit: _totalIncomeDebit);
        //variables for Expense
        int _totalExpenseCredit = 0;
        int _totalExpenseDebit = 0;
        DirectExpense _directExpense = DirectExpense(
          totalCredit: _totalExpenseCredit,
          totalDebit: _totalExpenseDebit,
          ledgerName: _directLedgerMasterDataList[i].name,
        );
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: _directLedgerMasterDataList[i].id);
        // nested loop
        for (int j = 0; j < _transactionList.length; j++) {
          final TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);
          // * check if the transaction is income
          if (_transactionCategory.transactionType == TransactionType.lakluh ||
              _transactionCategory.transactionType == TransactionType.hralh) {
            _incomeOrExpense = 0;
            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _directLedgerMasterDataList[i].id) {
              _directIncome.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _directLedgerMasterDataList[i].id) {
              _directIncome.totalCredit += _transactionList[j].creditAmount;
            }
            // * check if the transaction is expense
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            _incomeOrExpense = 1;

            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _directLedgerMasterDataList[i].id) {
              _directExpense.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _directLedgerMasterDataList[i].id) {
              _directExpense.totalCredit += _transactionList[j].creditAmount;
            }
          }
        }
        // income a nih chuan incomelist ah a add ang
        if (_incomeOrExpense == 0) {
          // filter cash and bank account
          if (_directLedgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _directLedgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            _directIncomeList.add(_directIncome);
          }
          //expense a nih chuan expenselist ah a add ang
        } else if (_incomeOrExpense == 1) {
          print('Ledgermaster is ${_directLedgerMasterDataList[i].id}');
          print('index is ${LedgerMasterIndex.Cash}');
          // filter cash and bank account
          if (_directLedgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _directLedgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            print('inside if statement');
            _directExpenseList.add(_directExpense);
          }
        }
      }

      // INDIRECT LEDGERS
      final _indirectLedgerMasterDataList =
          await _read(ledgerMasterRepositoryProvider)
              .getList(type: LedgerMasterType.indirect);
      // second nested for loop
      for (int i = 0; i < _indirectLedgerMasterDataList.length; i++) {
        int _incomeOrExpense =
            0; // variable for determining income or expense, 0 for income, 1 for expense,
        // variables for Income
        int _totalIncomeCredit = 0;
        int _totalIncomeDebit = 0;
        IndirectIncome _indirectIncome = IndirectIncome(
            ledgerName: _indirectLedgerMasterDataList[i].name,
            totalCredit: _totalIncomeCredit,
            totalDebit: _totalIncomeDebit);
        //variables for Expense
        int _totalExpenseCredit = 0;
        int _totalExpenseDebit = 0;
        IndirectExpense _indirectExpense = IndirectExpense(
          totalCredit: _totalExpenseCredit,
          totalDebit: _totalExpenseDebit,
          ledgerName: _indirectLedgerMasterDataList[i].name,
        );
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: _indirectLedgerMasterDataList[i].id);
        // nested loop
        for (int j = 0; j < _transactionList.length; j++) {
          final TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);
          // * check if the transaction is income
          if (_transactionCategory.transactionType == TransactionType.lakluh ||
              _transactionCategory.transactionType == TransactionType.hralh) {
            _incomeOrExpense = 0;
            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _indirectLedgerMasterDataList[i].id) {
              _indirectIncome.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _indirectLedgerMasterDataList[i].id) {
              _indirectIncome.totalCredit += _transactionList[j].creditAmount;
            }
            // * check if the transaction is expense
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            _incomeOrExpense = 1;

            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _indirectLedgerMasterDataList[i].id) {
              _indirectExpense.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _indirectLedgerMasterDataList[i].id) {
              _indirectExpense.totalCredit += _transactionList[j].creditAmount;
            }
          }
        }
        // income a nih chuan incomelist ah a add ang
        if (_incomeOrExpense == 0) {
          // filter cash and bank account
          if (_indirectLedgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _indirectLedgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            _indirectIncomeList.add(_indirectIncome);
          }
          //expense a nih chuan expenselist ah a add ang
        } else if (_incomeOrExpense == 1) {
          print('Ledgermaster is ${_indirectLedgerMasterDataList[i].id}');
          print('index is ${LedgerMasterIndex.Cash}');
          // filter cash and bank account
          if (_indirectLedgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _indirectLedgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            print('inside if statement');
            _indirectExpenseList.add(_indirectExpense);
          }
        }
      }

      // calculation of gross profit and gross loss
      int _directExpenseTotal = 0;
      int _directIncomeTotal = 0;
      int _grossProfit = 0;
      int _grossLoss = 0;
      _directExpenseList.forEach((element) {
        _directExpenseTotal += (element.totalCredit - element.totalDebit).abs();
      });
      _directIncomeList.forEach((element) {
        _directIncomeTotal += (element.totalCredit - element.totalDebit).abs();
      });
      if (_directIncomeTotal > _directExpenseTotal) {
        _grossProfit = _directIncomeTotal - _directExpenseTotal;
      } else if (_directExpenseTotal > _directIncomeTotal) {
        _grossLoss = _directExpenseTotal - _directIncomeTotal;
      }
      // calculation of net profit and net loss
      int _indirectIncomeTotal = 0;
      int _indirectExpenseTotal = 0;
      int _netProfit = 0;
      int _netLoss = 0;
      _indirectExpenseList.forEach((element) {
        _indirectExpenseTotal +=
            (element.totalCredit - element.totalDebit).abs();
      });
      _indirectIncomeList.forEach((element) {
        _indirectIncomeTotal +=
            (element.totalCredit - element.totalDebit).abs();
      });
      if ((_grossLoss + _indirectExpenseTotal) >
          (_grossProfit + _indirectIncomeTotal)) {
        _netLoss = (_grossLoss + _indirectExpenseTotal) -
            (_grossProfit + _indirectIncomeTotal);
      } else if ((_grossLoss + _indirectExpenseTotal) <
          (_grossProfit + _indirectIncomeTotal)) {
        _netProfit = (_grossProfit + _indirectIncomeTotal) -
            (_grossLoss + _indirectExpenseTotal);
      }

      ProfitAndLoss _profitAndLoss = ProfitAndLoss(
          grossLoss: _grossLoss,
          grossProfit: _grossProfit,
          netLoss: _netLoss,
          netProfit: _netProfit,
          indirectExpense: _indirectExpenseList,
          indirectIncome: _indirectIncomeList);
      _profitAndLossList.add(_profitAndLoss);
      print('length is --------------------- ${_profitAndLossList.length}');
      state = AsyncData(_profitAndLossList);
    } catch (e) {
      print(e.toString());
    }
  }
}
