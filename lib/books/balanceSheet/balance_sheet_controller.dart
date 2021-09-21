import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/balanceSheet/balance_sheet_model.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_model.dart';
import 'package:sentezel/books/trading_account/trading_account_model.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final balanceSheetControllerProvider = StateNotifierProvider<
        BalanceSheetController, AsyncValue<List<BalanceSheet>>>(
    (ref) => BalanceSheetController(ref.read)..loadData());

class BalanceSheetController
    extends StateNotifier<AsyncValue<List<BalanceSheet>>> {
  final Reader _read;
  BalanceSheetController(this._read) : super(const AsyncValue.loading());

  loadData() async {
    try {
      List<BalanceSheet> _balanceSheetList = [];
      List<DirectIncome> _directIncomeList = [];
      List<DirectExpense> _directExpenseList = [];
      List<IndirectIncome> _indirectIncomeList = [];
      List<IndirectExpense> _indirectExpenseList = [];
      List<Asset> _assetList = [];
      int _cash = 0;
      int _bank = 0;
      int _creditors = 0;
      int _debtors = 0;
      int _capital = 0;
      final _ledgerMasterList =
          await _read(ledgerMasterRepositoryProvider).getList();
      for (int i = 0; i < _ledgerMasterList.length; i++) {
        // ------------------For Creditors and Debtors-------------------
        if (_ledgerMasterList[i].type == LedgerMasterType.party) {
          int _credit = 0;
          int _debit = 0;
          final _transactionList = await _read(transactionRepositoryProvider)
              .getTransactionByLedgerMaster(
                  ledgerMasterId: _ledgerMasterList[i].id);
          for (int j = 0; j < _transactionList.length; j++) {
            // debit side ledger null means that it is a full credit by party
            if (_transactionList[j].debitSideLedger == null &&
                _transactionList[j].assetLedgerId == null) {
              _debit += _transactionList[j].debitAmount;
              // if debit side ledger is cash/bank, its a partial credit by party
            } else if (_transactionList[j].debitSideLedger ==
                    LedgerMasterIndex.cash ||
                _transactionList[j].debitSideLedger == LedgerMasterIndex.bank) {
              if (_transactionList[j].transactionCategoryId ==
                  TransactionCategoryIndex.customerDebtSettlement) {
                _credit += _transactionList[j].debitAmount;
              } else if (_transactionList[j].transactionCategoryId ==
                  TransactionCategoryIndex.saleOfGoods) {
                _debit += _transactionList[j].debitAmount;
              }
            }
            //  credit side ledger null means that it is a full credit to party
            if (_transactionList[j].creditSideLedger == null) {
              _credit += _transactionList[j].creditAmount;
              // if credit side ledger is cash/bank, its a partial credit to party
            } else if (_transactionList[j].creditSideLedger ==
                    LedgerMasterIndex.cash ||
                _transactionList[j].creditSideLedger ==
                    LedgerMasterIndex.bank) {
              if (_transactionList[j].transactionCategoryId ==
                  TransactionCategoryIndex.businessDebtSettlement) {
                _debit -= _transactionList[j].creditAmount;
              } else {
                _credit += _transactionList[j].creditAmount;
              }
            }
          }
          if (_debit > _credit) {
            _debtors += _debit - _credit;
          } else if (_credit > _debit) {
            _creditors += _credit - _debit;
          }
          // -------------Cash & Bank-------------
          // Direct accounts
        } else if (_ledgerMasterList[i].type == LedgerMasterType.direct) {
          if (_ledgerMasterList[i].id != LedgerMasterIndex.cash &&
              _ledgerMasterList[i].id != LedgerMasterIndex.bank &&
              _ledgerMasterList[i].id != LedgerMasterIndex.capital) {
            int _incomeOrExpense =
                0; // variable for determining income or expense, 0 for income, 1 for expense,
            // variables for Income
            int _totalIncomeCredit = 0;
            int _totalIncomeDebit = 0;
            DirectIncome _directIncome = DirectIncome(
                ledgerName: _ledgerMasterList[i].name,
                totalCredit: _totalIncomeCredit,
                totalDebit: _totalIncomeDebit);
            //variables for Expense
            int _totalExpenseCredit = 0;
            int _totalExpenseDebit = 0;
            DirectExpense _directExpense = DirectExpense(
              totalCredit: _totalExpenseCredit,
              totalDebit: _totalExpenseDebit,
              ledgerName: _ledgerMasterList[i].name,
            );
            final _transactionList = await _read(transactionRepositoryProvider)
                .getTransactionByLedgerMaster(
                    ledgerMasterId: _ledgerMasterList[i].id);
            // nested loop
            for (int j = 0; j < _transactionList.length; j++) {
              final TransactionCategory _transactionCategory =
                  await _read(transactionCategoryRepositoryProvider)
                      .getItem(id: _transactionList[j].transactionCategoryId);
              // * check if the transaction is income
              if (_transactionCategory.transactionType ==
                      TransactionType.lakluh ||
                  _transactionCategory.transactionType ==
                      TransactionType.hralh) {
                _incomeOrExpense = 0;
                // check if the transacion is the particular ledger
                if (_transactionList[j].debitSideLedger ==
                    _ledgerMasterList[i].id) {
                  _directIncome.totalDebit += _transactionList[j].debitAmount;
                }
                if (_transactionList[j].creditSideLedger ==
                    _ledgerMasterList[i].id) {
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
                    _ledgerMasterList[i].id) {
                  _directExpense.totalDebit += _transactionList[j].debitAmount;
                }
                if (_transactionList[j].creditSideLedger ==
                    _ledgerMasterList[i].id) {
                  _directExpense.totalCredit +=
                      _transactionList[j].creditAmount;
                }
              }
            }
            // income a nih chuan incomelist ah a add ang
            if (_incomeOrExpense == 0) {
              _directIncomeList.add(_directIncome);
              //expense a nih chuan expenselist ah a add ang
            } else if (_incomeOrExpense == 1) {
              _directExpenseList.add(_directExpense);
            }

            //  -----exceptional case for cash and bank account-----
          }
          if (_ledgerMasterList[i].id == LedgerMasterIndex.cash ||
              _ledgerMasterList[i].id == LedgerMasterIndex.bank) {
            int _totalCredit = 0;
            int _totalDebit = 0;
            final _transactionList = await _read(transactionRepositoryProvider)
                .getTransactionByLedgerMaster(
                    ledgerMasterId: _ledgerMasterList[i].id);
            for (int j = 0; j < _transactionList.length; j++) {
              if (_transactionList[j].debitSideLedger ==
                      LedgerMasterIndex.cash ||
                  _transactionList[j].debitSideLedger ==
                      LedgerMasterIndex.bank) {
                if (_transactionList[j].mode == TransactionMode.paymentByCash ||
                    _transactionList[j].mode == TransactionMode.paymentByBank) {
                  _totalDebit += _transactionList[j].debitAmount;
                } else if (_transactionList[j].mode ==
                        TransactionMode.partialPaymentByCash ||
                    _transactionList[j].mode ==
                        TransactionMode.partialPaymentByBank) {
                  _totalDebit += _transactionList[j].partialPaymentAmount;
                }
              } else if (_transactionList[j].creditSideLedger ==
                      LedgerMasterIndex.cash ||
                  _transactionList[j].creditSideLedger ==
                      LedgerMasterIndex.bank) {
                if (_transactionList[j].mode == TransactionMode.paymentByCash ||
                    _transactionList[j].mode == TransactionMode.paymentByBank) {
                  _totalCredit += _transactionList[j].creditAmount;
                } else if (_transactionList[j].mode ==
                        TransactionMode.partialPaymentByCash ||
                    _transactionList[j].mode ==
                        TransactionMode.partialPaymentByBank) {
                  _totalCredit += _transactionList[j].partialPaymentAmount;
                }
              }
            }
            if (_ledgerMasterList[i].id == LedgerMasterIndex.cash) {
              _cash = _totalDebit - _totalCredit;
            } else if (_ledgerMasterList[i].id == LedgerMasterIndex.bank) {
              _bank = _totalDebit - _totalCredit;
            }

            // ----------------Capital Account-----------------
          } else if (_ledgerMasterList[i].id == LedgerMasterIndex.capital) {
            int _creditAmount = 0;
            int _debitAmount = 0;
            final _transactionList = await _read(transactionRepositoryProvider)
                .getTransactionByLedgerMaster(
                    ledgerMasterId: _ledgerMasterList[i].id);
            for (int j = 0; j < _transactionList.length; j++) {
              if (_transactionList[j].creditSideLedger ==
                  LedgerMasterIndex.capital) {
                _creditAmount += _transactionList[j].creditAmount;
              } else if (_transactionList[j].debitSideLedger ==
                  LedgerMasterIndex.capital) {
                _debitAmount += _transactionList[j].debitAmount;
              }
            }
            _capital = (_creditAmount - _debitAmount).abs();
          }

          // ----------------------Net Profit & Net Loss---------------
          //  indirect accounts
        } else if (_ledgerMasterList[i].type == LedgerMasterType.indirect) {
          int _incomeOrExpense =
              0; // variable for determining income or expense, 0 for income, 1 for expense,
          // variables for Income
          int _totalIncomeCredit = 0;
          int _totalIncomeDebit = 0;
          IndirectIncome _indirectIncome = IndirectIncome(
              ledgerName: _ledgerMasterList[i].name,
              totalCredit: _totalIncomeCredit,
              totalDebit: _totalIncomeDebit);
          //variables for Expense
          int _totalExpenseCredit = 0;
          int _totalExpenseDebit = 0;
          IndirectExpense _indirectExpense = IndirectExpense(
            totalCredit: _totalExpenseCredit,
            totalDebit: _totalExpenseDebit,
            ledgerName: _ledgerMasterList[i].name,
          );
          final _transactionList = await _read(transactionRepositoryProvider)
              .getTransactionByLedgerMaster(
                  ledgerMasterId: _ledgerMasterList[i].id);
          // nested loop
          for (int j = 0; j < _transactionList.length; j++) {
            final TransactionCategory _transactionCategory =
                await _read(transactionCategoryRepositoryProvider)
                    .getItem(id: _transactionList[j].transactionCategoryId);
            // * check if the transaction is income
            if (_transactionCategory.transactionType ==
                    TransactionType.lakluh ||
                _transactionCategory.transactionType == TransactionType.hralh) {
              _incomeOrExpense = 0;
              // check if the transacion is the particular ledger
              if (_transactionList[j].debitSideLedger ==
                  _ledgerMasterList[i].id) {
                _indirectIncome.totalDebit += _transactionList[j].debitAmount;
              }
              if (_transactionList[j].creditSideLedger ==
                  _ledgerMasterList[i].id) {
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
                  _ledgerMasterList[i].id) {
                _indirectExpense.totalDebit += _transactionList[j].debitAmount;
              }
              if (_transactionList[j].creditSideLedger ==
                  _ledgerMasterList[i].id) {
                _indirectExpense.totalCredit +=
                    _transactionList[j].creditAmount;
              }
            }
          }
          // income a nih chuan incomelist ah a add ang
          if (_incomeOrExpense == 0) {
            // filter cash and bank account
            if (_ledgerMasterList[i].id != LedgerMasterIndex.cash &&
                _ledgerMasterList[i].id != LedgerMasterIndex.bank) {
              _indirectIncomeList.add(_indirectIncome);
            }
            //expense a nih chuan expenselist ah a add ang
          } else if (_incomeOrExpense == 1) {
            // filter cash and bank account
            if (_ledgerMasterList[i].id != LedgerMasterIndex.cash &&
                _ledgerMasterList[i].id != LedgerMasterIndex.bank) {
              _indirectExpenseList.add(_indirectExpense);
            }
          }
          // -----------------Asset Ledgers----------------
        } else if (_ledgerMasterList[i].type == LedgerMasterType.asset) {
          int _amount = 0;
          final _transactionList = await _read(transactionRepositoryProvider)
              .getTransactionByLedgerMaster(
                  ledgerMasterId: _ledgerMasterList[i].id);
          for (int j = 0; j < _transactionList.length; j++) {
            _amount += _transactionList[j].debitAmount;
          }
          Asset asset = Asset(name: _ledgerMasterList[i].name, amount: _amount);
          _assetList.add(asset);
        }
      }

      // calculation of gross profit and gross loss
      int _directExpenseTotal = 0;
      int _directIncomeTotal = 0;
      int _grossProfit = 0;
      int _grossLoss = 0;
      for (var element in _directExpenseList) {
        _directExpenseTotal += (element.totalCredit - element.totalDebit).abs();
      }
      for (var element in _directIncomeList) {
        _directIncomeTotal += (element.totalCredit - element.totalDebit).abs();
      }
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
      for (var element in _indirectExpenseList) {
        _indirectExpenseTotal +=
            (element.totalCredit - element.totalDebit).abs();
      }
      for (var element in _indirectIncomeList) {
        _indirectIncomeTotal +=
            (element.totalCredit - element.totalDebit).abs();
      }
      if ((_grossLoss + _indirectExpenseTotal) >
          (_grossProfit + _indirectIncomeTotal)) {
        _netLoss = (_grossLoss + _indirectExpenseTotal) -
            (_grossProfit + _indirectIncomeTotal);
      } else if ((_grossLoss + _indirectExpenseTotal) <
          (_grossProfit + _indirectIncomeTotal)) {
        _netProfit = (_grossProfit + _indirectIncomeTotal) -
            (_grossLoss + _indirectExpenseTotal);
      }
      // add to the Balance Sheet List
      BalanceSheet _balanceSheet = BalanceSheet(
          creditors: _creditors,
          debtors: _debtors,
          capital: _capital,
          netProfit: _netProfit,
          netLoss: _netLoss,
          cash: _cash,
          bank: _bank,
          asset: _assetList);
      _balanceSheetList.add(_balanceSheet);
      state = AsyncData(_balanceSheetList);
    } catch (e) {
      throw (e.toString());
    }
  }
}
