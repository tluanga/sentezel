import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

class BarChartController extends StateNotifier<AsyncValue<Analytics>> {
  Reader _read;
  BarChartController(this._read) : super(AsyncLoading());

  loadData() async {
    //----Read all transaction---
    final transactionData =
        await _read(transactionRepositoryProvider).getList();
    //---Seperate Income and Expense---
    for (int i = 0; i < transactionData.length; i++) {
      //---Sort Transaction Data by Date----------
      transactionData.sort((a, b) => a.date.compareTo(b.date));

      //   final _category = await _read(transactionCategoryRepositoryProvider)
      //       .getItem(id: transactionData[i].transactionCategoryId);

      //   if (_category.transactionType == TransactionType.hralh ||
      //       _category.transactionType == TransactionType.lakluh) {

      //       }
    }
  }
}
