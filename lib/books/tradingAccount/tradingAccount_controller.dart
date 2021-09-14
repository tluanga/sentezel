import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';

import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final tradingAccountControllerProvider = StateNotifierProvider<
    TradingAccountController, AsyncValue<List<TradingAccount>>>(
  (ref) => TradingAccountController(ref.read)..loadData(),
);

class TradingAccountController
    extends StateNotifier<AsyncValue<List<TradingAccount>>> {
  Reader _read;
  TradingAccountController(this._read) : super(AsyncValue.loading());
  loadData() async {
    try {
      List<TradingAccount> _tradingAccountList = [];
      List<Income> _incomeList = [];
      List<Expense> _expenseList = [];
      final _ledgerMasterDataList = await _read(ledgerMasterRepositoryProvider)
          .getList(type: LedgerMasterType.direct);
      for (int i = 0; i < _ledgerMasterDataList.length; i++) {
        int _incomeOrExpense =
            0; // variable for determining income or expense, 0 for income, 1 for expense,
        // variables for Income
        int _totalIncomeCredit = 0;
        int _totalIncomeDebit = 0;
        Income _income = Income(
            ledgerName: _ledgerMasterDataList[i].name,
            totalCredit: _totalIncomeCredit,
            totalDebit: _totalIncomeDebit);
        //variables for Expense
        int _totalExpenseCredit = 0;
        int _totalExpenseDebit = 0;
        Expense _expense = Expense(
          totalCredit: _totalExpenseCredit,
          totalDebit: _totalExpenseDebit,
          ledgerName: _ledgerMasterDataList[i].name,
        );
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: _ledgerMasterDataList[i].id);
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
                _ledgerMasterDataList[i].id) {
              _income.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _ledgerMasterDataList[i].id) {
              _income.totalCredit += _transactionList[j].creditAmount;
            }
            // * check if the transaction is expense
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            _incomeOrExpense = 1;

            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _ledgerMasterDataList[i].id) {
              _expense.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _ledgerMasterDataList[i].id) {
              _expense.totalCredit += _transactionList[j].creditAmount;
            }
          }
        }
        // income a nih chuan incomelist ah a add ang
        if (_incomeOrExpense == 0) {
          // filter cash and bank account
          if (_ledgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _ledgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            _incomeList.add(_income);
          }
          //expense a nih chuan expenselist ah a add ang
        } else if (_incomeOrExpense == 1) {
          print('Ledgermaster is ${_ledgerMasterDataList[i].id}');
          print('index is ${LedgerMasterIndex.Cash}');
          // filter cash and bank account
          if (_ledgerMasterDataList[i].id != LedgerMasterIndex.Cash ||
              _ledgerMasterDataList[i].id != LedgerMasterIndex.Bank) {
            print('inside if statement');
            _expenseList.add(_expense);
          }
        }
      }
      int _directExpenseTotal = 0;
      int _directIncomeTotal = 0;
      int _grossProfit = 0;
      int _grossLoss = 0;
      _expenseList.forEach((element) {
        _directExpenseTotal += (element.totalCredit - element.totalDebit).abs();
      });
      _incomeList.forEach((element) {
        _directIncomeTotal += (element.totalCredit - element.totalDebit).abs();
      });
      if (_directIncomeTotal > _directExpenseTotal) {
        _grossProfit = _directIncomeTotal - _directExpenseTotal;
      } else if (_directExpenseTotal > _directIncomeTotal) {
        _grossLoss = _directExpenseTotal - _directIncomeTotal;
      }
      TradingAccount _tradingAccount = TradingAccount(
          expense: _expenseList,
          income: _incomeList,
          grossLoss: _grossLoss,
          grossProfit: _grossProfit);
      _tradingAccountList.add(_tradingAccount);
      state = AsyncData(_tradingAccountList);
    } catch (e) {
      print("error on traiding account controller ${e.toString()}");
    }
  }
}
