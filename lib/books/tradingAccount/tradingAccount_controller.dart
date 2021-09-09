import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';

class TradingAccountController
    extends StateNotifier<AsyncValue<List<TradingAccount>>> {
  Reader _read;
  TradingAccountController(this._read) : super(AsyncValue.loading());
  loadData() async {
    try {
      List<TradingAccount> _tradingAccountList = [];
      final transactionList = await _read(transactionRepositoryProvider)
          .getList(type: LedgerMasterType.direct);
      transactionList.forEach((element) {
        _tradingAccountList.add(
          TradingAccount(
            ledgerName: ,
            creditAmount: element.creditAmount,
            debitAmount: element.debitAmount
          )
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
