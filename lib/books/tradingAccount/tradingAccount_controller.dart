import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
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
      final _ledgerMasterDataList = await _read(ledgerMasterRepositoryProvider)
          .getList(type: LedgerMasterType.direct);
      for (int i = 0; i < _ledgerMasterDataList.length; i++) {
        List<Income> _incomeList = [];
        List<Expense> _expenseList = [];
        TradingAccount _tradingAccount =
            TradingAccount(expense: _expenseList, income: _incomeList);
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
            int _totalIncomeCredit = 0;
            int _totalIncomeDebit = 0;
            Income _income = Income(
                ledgerName: _ledgerMasterDataList[i].name,
                totalCredit: _totalIncomeCredit,
                totalDebit: _totalIncomeDebit);
            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _ledgerMasterDataList[i].id) {
              _income.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _ledgerMasterDataList[i].id) {
              _income.totalCredit += _transactionList[j].creditAmount;
            }
            _incomeList.add(_income);
            // * check if the transaction is expense
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            int _totalExpenseCredit = 0;
            int _totalExpenseDebit = 0;
            Expense _expense = Expense(
              totalCredit: _totalExpenseCredit,
              totalDebit: _totalExpenseDebit,
              ledgerName: _ledgerMasterDataList[i].name,
            );
            // check if the transacion is the particular ledger
            if (_transactionList[j].debitSideLedger ==
                _ledgerMasterDataList[i].id) {
              _expense.totalDebit += _transactionList[j].debitAmount;
            }
            if (_transactionList[j].creditSideLedger ==
                _ledgerMasterDataList[i].id) {
              _expense.totalCredit += _transactionList[j].creditAmount;
            }
            _expenseList.add(_expense);
          }
        }
        _tradingAccountList.add(_tradingAccount);
      }
    } catch (e) {
      print("error on traiding account controller ${e.toString()}");
    }
  }
}
