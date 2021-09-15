import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/barchart/barchart_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';

final barChartControllerProvider =
    StateNotifierProvider<BarChartController, AsyncValue<BarChart>>(
        (ref) => BarChartController(ref.read));

class BarChartController extends StateNotifier<AsyncValue<BarChart>> {
  final Reader _read;
  BarChartController(this._read) : super(const AsyncLoading());
  loadData() async {
    // ----get all transaction----
    final data = await _read(transactionRepositoryProvider).getList();
    //-----Sort that transaction by date---
    data.sort((x, y) => x.date.compareTo(y.date));
    //-----create daily transaction----
  }
}
