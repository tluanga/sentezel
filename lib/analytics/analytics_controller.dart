import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';

final analyticsControllerProvider =
    StateNotifierProvider<AnalyticsController, AsyncValue<Analytics>>(
        (ref) => AnalyticsController(ref.read)..loadData());

class AnalyticsController extends StateNotifier<AsyncValue<Analytics>> {
  final Reader _read;
  AnalyticsController(this._read) : super(const AsyncLoading());

  loadData() async {
    //----Read all transaction---
    final data = await _read(transactionRepositoryProvider).getList(
      startDate: DateTime.now().subtract(
        const Duration(days: 7),
      ),
    );
    data.sort((a, b) => a.date.compareTo(b.date));

    // seperate expense and income
  }

  generateBarChartDataItem(List<Transaction> data) async {
    //Sort each transaction by day

    // for(int i=0;i<data.length;i++){
    //     BarChartDataItem _barChartDataItem;
    //   final _category=await _read(transactionCategoryRepositoryProvider).getItem(id: data[i].transactionCategoryId);
    //   if(_category.transactionType==TransactionType.lei||_category.transactionType==TransactionType.pekchhuah||
    //   _category.transactionType==TransactionType.debtRepaymentToCreditor){
    //       _barChartDataItem.expense=
    //   }
    // }
  }
}
