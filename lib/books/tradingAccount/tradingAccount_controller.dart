import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransaction_model.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

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
      // ----Get all transaction---------
      for (int i = 0; i < ledgerMasterList.length; i++) {
        final transactionList = await _read(transactionRepositoryProvider)
            .getList(ledgerMasterId: ledgerMasterList[i].id);
        for (int j = 0; j < transactionList.length; j++) {
          //----check transaction for income or expense----
          int amount = 0;
          //get categor-------
          final category = await _read(transactionCategoryRepositoryProvider)
              .getItem(id: transactionList[j].transactionCategoryId);
          if (category.transactionType == TransactionType.lakluh ||
              category.transactionType == TransactionType.hralh) {
            //---income side
            amount += transactionList[i].debitAmount;
          }
        }
      }
    } catch (e) {
      print("error on traiding account controller ${e.toString()}");
    }
  }
}
