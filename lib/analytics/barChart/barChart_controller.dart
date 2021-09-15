import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/barchart/barchart_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';

final barChartControllerProvider =
    StateNotifierProvider<BarChartController, AsyncValue<BarChart>>(
        (ref) => BarChartController(ref.read)..loadData());

class BarChartController extends StateNotifier<AsyncValue<BarChart>> {
  final Reader _read;
  BarChartController(this._read) : super(const AsyncLoading());

  loadData() async {
    //----Read all transaction---
    final transactionData =
        await _read(transactionRepositoryProvider).getList();
    //---Seperate Income and Expense---

    //---Sort Transaction Data by Date----------
    transactionData.sort((a, b) => a.date.compareTo(b.date));
    state = AsyncData(
      BarChart(leftTitles: [], bottomTitles: [], barChartGroupDataList: []),
    );
  }
}
