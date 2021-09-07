import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';

import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final paymentTypeSelectControllerProvider = StateNotifierProvider<
    PaymentTypeSelectController, AsyncValue<List<TransactionCategory>>>(
  (ref) => PaymentTypeSelectController(ref.read)..loadData(categoryName: ''),
);

class PaymentTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  Reader _read;

  PaymentTypeSelectController(this._read) : super(AsyncValue.loading());

  loadData({String categoryName = ''}) async {
    print('Load data');
    try {
      final result = await _read(transactionCategoryRepositoryProvider).getList(
        searchString: categoryName,
        type: TransactionType.pekchhuah,
      );

      state = AsyncData(result);
    } catch (e) {
      print(e.toString());
    }
  }
}
