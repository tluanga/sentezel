import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';

import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final receiptTypeSelectControllerProvider = StateNotifierProvider<
    ReceiptTypeSelectController, AsyncValue<List<TransactionCategory>>>(
  (ref) => ReceiptTypeSelectController(ref.read)..loadData(categoryName: ''),
);

class ReceiptTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  Reader _read;

  ReceiptTypeSelectController(this._read) : super(AsyncValue.loading());

  loadData({String categoryName = ''}) async {
    print('Load data');
    try {
      final result = await _read(transactionCategoryRepositoryProvider).getList(
        searchString: categoryName,
        type: TransactionType.lakluh,
      );

      state = AsyncData(result);
    } catch (e) {
      print(e.toString());
    }
  }
}
