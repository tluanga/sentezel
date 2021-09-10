import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

class AnalyticsController extends StateNotifier<AsyncValue<Analytics>> {
  Reader _read;
  AnalyticsController(this._read) : super(AsyncLoading());

  loadData() async {
    //----Read all transaction---
    _read(transactionRepositoryProvider).getList();
  }
}
