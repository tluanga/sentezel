import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransaction_model.dart';
import 'package:sentezel/books/tradingAccount/expense_model.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/common/enums/debitOrCredit_enum.dart';
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
      final ledgerMasterList = await _read(ledgerMasterRepositoryProvider)
          .getList(type: LedgerMasterType.direct);

      print('list chu ${ledgerMasterList.length}');

      List<Expense> _directExpense = [];

      List<TradingAccount> tradingAccountList = [];

      //---------Iterate Ledger Master List----------
      for (int i = 0; i < ledgerMasterList.length; i++) {
        final _transactionList = await _read(transactionRepositoryProvider)
            .getTransactionByLedgerMaster(
                ledgerMasterId: ledgerMasterList[i].id);

        List<LedgerTransaction> _ledgerTransactionList = [];
        int _creditAmount = 0;
        int _debitAmount = 0;
        List<Expense> _expense = [];
        List<Income> _income = [];
        TradingAccount _tradingAccount = TradingAccount(
          ledgerName: ledgerMasterList[i].name,
          creditAmount: _creditAmount,
          debitAmount: _debitAmount,
          expense: _expense,
          income: _income,
        );

        // print('no of list is ${_transactionList.length}');

        for (int j = 0; j < _transactionList.length; j++) {
          LedgerTransaction _ledgerTransaction = LedgerTransaction(
            amount: 0,
            debitOrCredit: DebitOrCredit.credit,
            transaction: _transactionList[j],
          );

          //---get transaction category
          TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);

          //---direct chu a ni vek sa tawh e, enge kan mamawh tak kha
          //-- expense leh income a hran kha

          if (_transactionCategory.transactionType == TransactionType.hralh ||
              _transactionCategory.transactionType == TransactionType.lakluh) {
            //heihi income , tihian a dik hleitheilo a, ka hrethiam chiahlo
            //database hit lo hian test i lo siam dawn a mi le
            //test in a sam berin ka ring
            _tradingAccount.debitAmount += _transactionList[j].debitAmount;
            _ledgerTransaction.amount = _transactionList[j].debitAmount;
            _ledgerTransaction.debitOrCredit = DebitOrCredit.debit;
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah) {
            _tradingAccount.creditAmount += _transactionList[j].creditAmount;
            _ledgerTransaction.amount = _transactionList[j].creditAmount;
            _ledgerTransaction.debitOrCredit = DebitOrCredit.credit;
          }
          _ledgerTransactionList.add(_ledgerTransaction);
          //--- git hub ah lo push teh a, ka lo en ve ange.
          // test chu lo ziak la aw

        }
        //----add into the model of the calculated list
        tradingAccountList.add(_tradingAccount);
      }
      state = AsyncData(tradingAccountList);
    } catch (e) {
      print("error on traiding account controller ${e.toString()}");
    }
  }
}
