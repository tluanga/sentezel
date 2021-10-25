import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/trial_balance/trial_balance_model.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';

final trialBalanceControllerProvider = StateNotifierProvider<
    TrialBalanceController, AsyncValue<List<TrialBalance>>>(
  (ref) => TrialBalanceController(ref.read)..loadData(),
);

class TrialBalanceController
    extends StateNotifier<AsyncValue<List<TrialBalance>>> {
  final Reader _read;
  TrialBalanceController(this._read) : super(const AsyncValue.loading());
  loadData() async {
    try {
      // get all ledger master
      final _ledgerMasterList =
          await _read(ledgerMasterRepositoryProvider).getList();
      List<TrialBalance> _trialBalanceList = [];
      int _creditorsBalance = 0;
      int _debtorsBalance = 0;
      for (int i = 0; i < _ledgerMasterList.length; i++) {
        // For party Ledgers
        if (_ledgerMasterList[i].type == LedgerMasterType.party) {
          int _totalCredit = 0;
          int _totalDebit = 0;
          final _transactionList = await _read(transactionRepositoryProvider)
              .getTransactionByLedgerMaster(
                  ledgerMasterId: _ledgerMasterList[i].id);
          for (int j = 0; j < _transactionList.length; j++) {
            //  settlements
            if (_transactionList[j].transactionCategoryId ==
                TransactionCategoryIndex.customerDebtSettlement) {
              _totalCredit += _transactionList[j].creditAmount;
            } else if (_transactionList[j].transactionCategoryId ==
                TransactionCategoryIndex.businessDebtSettlement) {
              _totalDebit += _transactionList[j].debitAmount;
            } else {
              // for full credit
              if (_transactionList[j].mode == TransactionMode.credit) {
                if (_transactionList[j].creditSideLedger == null) {
                  _totalCredit += _transactionList[j].creditAmount;
                } else if (_transactionList[j].debitSideLedger == null) {
                  _totalDebit += _transactionList[j].debitAmount;
                }
                // partial payments
              } else if (_transactionList[j].mode ==
                      TransactionMode.partialPaymentByCash ||
                  _transactionList[j].mode ==
                      TransactionMode.partialPaymentByBank) {
                if (_transactionList[j].creditSideLedger ==
                        LedgerMasterIndex.cash ||
                    _transactionList[j].creditSideLedger ==
                        LedgerMasterIndex.bank) {
                  _totalCredit += _transactionList[j].creditAmount;
                } else if (_transactionList[j].debitSideLedger ==
                        LedgerMasterIndex.cash ||
                    _transactionList[j].debitSideLedger ==
                        LedgerMasterIndex.bank) {
                  _totalDebit += _transactionList[j].debitAmount;
                }
              }
            }
            // For settlements
            // if there is settlement, debtors or creditors amount is reduced
            // if (_transactionList[j].transactionCategoryId ==
            //     TransactionCategoryIndex.customerDebtSettlement) {
            //   _totalDebitForAPartyLedger -= _transactionList[j].creditAmount;
            // }
            // if (_transactionList[j].transactionCategoryId ==
            //     TransactionCategoryIndex.businessDebtSettlement) {
            //   _totalCreditForAPartyLedger -= _transactionList[j].debitAmount;
            // }
          }
          if (_totalCredit > _totalDebit) {
            _creditorsBalance += _totalCredit - _totalDebit;
          } else if (_totalCredit < _totalDebit) {
            _debtorsBalance += _totalDebit - _totalCredit;
          }
        }
        // for non party Ledgers
        else if (_ledgerMasterList[i].type != LedgerMasterType.party) {
          int _totalDebit = 0;
          int _totalCredit = 0;
          String _ledgerName = _ledgerMasterList[i].name;
          // get transactions of each ledger Master
          final _transactionList = await _read(transactionRepositoryProvider)
              .getTransactionByLedgerMaster(
                  ledgerMasterId: _ledgerMasterList[i].id);
          for (int j = 0; j < _transactionList.length; j++) {
            // 1. Full Payment by cash or bank
            if (_transactionList[j].mode == TransactionMode.paymentByBank ||
                _transactionList[j].mode == TransactionMode.paymentByCash) {
              if (_transactionList[j].debitSideLedger ==
                  _ledgerMasterList[i].id) {
                _totalDebit += _transactionList[j].debitAmount;
              } else if (_transactionList[j].creditSideLedger ==
                  _ledgerMasterList[i].id) {
                _totalCredit += _transactionList[j].creditAmount;
              }
              // for asset ledgers
              if (_transactionList[j].assetLedgerId ==
                  _ledgerMasterList[i].id) {
                _totalDebit += _transactionList[j].debitAmount;
              }
              // 2. credit
            } else if (_transactionList[j].mode == TransactionMode.credit) {
              if (_transactionList[j].creditSideLedger == null) {
                _totalDebit += _transactionList[j].creditAmount;
              } else if (_transactionList[j].debitSideLedger == null) {
                _totalCredit += _transactionList[j].debitAmount;
              }
              // 3. Partial payment by bank or cash
            } else if (_transactionList[j].mode ==
                    TransactionMode.partialPaymentByCash ||
                _transactionList[j].mode ==
                    TransactionMode.partialPaymentByBank) {
              // exceptional case for cash and bank ledgers
              if (_ledgerMasterList[i].id == LedgerMasterIndex.cash ||
                  _ledgerMasterList[i].id == LedgerMasterIndex.bank) {
                if (_transactionList[j].creditSideLedger ==
                        LedgerMasterIndex.cash ||
                    _transactionList[j].creditSideLedger ==
                        LedgerMasterIndex.bank) {
                  _totalCredit += _transactionList[j].partialPaymentAmount;
                } else if (_transactionList[j].debitSideLedger ==
                        LedgerMasterIndex.cash ||
                    _transactionList[j].debitSideLedger ==
                        LedgerMasterIndex.bank) {
                  _totalDebit += _transactionList[j].partialPaymentAmount;
                }
                // for other ledgers
              } else {
                if (_transactionList[j].debitSideLedger ==
                    _ledgerMasterList[i].id) {
                  _totalDebit += _transactionList[j].debitAmount;
                } else if (_transactionList[j].creditSideLedger ==
                    _ledgerMasterList[i].id) {
                  _totalCredit += _transactionList[j].creditAmount;
                }

                // for asset ledger
                if (_transactionList[j].assetLedgerId ==
                    _ledgerMasterList[i].id) {
                  _totalDebit += _transactionList[j].debitAmount;
                }
              }
              // 4. contra
            } else if (_transactionList[j].mode == TransactionMode.contra) {
              // for cash ledger
              if (_ledgerMasterList[i].id == LedgerMasterIndex.cash) {
                if (_transactionList[j].transactionCategoryId ==
                    TransactionCategoryIndex.bankToCash) {
                  _totalDebit += _transactionList[j].debitAmount;
                } else if (_transactionList[j].transactionCategoryId ==
                    TransactionCategoryIndex.cashToBank) {
                  _totalCredit += _transactionList[j].creditAmount;
                }
                // for bank ledger
              } else if (_ledgerMasterList[i].id == LedgerMasterIndex.bank) {
                if (_transactionList[j].transactionCategoryId ==
                    TransactionCategoryIndex.cashToBank) {
                  _totalDebit += _transactionList[j].debitAmount;
                } else if (_transactionList[j].transactionCategoryId ==
                    TransactionCategoryIndex.bankToCash) {
                  _totalCredit += _transactionList[j].creditAmount;
                }
              }
            }
          }
          TrialBalance _trialBalance = TrialBalance(
              ledgerName: _ledgerName,
              totalCredit: _totalCredit,
              totalDebit: _totalDebit,
              balance: (_totalCredit - _totalDebit).abs());
          if (_trialBalance.balance != 0) {
            _trialBalanceList.add(_trialBalance);
          }
        }
      }
      // add creditors to trial balance list if the balance is not zero
      TrialBalance _creditors = TrialBalance(
          ledgerName: 'Creditors',
          totalCredit: _creditorsBalance,
          totalDebit: 0,
          balance: _creditorsBalance);
      if (_creditors.balance != 0) {
        _trialBalanceList.add(_creditors);
      }
      // add debtors to trial balance list if the balance is not zero
      TrialBalance _debtors = TrialBalance(
          ledgerName: 'Debtors',
          totalCredit: 0,
          totalDebit: _debtorsBalance,
          balance: _debtorsBalance);
      if (_debtors.balance != 0) {
        _trialBalanceList.add(_debtors);
      }
      state = AsyncData(_trialBalanceList);
    } catch (e) {
      throw (e.toString());
    }
  }
}
// print('''
//   ledgerMaster ${_ledgerMasterList[i].name} id ${_ledgerMasterList[i].id}
//   id ${_transactionList[j].id}
//   assetLedgerId ${_transactionList[j].assetLedgerId}
//   creditAmount ${_transactionList[j].creditAmount}
//   creditSideLedger ${_transactionList[j].creditSideLedger}
//     debitAmount${_transactionList[j].debitAmount}
//   debitSideLedger ${_transactionList[j].debitSideLedger}
//   mode ${_transactionList[j].mode}
//   partialPaymentAmount ${_transactionList[j].partialPaymentAmount}
//   particular ${_transactionList[j].particular}
//   partyLedgerId ${_transactionList[j].partyLedgerId}
//   transactionCategoryId ${_transactionList[j].transactionCategoryId}
// ''');

// print('''
//     -----------------party ledgers------------------------
//     ledgerMaster ${_ledgerMasterList[i].name} id ${_ledgerMasterList[i].id}
//     id ${_transactionList[j].id}
//     assetLedgerId ${_transactionList[j].assetLedgerId}
//     creditAmount ${_transactionList[j].creditAmount}
//     creditSideLedger ${_transactionList[j].creditSideLedger}
//       debitAmount${_transactionList[j].debitAmount}
//     debitSideLedger ${_transactionList[j].debitSideLedger}
//     mode ${_transactionList[j].mode}
//     partialPaymentAmount ${_transactionList[j].partialPaymentAmount}
//     particular ${_transactionList[j].particular}
//     partyLedgerId ${_transactionList[j].partyLedgerId}
//     transactionCategoryId ${_transactionList[j].transactionCategoryId}
//   ''');
