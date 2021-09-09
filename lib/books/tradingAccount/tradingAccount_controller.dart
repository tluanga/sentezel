import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

class TradingAccountController extends StateNotifier<TradingAccount> {
  Reader _read;
  const TradingAccountController(this._read) : super();
  loadData() async {
    final result = await _read(transactionRepositoryProvider).getList();
  }
}
